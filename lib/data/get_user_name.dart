import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  
  const GetUserName({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // Get the Collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text('First Name: ${data['first name']}');
        } else {
          return const CircularProgressIndicator(); // Exibe um indicador de carregamento enquanto os dados estão sendo buscados
        }
      }
    );
  }
}
