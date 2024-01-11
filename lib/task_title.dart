// import 'package:flutter/material.dart';

// class TaskPage extends StatelessWidget {
//   var title;
//   var task;
//   List tasks = [];
//   List taskTitle = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(60),
//           color: Colors.amber[500],
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Container(
//               padding: EdgeInsets.all(40),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(30)),
//               child: TextField(
//                 onChanged: (value) {
//                   title = value;
//                 },
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                     hintText: "title your note...",
//                     floatingLabelAlignment: FloatingLabelAlignment.start),
//               ),
//             ),
//             TextButton(
//                 onPressed: () {
//                   taskTitle.add(title);
//                   Navigator.push(context, route)
//                   print(taskTitle[0]);
//                 },
//                 child: Text("ADD")),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               padding: EdgeInsets.all(40),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(30)),
//               child: TextField(
//                 onChanged: (value) {
//                   task = value;
//                 },
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                     hintText: "Your note..",
//                     floatingLabelAlignment: FloatingLabelAlignment.start),
//               ),
//             ),
//             TextButton(
//                 onPressed: () {
//                   tasks.add(task);
//                   print(task[0]);
//                 },
//                 child: Text("ADD")),
//           ]),
//         ),
//       ),
//     );
//   }
// }
