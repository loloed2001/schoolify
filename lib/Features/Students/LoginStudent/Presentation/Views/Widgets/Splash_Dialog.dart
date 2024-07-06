import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../constant.dart';
import '../../../../../../core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashDialog extends StatefulWidget {
  const SplashDialog({super.key});

  @override
  State<SplashDialog> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashDialog>
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
    return Dialog(
        backgroundColor: KPrimeryColor5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              AspectRatio(
                  aspectRatio: 2.9,
                  child: Lottie.asset(
                      'assets/lottie/lottieflow-checkbox-04-20BF55-easey.json')),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.sucssLogin,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                      color: Colors.black54),
                ),
              )
            ],
          ),
          height: MediaQuery.of(context).size.height * .4,
          width: MediaQuery.of(context).size.width * 25,
        ));
  }

  void initSlidAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.KHomeStudentPage);
    });
  }
}
