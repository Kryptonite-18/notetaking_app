import 'package:flutter/material.dart';

class AddItemPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 30, 50),
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Add Your Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber[50]),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.amber[800],
                    decoration: InputDecoration(
                        focusColor: Colors.amber[800],
                        focusedBorder: InputBorder.none,
                        hintText: "Title your note here...."),
                  ),
                  SizedBox(height: 46),
                  TextField(
                    controller: bodyController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        focusColor: Colors.amber[800],
                        focusedBorder: InputBorder.none,
                        hintText: "Write your note here...."),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shadowColor: Colors.blue,
                  backgroundColor: Colors.amber[800],
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              onPressed: () async {
                FocusScope.of(context).unfocus();

                var newItem;
                if (titleController.text.isEmpty &&
                    bodyController.text.isEmpty) {
                  newItem = null;
                } else {
                  newItem = {
                    'title': titleController.text,
                    'body': bodyController.text,
                  };
                }
                Navigator.of(context).pop(newItem);
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
