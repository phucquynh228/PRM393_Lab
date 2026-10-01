import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/presentation/auth_controller.dart';
import '../data/checkin_repository.dart';
import '../../../core/utils/location_service.dart';

part 'checkin_controller.g.dart';

enum CheckInStatus {
  idle, checkingIn, checkingOut, success, error
}

@riverpod
class CheckInController extends _$CheckInController {
  @override
  CheckInStatus build() {
    return CheckInStatus.idle;
  }

  Future<void> handleCheckInOut({required bool isCheckIn}) async {
    state = isCheckIn ? CheckInStatus.checkingIn : CheckInStatus.checkingOut;

    try {
      final user = ref.read(authControllerProvider).value;
      if (user == null) throw Exception('Vui lòng đăng nhập lại');

      final locationService = ref.read(locationServiceProvider);
      final checkInRepo = ref.read(checkInRepositoryProvider);

      final position = await locationService.getCurrentPosition();
      if (position == null) throw Exception('Không thể lấy vị trí. Vui lòng cấp quyền.');

      // Rule 2: Block Mock Location
      if (position.isMocked) {
        throw Exception('Gian lận vị trí bị phát hiện (Mock Location)!');
      }

      final branch = await checkInRepo.getBranchInfo(user.branchId);
      if (branch == null) throw Exception('Không tìm thấy thông tin chi nhánh');

      // Rule 2: Radius Check
      final distance = locationService.calculateDistance(
        position.latitude, position.longitude,
        branch.lat, branch.lng
      );

      if (distance > branch.radius) {
        throw Exception('Bạn đang ở ngoài phạm vi ${branch.radius}m. Khoảng cách hiện tại: ${distance.toStringAsFixed(0)}m');
      }

      if (isCheckIn) {
        await checkInRepo.submitCheckIn(user.id, user.branchId, position.latitude, position.longitude);
      } else {
        await checkInRepo.submitCheckOut(user.id, user.branchId, position.latitude, position.longitude);
      }

      state = CheckInStatus.success;

    } catch (e) {
      state = CheckInStatus.error;
      rethrow;
    } finally {
      if (state != CheckInStatus.error) {
         state = CheckInStatus.idle;
      }
    }
  }
}
