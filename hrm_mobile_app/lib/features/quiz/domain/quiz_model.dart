import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String questionText,
    required List<String> options,
    required int correctAnswerIndex,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
}

@freezed
abstract class QuizModel with _$QuizModel {
  const factory QuizModel({
    required String id,
    required String title,
    required int durationMinutes,
    required List<QuestionModel> questions,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}

@freezed
abstract class QuizResultModel with _$QuizResultModel {
  const factory QuizResultModel({
    required String id,
    required String userId,
    required String quizId,
    required int score,
    required DateTime takenAt,
  }) = _QuizResultModel;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) => _$QuizResultModelFromJson(json);
}
