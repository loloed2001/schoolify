import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:myshop/Features/Students/HomeStudent/Presentation/Views/HomeStudentPage.dart';
import 'package:myshop/Features/Students/LoginStudent/Presentation/Views/loginPageStudent.dart';
import 'package:myshop/Features/Students/LoginStudent/data/bloc/auth_bloc.dart';
import 'package:myshop/Features/Students/StudentAccount/data/bloc/users_bloc.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Wait for initialization
  // SharedPreferences _shared = await SharedPreferences.getInstance();

  // var Email = _shared.getString('email');

  // var password = _shared.getString('pass');
  // runApp(SchoolApp());
  // runApp(Email != null && password != null ? SchoolApp() : HomeStudentview());
  runApp(SchoolApp());
  // print(Email);
  // print(password);
}

class SchoolApp extends StatefulWidget {
  @override
  State<SchoolApp> createState() => _SchoolAppState();
}

class _SchoolAppState extends State<SchoolApp> {
  VoidCallback rebuildOnLocaleChange() => () => setState(() {});
  @override
  build(BuildContext context) {
    Locale myLocale = View.of(context).platformDispatcher.locale;
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<UsersBloc>(
          create: (context) => UsersBloc(),
        ),
      ],
      child: MaterialApp.router(
        builder: BotToastInit(),
        theme: ThemeData(
            fontFamily: myLocale.languageCode == 'ar' ? KFont2 : KFont3,
            scaffoldBackgroundColor: KPrimeryColor5,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: KPrimeryColor4)),
        // locale: const Locale('ar'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'),
        ],
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
