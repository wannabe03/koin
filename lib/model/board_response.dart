import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_response.freezed.dart';
part 'board_response.g.dart';

@freezed
abstract class BoardData with _$BoardData {
  const factory BoardData() = _BoardData;

  // test
  factory BoardData.fromJson(Map<String, dynamic> json) => const _BoardData();
}

@freezed
abstract class BoardResponse with _$BoardResponse {
  const factory BoardResponse({
    required bool success,
    required List<BoardData> data,
    required String message,
  }) = _BoardResponse;

  factory BoardResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardResponseFromJson(json);
}
