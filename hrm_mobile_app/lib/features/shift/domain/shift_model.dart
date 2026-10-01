import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

enum ShiftStatus {
  @JsonValue('pending') pending,
  @JsonValue('completed') completed,
  @JsonValue('absent') absent,
}

@freezed
abstract class ShiftModel with _$ShiftModel {
  const factory ShiftModel({
    required String id,
    required String userId,
    required DateTime startTime,
    required DateTime endTime,
    required DateTime date,
    @Default(ShiftStatus.pending) ShiftStatus status,
  }) = _ShiftModel;

  factory ShiftModel.fromJson(Map<String, dynamic> json) => _$ShiftModelFromJson(json);
}
