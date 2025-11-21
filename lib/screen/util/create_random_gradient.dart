import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

/// Temporary helper for UI demonstration.
LinearGradient createRandomGradient() {
  return LinearGradient(
    colors: [PRIMARY_COLOR, SECONDARY_COLOR],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
