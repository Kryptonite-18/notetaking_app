import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final String initialTitle;
  final String initialBody;
  EditPage(this.initialTitle, this.initialBody);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  final TextEditingController updatetitleController = TextEditingController();

  final TextEditingController updatebodyController = TextEditingController();

  void initState() {
    super.initState();
    updatetitleController.text = widget.initialTitle;
    updatebodyController.text = widget.initialBody;
  }

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
              child: TextField(
                controller: updatetitleController,
                textAlign: TextAlign.center,
                cursorColor: Colors.amber[800],
                decoration: InputDecoration(
                    focusColor: Colors.amber[800],
                    focusedBorder: InputBorder.none,
                    hintText: "Title your note here...."),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber[50]),
              child: TextField(
                controller: updatebodyController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    focusColor: Colors.amber[800],
                    focusedBorder: InputBorder.none,
                    hintText: "Write your note here...."),
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
              onPressed: () {
                final updatedTitle = updatetitleController.text;
                final updatedBody = updatebodyController.text;

                Navigator.pop(
                    context, {'title': updatedTitle, 'body': updatedBody});
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
