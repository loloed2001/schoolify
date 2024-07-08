import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Inschool extends StatefulWidget {
  const Inschool({super.key});

  @override
  State<Inschool> createState() => _inschoolState();
}

class _inschoolState extends State<Inschool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: GradientAppBar(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              //KPrimeryColor2,
              Color(0xFFCD6FD0),
              Color(0xFF9B71D2),
              Color(0xFF9B71D2),
              // Color(0xFF703EA9),
              Color(0xFFCD6FD0),
            ],
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(
                      AppLocalizations.of(context)!.inschool,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    centerTitle: true,
        ),
        
    );
  }
}