// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftModel _$ShiftModelFromJson(Map<String, dynamic> json) => _ShiftModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  date: DateTime.parse(json['date'] as String),
  status:
      $enumDecodeNullable(_$ShiftStatusEnumMap, json['status']) ??
      ShiftStatus.pending,
);

Map<String, dynamic> _$ShiftModelToJson(_ShiftModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'status': _$ShiftStatusEnumMap[instance.status]!,
    };

const _$ShiftStatusEnumMap = {
  ShiftStatus.pending: 'pending',
  ShiftStatus.completed: 'completed',
  ShiftStatus.absent: 'absent',
};
