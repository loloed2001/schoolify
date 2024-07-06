import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/list.dart';
import '../../../../../constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  static const routes = {
    0: '/markess',
    1: '/inschool',
    2: '/note',
    3: '/examprog',
    4: '/weekprg',
    5: '/lesson',
  };

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: const Image(
            image: AssetImage(
              'assets/images/p1.jpg',
            ),
            fit: BoxFit.fill,
          ),
          width: double.infinity,
          height: double.infinity,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                AppLocalizations.of(context)!.service,
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: KFont2,
                    color: Color.fromARGB(255, 158, 1, 132)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 80, left: 15, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: name.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(routes[index].toString());
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: ccolors[index],
                                  shape: BoxShape.circle),
                              child: Center(
                                child: caticon[index],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            getTitle(context, index),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                // fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
