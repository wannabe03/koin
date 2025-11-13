// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardData _$BoardDataFromJson(Map<String, dynamic> json) => _BoardData();

Map<String, dynamic> _$BoardDataToJson(_BoardData instance) =>
    <String, dynamic>{};

_BoardResponse _$BoardResponseFromJson(Map<String, dynamic> json) =>
    _BoardResponse(
      success: json['success'] as bool,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => BoardData.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BoardResponseToJson(_BoardResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };
