import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Future getData() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await fireStore.collection("UserInformation").get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      leading: Text(documentSnapshot['Age']),
                      title: Text(documentSnapshot['Name']),
                      trailing: Text(documentSnapshot['CGPA']),
                    ),
                  );
                }));
          }
        }));
  }
}
