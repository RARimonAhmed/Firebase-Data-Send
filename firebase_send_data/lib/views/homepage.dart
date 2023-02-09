import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_send_data/views/user_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future sendData() async {
    final data = FirebaseFirestore.instance;
    data.collection("UserInformation").add({
      'Name': 'Bahar',
      'Age': 22.toString(),
      'CGPA': 3.15.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Send Data To Cloud'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (() {
              sendData();
            }),
            child: const Text(
              'Send Data',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const UserDetails())));
            }),
            child: const Text(
              'View User',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20,
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
