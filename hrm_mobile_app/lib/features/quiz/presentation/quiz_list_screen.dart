import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/quiz_repository.dart';
import 'quiz_screen.dart';

final quizzesProvider = FutureProvider((ref) {
  return ref.watch(quizRepositoryProvider).getAvailableQuizzes();
});

class QuizListScreen extends ConsumerWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzesAsync = ref.watch(quizzesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Đào tạo & Kiểm tra')),
      body: quizzesAsync.when(
        data: (quizzes) => ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            final quiz = quizzes[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: const Icon(Icons.school),
                title: Text(quiz.title),
                subtitle: Text('Thời gian: ${quiz.durationMinutes} phút - ${quiz.questions.length} câu hỏi'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => QuizScreen(quiz: quiz)),
                  );
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
      ),
    );
  }
}
