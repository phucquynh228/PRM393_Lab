import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseSeedService {
  static Future<void> seedInitialData() async {
    final firestore = FirebaseFirestore.instance;

    try {
      // 1. Seed Branch
      final branchDoc = await firestore.collection('branches').doc('b1').get();
      if (!branchDoc.exists) {
        await firestore.collection('branches').doc('b1').set({
          'name': 'Cafe Chi Nhánh 1',
          'lat': 10.762622,
          'lng': 106.660172,
          'radius': 50.0,
        });
        debugPrint('Seeded branch b1 to Firestore');
      }

      // 2. Seed Users
      final userDoc = await firestore.collection('users').doc('u1').get();
      if (!userDoc.exists) {
        await firestore.collection('users').doc('u1').set({
          'username': 'staff1',
          'password': '123456',
          'name': 'John Staff',
          'role': 'staff',
          'branchId': 'b1',
        });
        await firestore.collection('users').doc('a1').set({
          'username': 'admin1',
          'password': '123456',
          'name': 'Alice Admin',
          'role': 'admin',
          'branchId': 'b1',
        });
        debugPrint('Seeded users staff1 and admin1 to Firestore');
      }

      // 3. Seed Quizzes
      final quizDoc = await firestore.collection('quizzes').doc('q1').get();
      if (!quizDoc.exists) {
        await firestore.collection('quizzes').doc('q1').set({
          'title': 'Kiến thức pha chế cơ bản',
          'durationMinutes': 5,
          'questions': [
            {
              'questionText': 'Nhiệt độ đánh sữa Cappuccino là bao nhiêu?',
              'options': ['50-55°C', '60-65°C', '70-75°C', '80-85°C'],
              'correctAnswerIndex': 1,
            },
            {
              'questionText': 'Tỷ lệ pha Espresso tiêu chuẩn?',
              'options': ['1:1', '1:2', '1:3', '1:4'],
              'correctAnswerIndex': 1,
            },
          ],
        });
        debugPrint('Seeded quiz q1 to Firestore');
      }

      // 4. Seed System Config
      final configDoc = await firestore.collection('system_configs').doc('app_config').get();
      if (!configDoc.exists) {
        await firestore.collection('system_configs').doc('app_config').set({
          'reminder_minutes': 15,
        });
        debugPrint('Seeded system config to Firestore');
      }
    } catch (e) {
      debugPrint('FirebaseSeedService error: $e');
    }
  }
}
