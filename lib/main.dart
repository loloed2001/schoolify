import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(SchoolApp());
}

class SchoolApp extends StatefulWidget {
  SchoolApp({super.key});

  @override
  State<SchoolApp> createState() => _SchoolAppState();
}

class _SchoolAppState extends State<SchoolApp> {
  VoidCallback rebuildOnLocaleChange() => () => setState(() {});
  @override
  Widget build(BuildContext context) {
    Locale myLocale = View.of(context).platformDispatcher.locale;
    PlatformDispatcher.instance.onLocaleChanged = rebuildOnLocaleChange();

    return MaterialApp.router(
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
    );
  }
}
