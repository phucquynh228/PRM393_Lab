import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_config_repository.g.dart';

class SystemConfigRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Map<String, dynamic> _mockConfigs = {
    'reminder_minutes': 15,
  };

  Future<int> getReminderMinutes() async {
    try {
      final doc = await _firestore.collection('system_configs').doc('app_config').get();
      if (doc.exists && doc.data() != null && doc.data()!['reminder_minutes'] != null) {
        return doc.data()!['reminder_minutes'] as int;
      }
    } catch (e) {
      debugPrint('Firestore getReminderMinutes error: $e');
    }
    return _mockConfigs['reminder_minutes'] as int;
  }

  Future<void> updateReminderMinutes(int minutes) async {
    try {
      await _firestore.collection('system_configs').doc('app_config').set({
        'reminder_minutes': minutes,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      return;
    } catch (e) {
      debugPrint('Firestore updateReminderMinutes error: $e');
    }
    _mockConfigs['reminder_minutes'] = minutes;
  }
}

@riverpod
SystemConfigRepository systemConfigRepository(Ref ref) {
  return SystemConfigRepository();
}
