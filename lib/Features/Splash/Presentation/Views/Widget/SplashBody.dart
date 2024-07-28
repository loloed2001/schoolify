import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/Features/Students/LoginStudent/data/bloc/auth_bloc.dart';
import 'package:myshop/core/Utils/app_router.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade50,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authsucss) {
              GoRouter.of(context).pushReplacement(AppRouter.KHomeStudentPage);
            } else {
              navigateToHome();
            }
          },
          child: Column(
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
          ),
        ));
  }

  void initSlidAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 30), end: Offset.zero)
            .animate(animationController);
    animationController.forward().then((v) {
      context.read<AuthBloc>().add(CheckAuthEvent());
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogCustom();
          });
    });
  }
}
