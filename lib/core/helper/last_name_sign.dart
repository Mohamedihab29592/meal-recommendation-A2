// user_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserService {
  /// Fetches the name of the last user who logged in from Firestore.
  Future<String> fetchLastName() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('users').get();
      if (querySnapshot.docs.isNotEmpty) {
        // Firestore documents are already in order by creation
        final lastDocument = querySnapshot.docs.last;
        final userData = lastDocument.data();
        return userData['userName'] ?? 'No Name';
      } else {
        return 'No Users Found';
      }
    } catch (e) {
      debugPrint('Error fetching last name: $e');
      return 'Error Fetching Name';
    }
  }
}
