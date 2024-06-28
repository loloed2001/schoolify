import 'package:flutter/material.dart';

import 'package:myshop/constant.dart';

// ignore: must_be_immutable
class CircleImageCustom extends StatelessWidget {
  CircleImageCustom({required this.image, required this.ontap});
  AssetImage? image;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GoRouter.of(context).push(AppRouter.KLoginPage);
      onTap: ontap,
      child: CircleAvatar(
        foregroundColor: KPrimeryColor4,
        radius: MediaQuery.of(context).size.aspectRatio * 74,
        backgroundColor: KPrimeryColor4,
        child: CircleAvatar(
          backgroundImage: image,
          radius: MediaQuery.of(context).size.aspectRatio * 72,
        ),
      ),
    );
  }
}
