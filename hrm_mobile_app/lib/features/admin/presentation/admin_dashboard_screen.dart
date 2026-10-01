import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/system_config_repository.dart';

final reminderMinutesProvider = FutureProvider<int>((ref) {
  return ref.watch(systemConfigRepositoryProvider).getReminderMinutes();
});

class AdminDashboardScreen extends ConsumerStatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  ConsumerState<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends ConsumerState<AdminDashboardScreen> {
  final _minutesController = TextEditingController();
  bool _isUpdating = false;

  @override
  void dispose() {
    _minutesController.dispose();
    super.dispose();
  }

  void _updateReminderMinutes() async {
    final minutes = int.tryParse(_minutesController.text);
    if (minutes == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vui lòng nhập số hợp lệ')));
      return;
    }

    setState(() => _isUpdating = true);
    try {
      await ref.read(systemConfigRepositoryProvider).updateReminderMinutes(minutes);
      ref.invalidate(reminderMinutesProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cập nhật thành công')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _isUpdating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final minutesAsync = ref.watch(reminderMinutesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cấu hình hệ thống', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Thời gian nhắc ca làm việc (phút):'),
                    const SizedBox(height: 8),
                    minutesAsync.when(
                      data: (minutes) {
                        if (_minutesController.text.isEmpty) {
                          _minutesController.text = minutes.toString();
                        }
                        return Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _minutesController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: _isUpdating ? null : _updateReminderMinutes,
                              child: _isUpdating ? const CircularProgressIndicator() : const Text('Cập nhật'),
                            )
                          ],
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (e, st) => Text(e.toString()),
                    ),
                  ],
                ),
              ),
            ),
            // Later we can add Log checkin devices or reports here
          ],
        ),
      ),
    );
  }
}
