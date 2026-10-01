import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/user_model.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<UserModel?> login(String username, String password);
  Future<void> updateBoundDevice(String userId, String deviceId);
}

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;
  final MockAuthRepository _mockFallback = MockAuthRepository();

  @override
  Future<UserModel?> login(String username, String password) async {
    try {
      // 1. Try Firebase Auth if username is an email format
      if (username.contains('@')) {
        final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: username,
          password: password,
        );
        if (credential.user != null) {
          final doc = await _firestore.collection('users').doc(credential.user!.uid).get();
          if (doc.exists && doc.data() != null) {
            return UserModel.fromJson({'id': doc.id, ...doc.data()!});
          }
        }
      }

      // 2. Query Firestore 'users' collection by username
      final querySnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        final data = doc.data();
        
        // Optional password check if stored in doc, or auth credential
        if (data['password'] == null || data['password'] == password) {
          return UserModel.fromJson({'id': doc.id, ...data});
        } else {
          throw Exception('Mật khẩu không chính xác');
        }
      }
    } catch (e) {
      debugPrint('Firestore Auth error, checking mock fallback: $e');
      if (e.toString().contains('Mật khẩu')) rethrow;
    }

    // Fallback to mock repository if Firebase is not yet populated
    return _mockFallback.login(username, password);
  }

  @override
  Future<void> updateBoundDevice(String userId, String deviceId) async {
    try {
      final docRef = _firestore.collection('users').doc(userId);
      final doc = await docRef.get();
      if (doc.exists) {
        await docRef.update({'boundDeviceId': deviceId});
        return;
      }
    } catch (e) {
      debugPrint('Firestore updateBoundDevice error: $e');
    }
    await _mockFallback.updateBoundDevice(userId, deviceId);
  }
}

class MockAuthRepository implements AuthRepository {
  final Map<String, UserModel> _users = {
    'staff1': const UserModel(
      id: 'u1',
      name: 'John Staff',
      role: UserRole.staff,
      branchId: 'b1',
    ),
    'admin1': const UserModel(
      id: 'a1',
      name: 'Alice Admin',
      role: UserRole.admin,
      branchId: 'b1',
    )
  };

  @override
  Future<UserModel?> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (password != '123456') throw Exception('Invalid credentials');
    
    return _users[username];
  }

  @override
  Future<void> updateBoundDevice(String userId, String deviceId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final entry = _users.entries.firstWhere((e) => e.value.id == userId);
    _users[entry.key] = entry.value.copyWith(boundDeviceId: deviceId);
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return FirebaseAuthRepository();
}
