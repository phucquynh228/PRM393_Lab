// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      questionText: json['questionText'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'questionText': instance.questionText,
      'options': instance.options,
      'correctAnswerIndex': instance.correctAnswerIndex,
    };

_QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => _QuizModel(
  id: json['id'] as String,
  title: json['title'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuizModelToJson(_QuizModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'durationMinutes': instance.durationMinutes,
      'questions': instance.questions,
    };

_QuizResultModel _$QuizResultModelFromJson(Map<String, dynamic> json) =>
    _QuizResultModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      quizId: json['quizId'] as String,
      score: (json['score'] as num).toInt(),
      takenAt: DateTime.parse(json['takenAt'] as String),
    );

Map<String, dynamic> _$QuizResultModelToJson(_QuizResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'quizId': instance.quizId,
      'score': instance.score,
      'takenAt': instance.takenAt.toIso8601String(),
    };
