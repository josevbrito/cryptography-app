import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/layouts/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // Document IDs
  List<String> docIDs = [];

  // Get docIDs
  Future getDocID() async {
  try {
    await FirebaseFirestore.instance.collection('users').get().then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIDs.add(document.reference.id);
      })
    );
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  }

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home Page'),
      body: Center(
        child: Text(
          'Home Page'
        ),
      ),
    );
  }
}