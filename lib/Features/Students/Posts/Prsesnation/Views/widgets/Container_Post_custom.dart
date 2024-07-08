import 'package:flutter/material.dart';
import 'package:myshop/Features/Students/Posts/Prsesnation/Views/widgets/Image_Post_custom.dart';
import 'package:myshop/Features/Students/Posts/Prsesnation/Views/widgets/Like_botton_custom.dart';
import 'package:myshop/constant.dart';

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ImagePost(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              "صور للنشاط المقام في مدرسة المرح يوم الثلاثاء",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.aspectRatio * 35,
                  letterSpacing: MediaQuery.of(context).size.width * 0.001,
                  color: Colors.black54,
                  fontFamily: KFont2),
            ),
          ),
          LikedButtonCustom()
        ],
      ),
    );
  }
}
