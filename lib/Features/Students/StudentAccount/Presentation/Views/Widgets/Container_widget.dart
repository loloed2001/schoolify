import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .66,
        decoration: BoxDecoration(
            color: KPrimeryColor5,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .06,
            right: MediaQuery.of(context).size.width * .05,
            top: MediaQuery.of(context).size.height * .06,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.KSecurityview);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.security,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 38,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        color: KPrimeryColor1,
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.KSecurityview);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                  ],
                ),
              ),
              Divider(
                thickness: MediaQuery.of(context).size.aspectRatio * 2,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.KinfoStu);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.schoolinfo,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 38,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        color: KPrimeryColor1,
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.KinfoStu);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                  ],
                ),
              ),
              Divider(
                thickness: MediaQuery.of(context).size.aspectRatio * 2,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.Kaddstudent);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.addson,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 38,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        color: KPrimeryColor1,
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.Kaddstudent);
                        },
                        icon: Icon(Icons.add_circle_outline_outlined)),
                  ],
                ),
              ),
              Divider(
                thickness: MediaQuery.of(context).size.aspectRatio * 2,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.Klanguage);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.lang,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 38,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        color: KPrimeryColor1,
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.Klanguage);
                        },
                        icon: Icon(Icons.language)),
                  ],
                ),
              ),
              Divider(
                thickness: MediaQuery.of(context).size.aspectRatio * 2,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.logout,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 38,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        color: KPrimeryColor1,
                        onPressed: () {},
                        icon: Icon(Icons.logout_outlined)),
                  ],
                ),
              ),
              Divider(
                thickness: MediaQuery.of(context).size.aspectRatio * 2,
              )
            ],
          ),
        ));
  }
}
