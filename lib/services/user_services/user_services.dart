import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/models/appointment_data_model.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<bool> addUserData(
      String childName, String gender, DateTime dateTime) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('appointmentData')
          .add({
        'childName': childName,
        'gender': gender,
        'dateTime': Timestamp.fromDate(dateTime),
      });
      debugPrint("Data added successfully");
      return true;
    } catch (e) {
      debugPrint("Error adding data: $e");
      return false;
    }
  }

  Future<List<AppointmentDataModel>> getUserData() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('appointmentData')
          .get();

      return querySnapshot.docs.map((doc) {
        return AppointmentDataModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      debugPrint("Error retrieving data: $e");
      return [];
    }
  }
}
