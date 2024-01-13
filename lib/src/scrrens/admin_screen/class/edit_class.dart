import 'package:class_tracker/src/data/models/class_model.dart';
import 'package:flutter/material.dart';

import '../../../data/remort_data_source/firestore_helper.dart';

class EditClass extends StatefulWidget {
  final ClassModel class1;
  const EditClass({Key? key, required this.class1}) : super(key: key);

  @override
  _EditClassState createState() => _EditClassState();
}

class _EditClassState extends State<EditClass> {
  TextEditingController? _subjectController;
  TextEditingController? _teacherNameController;
  TextEditingController? _locationController;

// contrllers tika initialized karanwa
  @override
  void initState() {
    _subjectController = TextEditingController(text: widget.class1.subject);
    _teacherNameController =
        TextEditingController(text: widget.class1.teachername);

    _locationController = TextEditingController(text: widget.class1.location);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _subjectController!.dispose();
    _teacherNameController!.dispose();
    _locationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
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

             InkWell(
  onTap: () {
    FirestoreHelper.update(ClassModel(
      id: widget.class1.id,
      subject: _subjectController!.text,
      teachername: _teacherNameController!.text,
      location: _locationController!.text,
    )).then((value) {
      Navigator.pop(context);
    });

    //print("create data");
    //_create();
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
                        "Update",
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
              // Add your widgets for editing here
            ],
          ),
        ),
      ),
    );
  }
}
