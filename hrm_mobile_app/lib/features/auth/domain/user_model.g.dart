// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  branchId: json['branchId'] as String,
  boundDeviceId: json['boundDeviceId'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': _$UserRoleEnumMap[instance.role]!,
      'branchId': instance.branchId,
      'boundDeviceId': instance.boundDeviceId,
    };

const _$UserRoleEnumMap = {UserRole.admin: 'admin', UserRole.staff: 'staff'};
