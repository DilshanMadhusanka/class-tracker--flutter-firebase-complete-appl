import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/models/class_model.dart';
import '../../../data/remort_data_source/firestore_helper.dart';
import 'edit_class.dart';

class ClassManagment extends StatefulWidget {
  const ClassManagment({Key? key}) : super(key: key);

  @override
  State<ClassManagment> createState() => _ClassManagmentState();
  //_ClassManagmentState createState() => _ClassManagmentState();
}

class _ClassManagmentState extends State<ClassManagment> {
  // create controllers
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _teacherNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
//-----------------------------------------------
//DateTime? _selectedDate;
//-------------------------------
  @override
  void dispose() {
    _subjectController.dispose();
    _teacherNameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  // Your state implementation goes here

  @override
  Widget build(BuildContext context) {
    // Your widget build method goes here
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Class-Management"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "subject name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teacherNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "teacher name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "location"),
              ),
              const SizedBox(
                height: 10,
              ),

              // create a button

              InkWell(
                onTap: () {
                  //print("create data");
                  //_create();

                  FirestoreHelper.create(ClassModel(
                      subject: _subjectController.text,
                      teachername: _teacherNameController.text,
                      location: _locationController.text,
                      //date: _selectedDate,
                      ));

                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                // Your widget body goes here
              ),
              const SizedBox(
                height: 10,
              ),

              // create a list view

              StreamBuilder<List<ClassModel>>(
                  stream: FirestoreHelper.read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("some error occured"),
                      );
                    }

                    if (snapshot.hasData) {
                      final classData = snapshot.data;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: classData!
                              .length, // Replace with the actual number of items in your list
                          itemBuilder: (context, index) {
                            final singleclass = classData[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                // delete methode eka implement kranwa

                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Delete"),
                                        content: const Text(
                                            "Are you sure you want to delete"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              FirestoreHelper.delete(
                                                      singleclass)
                                                  .then((value) {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child:  Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },

                                

                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.deepPurple,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                title: Text("${singleclass.subject}"),
                                subtitle: Text("${singleclass.teachername}"),









                                // edit button eka hadanwa

                                trailing: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditClass(
                                                    class1: ClassModel(
                                                        subject:
                                                            singleclass.subject,
                                                        teachername: singleclass
                                                            .teachername,
                                                        location: singleclass
                                                            .location,
                                                        id: singleclass.id),
                                                  )));
                                    },
                                    child: Icon(Icons.edit)),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );








                  })
            ],
          ),
        ),
      ),
    );
  }

/* 
// issellam hadankot mehema denna puluwan. code eken data bse eka hadnkot uda hadpu controllers use kranna 

    await docRef.set({
      "classname": "Maths",
       "location": "abc",
        "age": 23});
  }

  */
}
