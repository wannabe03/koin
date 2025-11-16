import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import '../widget/profile_card_widget.dart';
import '../widget/action_buttons_widget.dart';
import '../widget/banner_widget.dart';
import '../widget/account_section_widget.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

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
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // 상단 프로필 카드 2개 (Row)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(child: _KoinaProfileCard()),
                        SizedBox(width: 12),
                        Expanded(child: _K01nProfileCard()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 4개 버튼 (좋아요, 댓글 등)
                  const ActionButtonsWidget(),
                  const SizedBox(height: 20),
                  // 배너 위젯
                  const BannerWidget(),
                  const SizedBox(height: 20),
                  // 구분선
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: 1,
                    color: GRAY_COLOR,
                  ),
                  // My Account 섹션
                  const _MyAccountSection(),
                  // 구분선
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: 1,
                    color: GRAY_COLOR,
                  ),
                  // Setting 섹션
                  const _SettingSection(),
                  // 구분선
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: 1,
                    color: GRAY_COLOR,
                  ),
                  // Documents 섹션
                  const _DocumentsSection(),
                  const SizedBox(height: 20), // 하단 여백
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//--- 프로필 카드 위젯 ---//

class _KoinaProfileCard extends StatelessWidget {
  const _KoinaProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),

      decoration: BoxDecoration(
        color: const Color(0xFFF0F6FF),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFFE0E0E0),
                child: Icon(Icons.person, size: 30, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Koina',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/160px-Flag_of_Germany.svg.png',
                        width: 16,
                      ),
                    ],
                  ),
                  const Text(
                    'Exchange student',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Seoul • 6 month',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.settings, size: 16, color: Colors.blue),
              const SizedBox(width: 4),
              const Text(
                'Profile',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class _K01nProfileCard extends StatelessWidget {
  const _K01nProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F6FF),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'K01n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '19 Post',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.chat_bubble_outline, size: 16, color: Colors.green),
              SizedBox(width: 4),
              Text(
                'Kommunity',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

//--- 본문 섹션 위젯 ---//

// My Account 섹션 위젯
class _MyAccountSection extends StatelessWidget {
  const _MyAccountSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          _buildAccountRow('ID', 'welovek_oin'),
          const SizedBox(height: 24),
          _buildAccountRow('Password'),
          const SizedBox(height: 24),
          _buildAccountRow('Email', 'koreaninsider@gmail.com'),
        ],
      ),
    );
  }

  Widget _buildAccountRow(String title, [String? value]) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
        const Spacer(),
        if (value != null)
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}

// Setting 섹션 위젯
class _SettingSection extends StatelessWidget {
  const _SettingSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Setting',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Text('Notification', style: TextStyle(fontSize: 16)),
          SizedBox(height: 24),
          Text('Help', style: TextStyle(fontSize: 16)),
          SizedBox(height: 24),
          Text('Log out', style: TextStyle(fontSize: 16)),
          SizedBox(height: 24),
          Text('Delete Account', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

// Documents 섹션 위젯
class _DocumentsSection extends StatelessWidget {
  const _DocumentsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Documents',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Text('Terms of use', style: TextStyle(fontSize: 16)),
          SizedBox(height: 24),
          Text('Privacy policy', style: TextStyle(fontSize: 16)),
          SizedBox(height: 24),
          Text('Inquire us', style: TextStyle(fontSize: 16)),
          SizedBox(height: 24),
          Text('Announcement', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
