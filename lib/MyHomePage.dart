import 'dart:io';

import 'package:flutter/material.dart';
import 'AdditemPage.dart';
import 'Page2.dart';
import 'Page1.dart';
import 'EditPage.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  Widget tile() {
    return ListTile();
  }

  void updateNoteInList(int index, String updatedTitle, String updatedBody) {
    setState(() {
      final Map<String, String> updatedNote = {
        'title': updatedTitle,
        'body': updatedBody,
      };

      // Check if the index is within the bounds of the itemList
      if (index >= 0 && index < itemList.length) {
        itemList[index] = updatedNote;
      }
    });
  }

  void deleteNoteFromList(int index) {
    setState(() {
      if (index >= 0 && index < itemList.length) {
        itemList.removeAt(index);
      }
    });
  }

  List<Map<String, String>> itemList = [];

  void addTask() {}

  @override
  Widget build(BuildContext context) {
    var page;
    switch (selectedIndex) {
      case 0:
        page = Page1(itemList);
        break;

      case 1:
        page = Page2();
        break;

      default:
        Center(
          child: Text("Nothing is there"),
        );
    }
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.amber[800],
            destinations: [
              NavigationRailDestination(
                  icon: Icon(
                    Icons.book_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.book,
                    color: Color.fromARGB(255, 4, 30, 50),
                    weight: 40,
                  ),
                  label: Text("NoteTaking")),
              NavigationRailDestination(
                  selectedIcon: Icon(
                    Icons.music_note,
                    color: Color.fromARGB(255, 4, 30, 50),
                  ),
                  icon: Icon(Icons.music_note_outlined),
                  label: Text("Quotes")),
            ],
            groupAlignment: 0,
            leading: FloatingActionButton(
              hoverColor: Colors.amber[500],
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 4, 30, 50),
              onPressed: () async {
                final newItem = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddItemPage()));

                if (newItem != null) {
                  setState(() {
                    itemList.add(newItem);
                  });
                }
              },
              child: Icon(Icons.add),
            ),
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
          VerticalDivider(
            width: 4,
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 4, 30, 50),
              child: page,
            ),
          )
        ],
      ),
    ));
  }
}

class NoteTile extends StatelessWidget {
  final String title;
  final String body;
  final int index;

  NoteTile({
    required this.title,
    required this.body,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    icon = Icons.delete_outline;
    IconData icon1;
    icon1 = Icons.edit;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromARGB(255, 31, 64, 92)),
      child: Column(
        children: [
          Text(
            title, // Use the 'title' parameter here
            style: TextStyle(
                color: Colors.amber[800],
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          ListTile(
            subtitle: Text(
              body, // Use the 'body' parameter here
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.all(10),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  final updateNote = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPage(
                        title,
                        body,
                      ),
                    ),
                  );

                  if (updateNote != null) {
                    final updatedTitle = updateNote['title'];
                    final updatedBody = updateNote['body'];

                    // Now you can update the note in the itemList
                    (context as Element)
                        .findAncestorStateOfType<_MyHomePageState>()
                        ?.updateNoteInList(index, updatedTitle, updatedBody);
                  }
                },
                icon: Icon(icon1),
                color: Colors.white,
                alignment: Alignment.bottomRight,
              ),
              IconButton(
                onPressed: () {
                  // Call a function to delete the note here
                  (context as Element)
                      .findAncestorStateOfType<_MyHomePageState>()
                      ?.deleteNoteFromList(index);
                },
                icon: Icon(icon),
                color: Colors.white,
                alignment: Alignment.bottomRight,
              ),
            ],
          )
        ],
      ),
    );
  }
}
