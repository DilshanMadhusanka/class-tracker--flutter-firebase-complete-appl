import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late List<Map<String, dynamic>> students;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Attendance Marking', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Number of Students: ${students.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: StudentAttendanceList(
              students: students,
              onAttendanceChanged: _onAttendanceChanged,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                int presentCount =
                    students.where((student) => student['isPresent']).length;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Total Present Students'),
                      content: Text('Total Present: $presentCount'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Change the button color
                padding: EdgeInsets.all(15), // Adjust padding
              ),
              child: Text('Show Total Present Students',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  void _fetchStudents() async {
    var snapshot =
        await FirebaseFirestore.instance.collection('students').get();
    setState(() {
      students = snapshot.docs
          .map((doc) => {...doc.data()!, 'id': doc.id, 'isPresent': false})
          .toList();
    });
  }

  void _onAttendanceChanged(int index, bool isPresent) {
    setState(() {
      students[index]['isPresent'] = isPresent;
    });
  }
}

class StudentAttendanceList extends StatelessWidget {
  final List<Map<String, dynamic>> students;
  final Function(int, bool) onAttendanceChanged;

  StudentAttendanceList(
      {required this.students, required this.onAttendanceChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        var student = students[index];
        var fullName = '${student['firstName']} ${student['lastName']}';
        var isPresent = student['isPresent'];

        return Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 1.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text(fullName),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    onAttendanceChanged(index, true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isPresent
                        ? Colors.green
                        : Colors.blue, // Change color based on isPresent
                  ),
                  child: Text('Present'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    onAttendanceChanged(index, false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !isPresent
                        ? Colors.red
                        : Colors.blue, // Change color based on isPresent
                  ),
                  child: Text('Absent'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
