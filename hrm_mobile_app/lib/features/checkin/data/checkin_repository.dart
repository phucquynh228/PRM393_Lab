import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/branch_model.dart';

part 'checkin_repository.g.dart';

class CheckInRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Map<String, BranchModel> _mockBranches = {
    'b1': const BranchModel(
      id: 'b1',
      name: 'Cafe Chi Nhánh 1',
      lat: 10.762622,
      lng: 106.660172,
      radius: 50.0,
    ),
  };

  Future<BranchModel?> getBranchInfo(String branchId) async {
    try {
      final doc = await _firestore.collection('branches').doc(branchId).get();
      if (doc.exists && doc.data() != null) {
        return BranchModel.fromJson({'id': doc.id, ...doc.data()!});
      }
    } catch (e) {
      debugPrint('Firestore getBranchInfo error: $e');
    }
    return _mockBranches[branchId];
  }

  Future<void> submitCheckIn(String userId, String branchId, double lat, double lng) async {
    try {
      await _firestore.collection('checkins').add({
        'userId': userId,
        'branchId': branchId,
        'type': 'check_in',
        'lat': lat,
        'lng': lng,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint('Firestore submitCheckIn error: $e');
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> submitCheckOut(String userId, String branchId, double lat, double lng) async {
    try {
      await _firestore.collection('checkins').add({
        'userId': userId,
        'branchId': branchId,
        'type': 'check_out',
        'lat': lat,
        'lng': lng,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint('Firestore submitCheckOut error: $e');
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}

@riverpod
CheckInRepository checkInRepository(Ref ref) {
  return CheckInRepository();
}
