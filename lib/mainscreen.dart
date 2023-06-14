// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             const Text("\nTasks"),
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance.collection("tasks").snapshots(),
//                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot), {
//                 if(snapshot.hasData) {
//                   final snap = snapshot.data!.docs;
//                   return ListView.builder(
//                   shrinkWrap: true,
//                   primary: false;
//                   itemCount: snap.length,
//                   itemBuilder: (context, index) {
//                     return Text(snap[index]['name'] + "  ");
//                     }
//                   );
//                 } else {
//                   return const SizedBox();
//             }
//
//             }
//             )
//           ],
//         ),
//       ),
//
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("\nTasks"),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("tasks").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Text(snap[index]['name'] + "  ");
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

