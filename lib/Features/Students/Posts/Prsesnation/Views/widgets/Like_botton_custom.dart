import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class LikedButtonCustom extends StatelessWidget {
  LikedButtonCustom({super.key});
  bool isFavorite = false;
  int likeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .55,
          top: MediaQuery.of(context).size.height * .015),
      child: LikeButton(
        onTap: (isLiked) {
          likeCount = isLiked ? likeCount - 1 : likeCount + 1;

          return Future.value(!isLiked);
        },
        likeBuilder: (isLiked) {
          return Icon(
            size: MediaQuery.of(context).size.aspectRatio * 60,
            isLiked ? Icons.favorite : Icons.favorite_border_outlined,
            color: isLiked ? Colors.red : Colors.grey.withOpacity(0.9),
          );
        },
        likeCount: likeCount,
        countBuilder: (int? count, bool isLiked, String text) {
          return Text(
            '   $count ${AppLocalizations.of(context)!.like}',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.aspectRatio * 40,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          );
        },
      ),
    );
  }
}
