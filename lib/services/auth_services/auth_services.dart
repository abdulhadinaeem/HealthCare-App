import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user
  Future<String?> registerUser({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Store user information in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'userName': userName,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        });
        return 'User registered successfully';
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message;
    }
    return 'An error occurred';
  }

  // Login user
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return 'User logged in successfully';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return 'An error occurred';
  }

  // Fetch user data
  Future<Map<String, dynamic>?> fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      return userDoc.data() as Map<String, dynamic>?;
    }
    return null;
  }

  // Sign out user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
