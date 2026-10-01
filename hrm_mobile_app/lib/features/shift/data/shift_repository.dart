import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/shift_model.dart';
import '../domain/leave_request_model.dart';

part 'shift_repository.g.dart';

class ShiftRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<ShiftModel> _mockShifts = [
    ShiftModel(
      id: 's1',
      userId: 'u1',
      startTime: DateTime.now().add(const Duration(hours: 1)),
      endTime: DateTime.now().add(const Duration(hours: 5)),
      date: DateTime.now(),
    ),
    ShiftModel(
      id: 's2',
      userId: 'u1',
      startTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
      endTime: DateTime.now().add(const Duration(days: 1, hours: 6)),
      date: DateTime.now().add(const Duration(days: 1)),
    )
  ];

  final List<LeaveRequestModel> _mockRequests = [];

  Future<List<ShiftModel>> getShiftsForUser(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('shifts')
          .where('userId', isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return ShiftModel.fromJson({
            'id': doc.id,
            ...data,
            if (data['startTime'] is Timestamp)
              'startTime': (data['startTime'] as Timestamp).toDate().toIso8601String(),
            if (data['endTime'] is Timestamp)
              'endTime': (data['endTime'] as Timestamp).toDate().toIso8601String(),
            if (data['date'] is Timestamp)
              'date': (data['date'] as Timestamp).toDate().toIso8601String(),
          });
        }).toList();
      }
    } catch (e) {
      debugPrint('Firestore getShiftsForUser error: $e');
    }
    return _mockShifts.where((s) => s.userId == userId).toList();
  }

  Future<void> submitLeaveRequest(LeaveRequestModel request) async {
    try {
      await _firestore.collection('leave_requests').doc(request.id).set({
        'requesterId': request.requesterId,
        'targetUserId': request.targetUserId,
        'date': Timestamp.fromDate(request.date),
        'reason': request.reason,
        'status': request.status.name,
        'createdAt': FieldValue.serverTimestamp(),
      });
      return;
    } catch (e) {
      debugPrint('Firestore submitLeaveRequest error: $e');
    }
    _mockRequests.add(request);
  }
}

@riverpod
ShiftRepository shiftRepository(Ref ref) {
  return ShiftRepository();
}
