import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/user_model.dart';
import '../data/auth_repository.dart';
import '../../../core/utils/device_info_service.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<UserModel?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final authRepo = ref.read(authRepositoryProvider);
      final deviceInfoService = ref.read(deviceInfoServiceProvider);

      final user = await authRepo.login(username, password);
      
      if (user == null) {
        state = AsyncValue.error(Exception('User not found'), StackTrace.current);
        return;
      }

      final deviceId = await deviceInfoService.getDeviceId();
      if (deviceId == null) {
        state = AsyncValue.error(Exception('Could not get device ID'), StackTrace.current);
        return;
      }

      // Rule 1: Device Binding
      if (user.boundDeviceId == null) {
        // First login, bind device
        await authRepo.updateBoundDevice(user.id, deviceId);
        state = AsyncValue.data(user.copyWith(boundDeviceId: deviceId));
      } else if (user.boundDeviceId != deviceId) {
        // Device mismatch
        state = AsyncValue.error(
          Exception('Thiết bị không hợp lệ. Vui lòng liên hệ Admin.'),
          StackTrace.current,
        );
      } else {
        // Successful login
        state = AsyncValue.data(user);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}
