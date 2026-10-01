import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/shift_repository.dart';
import '../../auth/presentation/auth_controller.dart';
import 'leave_request_form.dart';

final userShiftsProvider = FutureProvider((ref) async {
  final user = ref.watch(authControllerProvider).value;
  if (user == null) return [];
  return ref.watch(shiftRepositoryProvider).getShiftsForUser(user.id);
});

class ShiftListScreen extends ConsumerWidget {
  const ShiftListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftsAsync = ref.watch(userShiftsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lịch Làm Việc')),
      body: shiftsAsync.when(
        data: (shifts) => ListView.builder(
          itemCount: shifts.length,
          itemBuilder: (context, index) {
            final shift = shifts[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text('Ngày: ${shift.date.day}/${shift.date.month}/${shift.date.year}'),
                subtitle: Text('Từ: ${shift.startTime.hour}:${shift.startTime.minute.toString().padLeft(2,'0')} - Đến: ${shift.endTime.hour}:${shift.endTime.minute.toString().padLeft(2,'0')}'),
                trailing: Chip(label: Text(shift.status.name)),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LeaveRequestForm()),
          );
        },
        label: const Text('Xin Nghỉ/Đổi Ca'),
        icon: const Icon(Icons.edit_calendar),
      ),
    );
  }
}
