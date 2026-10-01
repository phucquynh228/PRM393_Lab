import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/quiz_model.dart';

part 'quiz_repository.g.dart';

class QuizRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<QuizModel> _mockQuizzes = [
    const QuizModel(
      id: 'q1',
      title: 'Kiến thức pha chế cơ bản',
      durationMinutes: 5,
      questions: [
        QuestionModel(
          questionText: 'Nhiệt độ đánh sữa Cappuccino là bao nhiêu?',
          options: ['50-55°C', '60-65°C', '70-75°C', '80-85°C'],
          correctAnswerIndex: 1,
        ),
        QuestionModel(
          questionText: 'Tỷ lệ pha Espresso tiêu chuẩn?',
          options: ['1:1', '1:2', '1:3', '1:4'],
          correctAnswerIndex: 1,
        ),
      ],
    ),
  ];

  final List<QuizResultModel> _mockResults = [];

  Future<List<QuizModel>> getAvailableQuizzes() async {
    try {
      final snapshot = await _firestore.collection('quizzes').get();
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.map((doc) {
          return QuizModel.fromJson({'id': doc.id, ...doc.data()});
        }).toList();
      }
    } catch (e) {
      debugPrint('Firestore getAvailableQuizzes error: $e');
    }
    return _mockQuizzes;
  }

  Future<void> submitResult(QuizResultModel result) async {
    try {
      await _firestore.collection('quiz_results').doc(result.id).set({
        'userId': result.userId,
        'quizId': result.quizId,
        'score': result.score,
        'takenAt': Timestamp.fromDate(result.takenAt),
      });
      return;
    } catch (e) {
      debugPrint('Firestore submitResult error: $e');
    }
    _mockResults.add(result);
  }
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  return QuizRepository();
}
