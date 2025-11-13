import 'package:flutter/material.dart';
import '../widget/ai_icon_widget.dart';
import '../widget/camera_action_buttons.dart';
import '../widget/camera_instruction_text.dart';

class KameraScreen extends StatelessWidget {
  const KameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.7212, 1.0],
            colors: [
              Colors.black.withValues(alpha: 0.0),
              Colors.black.withValues(alpha: 0.05),
            ],
          ),
        ),
        child: Stack(
          children: [
            const Center(child: AiIconWidget()),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: const Column(
                children: [CameraActionButtons(), CameraInstructionText()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
