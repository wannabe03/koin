import 'dart:convert';
import 'package:http/http.dart' as http;

// ⚠️ 서버 주소 변경 필수: 에뮬레이터에서 테스트 시 http://10.0.2.2:8080 사용
// 실제 기기나 같은 네트워크 컴퓨터 테스트 시에는 해당 컴퓨터의 IP 주소 사용
const String _baseUrl = "http://210.108.124.228:8080"; // 사용자 IP로 가정

// API 요청 바디 구조
class RegisterRequest {
  final String name;
  final String username;
  final String email;
  final String password;
  final String nationality;
  final String birthdate;
  final String nickname; // 💡 닉네임 필드 추가

  RegisterRequest({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.nationality,
    required this.birthdate,
    required this.nickname, // 💡 생성자에 추가
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "password": password,
      "nickname": nickname, // 💡 JSON 변환에 포함
      "nationality": nationality,
      "birthdate": birthdate,
    };
  }
}

// 회원가입 API 호출 함수
Future<Map<String, dynamic>> registerUser(RegisterRequest data) async {
  final url = Uri.parse('$_baseUrl/management/user/Register');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data.toJson()),
    );

    final responseBody = jsonDecode(utf8.decode(response.bodyBytes));
    print('API Response Status Code: ${response.statusCode}');
    print('API Error Body: $responseBody');

    // 💡 1. 상태 코드가 2xx이면 응답 본문의 'success' 필드를 확인합니다.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // 서버가 'success' 필드를 boolean 또는 문자열 'true'로 보낼 수 있으므로 안전하게 확인
      final successStatus = responseBody['success'];

      // 'success: true' (boolean)이거나 'success: "true"' (문자열)인 경우 성공으로 간주
      if (successStatus == true ||
          successStatus.toString().toLowerCase() == 'true') {
        return {'success': true, 'data': responseBody};
      } else {
        // 200/201을 받았지만 본문이 'success: false'인 경우
        return {
          'success': false,
          'error': responseBody['message'] ?? '서버 응답 오류 (Success=false)',
        };
      }
    } else {
      // 💡 2. 상태 코드가 4xx 이상인 경우, 오류 메시지를 본문에서 추출합니다.
      String errorMessage =
          responseBody['message'] ?? '서버 통신 오류: ${response.statusCode}';
      return {'success': false, 'error': errorMessage};
    }
  } catch (e) {
    print('Network Error (Catch Block): $e');
    return {'success': false, 'error': '네트워크 연결 오류'};
  }
}
