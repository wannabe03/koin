import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koin/common/const/colors.dart';

enum InteractionType { like, scrap, comment }

class InteractionButton extends StatelessWidget {
  final InteractionType type;
  final bool isEnabled;
  final int? interactionCount;
  final Function()? onTap;

  const InteractionButton({
    super.key,
    required this.type,
    this.onTap,
    required this.isEnabled,
    required this.interactionCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 8,
        children: [
          SvgPicture.asset('asset/img/icon/${type.name}.svg'),
          Text(
            type.name[0].toUpperCase() + type.name.substring(1),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: GrayScale.gray300,
            ),
          ),
          interactionCount != null && interactionCount != 0
              ? Text(
                '$interactionCount',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: GrayScale.gray300,
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}

class KurationFeedInteractionBar extends StatefulWidget {
  final int likeCount;
  final int scrapCount;
  final int commentCount;
  const KurationFeedInteractionBar({
    super.key,
    required this.likeCount,
    required this.scrapCount,
    required this.commentCount,
  });

  @override
  State<StatefulWidget> createState() => _KurationFeedInteractionBarState();
}

class _KurationFeedInteractionBarState
    extends State<KurationFeedInteractionBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 30,
        children: [
          // TODO: fetch data and replace null
          InteractionButton(
            type: InteractionType.like,
            isEnabled: false,
            onTap: () => {},
            interactionCount: widget.likeCount,
          ),
          InteractionButton(
            type: InteractionType.comment,
            isEnabled: false,
            onTap: () => {},
            interactionCount: widget.commentCount,
          ),
          InteractionButton(
            type: InteractionType.scrap,
            isEnabled: false,
            onTap: () => {},
            interactionCount: widget.scrapCount,
          ),
        ],
      ),
    );
  }
}
