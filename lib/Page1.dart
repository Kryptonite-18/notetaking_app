import 'package:flutter/material.dart';
import 'MyHomePage.dart';

class Page1 extends StatelessWidget {
  final List<Map<String, String>> itemList;

  Page1(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 30, 50),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final item = itemList[index];
                  return NoteTile(
                    title: item['title'] ?? '',
                    body: item['body'] ?? '',
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
