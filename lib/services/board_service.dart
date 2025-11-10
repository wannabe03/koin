import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koin/model/board_response.dart';

class BoardService {
  static Future<BoardResponse?> getAllBoards() async {
    final url = Uri.parse("http://localhost:8080/management/board/list");
    // final headers = {};

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        debugPrint('OK: $responseData');
        return BoardResponse.fromJson(responseData);
      } else {
        debugPrint('get failed: ${response.statusCode} ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('error: $e');
      return null;
    }
  }
}
