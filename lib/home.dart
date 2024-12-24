import 'package:flutter/material.dart';
import 'package:shared/cached.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});
  TextEditingController nameController = TextEditingController();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String name="";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.nameController,
            decoration:  InputDecoration(
              hintText: 'Enter your name',
              border:

                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
            ),


          ),
        ),

        Text(name??"", style: TextStyle(fontSize: 20),),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              CachedData.storeData("name", widget.nameController.text);
              widget.nameController.clear();

            });
          },
          child: Text('Save'),
        ),
        MaterialButton(
          color: Colors.green,
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              name = CachedData.getData("name");
              // CachedData().storeData('name', widget.nameController.text);
              // widget.nameController.clear();
            });
          },
          child: Text('display'),
        ),
        MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              CachedData.removeData("name");
              name="";

              // CachedData().storeData('name', widget.nameController.text);
              // widget.nameController.clear();
            });
          },
          child: Text('delete'),
        ),
      ],
    );
  }
}
