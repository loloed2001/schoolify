import 'package:flutter/material.dart';

import '../../../../DialogLogin/Presentation/dialog.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidAnimation();
    NavigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: SlidingAnimation,
                builder: (context, _) {
                  return SlideTransition(
                    position: SlidingAnimation,
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset('assets/images/logoo2.png')),
                  );
                }),
          ],
        ));
  }

  void initSlidAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogCustom();
          });
    });
  }
}
