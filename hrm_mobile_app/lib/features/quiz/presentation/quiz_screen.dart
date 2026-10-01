import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/quiz_model.dart';
import '../data/quiz_repository.dart';
import '../../auth/presentation/auth_controller.dart';
import 'package:uuid/uuid.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final QuizModel quiz;
  const QuizScreen({super.key, required this.quiz});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  late int _remainingSeconds;
  Timer? _timer;
  
  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {};
  bool _isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.quiz.durationMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _submitQuiz();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _submitQuiz() async {
    if (_isSubmitted) return;
    _timer?.cancel();
    setState(() => _isSubmitted = true);

    int score = 0;
    for (int i = 0; i < widget.quiz.questions.length; i++) {
      if (_selectedAnswers[i] == widget.quiz.questions[i].correctAnswerIndex) {
        score++;
      }
    }

    final user = ref.read(authControllerProvider).value!;
    final result = QuizResultModel(
      id: const Uuid().v4(),
      userId: user.id,
      quizId: widget.quiz.id,
      score: score,
      takenAt: DateTime.now(),
    );

    try {
      await ref.read(quizRepositoryProvider).submitResult(result);
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Hoàn thành!'),
            content: Text('Điểm của bạn: $score/${widget.quiz.questions.length}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // close dialog
                  Navigator.pop(context); // close quiz screen
                },
                child: const Text('Đóng'),
              )
            ],
          )
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= widget.quiz.questions.length) {
      return const SizedBox.shrink(); // Prevent build issues if index out of bounds
    }

    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Câu ${_currentQuestionIndex + 1}/${widget.quiz.questions.length}'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                _formattedTime,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...List.generate(currentQuestion.options.length, (index) {
              return Card(
                color: _selectedAnswers[_currentQuestionIndex] == index ? Colors.blue.shade100 : null,
                child: RadioListTile<int>(
                  value: index,
                  groupValue: _selectedAnswers[_currentQuestionIndex],
                  title: Text(currentQuestion.options[index]),
                  onChanged: _isSubmitted ? null : (val) {
                    setState(() {
                      _selectedAnswers[_currentQuestionIndex] = val!;
                    });
                  },
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentQuestionIndex > 0 
                      ? () => setState(() => _currentQuestionIndex--)
                      : null,
                  child: const Text('Quay lại'),
                ),
                if (_currentQuestionIndex < widget.quiz.questions.length - 1)
                  ElevatedButton(
                    onPressed: () => setState(() => _currentQuestionIndex++),
                    child: const Text('Tiếp theo'),
                  )
                else
                  ElevatedButton(
                    onPressed: _isSubmitted ? null : _submitQuiz,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    child: const Text('Nộp bài'),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
