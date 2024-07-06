import 'package:flutter/material.dart';
import 'Image_Post_custom.dart';
import 'Like_botton_custom.dart';
import '../../../../../../constant.dart';

class ContainerPost extends StatelessWidget {
  ContainerPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(8, 3))
        ],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: KPrimeryColor3, width: 2),
        color: KPrimeryColor5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ImagePost(), LikedButtonCustom()],
      ),
    );
  }
}
