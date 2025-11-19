import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/kommunity/view/board_screen.dart';

class KoinCommunity extends StatelessWidget {
  const KoinCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      {
        'title': '커피 제대로 하는 집 어디 없나요?',
        'content': '추천 부탁합니다.',
        'time': '1 minute ago',
      },
      {
        'title': '오늘 날씨가 정말 좋네요!',
        'content': '산책하기 딱 좋은 날씨입니다.',
        'time': '5 minutes ago',
      },
      {
        'title': '플러터 너무 재밌어요!',
        'content': '더 공부하고 싶습니다.',
        'time': '10 minutes ago',
      },
      {
        'title': '커피 제대로 하는 집 어디 없나요?',
        'content': '추천 부탁합니다.',
        'time': '1 minute ago',
      },
      {
        'title': '오늘 날씨가 정말 좋네요!',
        'content': '산책하기 딱 좋은 날씨입니다.',
        'time': '5 minutes ago',
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9).withValues(alpha: 0.30),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(text: '커뮤니티 '),
                      TextSpan(
                        text: 'K-ommunity',
                        style: TextStyle(color: GrayScale.gray300),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const BoardScreen(boardName: '전체 게시판'),
                      ),
                    );
                  },
                  child: Text(
                    'All →',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                ),
              ],
            ),
            ListView.separated(
              itemCount: posts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPostItem(
                  post['title']!,
                  post['content']!,
                  post['time']!,
                );
              },
              separatorBuilder:
                  (context, index) => Container(
                    height: 0.5,
                    color: GrayScale.gray200,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(String title, String content, String time) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: GrayScale.gray600,
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.28,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF737373),
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.28,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Color.fromRGBO(138, 137, 142, 0.95),
                  fontFamily: 'Pretendard',
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '|',
                style: TextStyle(
                  color: Color.fromRGBO(138, 137, 142, 0.95),
                  fontFamily: 'Pretendard',
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 6),
              Transform.translate(
                offset: const Offset(0, 1),
                child: ClipOval(
                  child: Image.asset(
                    'asset/img/icon/CountryIcon_Germany.png',
                    width: 8,
                    height: 8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
