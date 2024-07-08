import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/user_datasource.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/user_models.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Security_View extends StatelessWidget {
  const Security_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.KStudentAccount);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: KPrimeryColor1,
            size: MediaQuery.of(context).size.aspectRatio * 60,
          ),
        ),
        backgroundColor: KPrimeryColor5,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.security,
            style: TextStyle(
                color: KPrimeryColor1,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.aspectRatio * 55,
                letterSpacing: MediaQuery.of(context).size.width * .002)),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: getStudentbyId().getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // List<UserModel> users = snapshot.data!;
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .05,
                                right: MediaQuery.of(context).size.width * .05,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.emailAdress,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          42,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .002,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03,
                                right: MediaQuery.of(context).size.width * .03,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .01,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .01,
                                        ),
                                        child: TextFormField(
                                          enabled: false,
                                          showCursor: false,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.email_outlined),
                                            prefixIconColor: Colors.grey,
                                            border: InputBorder.none,
                                            hintText:
                                                snapshot.data![index].email,
                                            hintStyle: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    37,
                                                fontFamily: KFont3,
                                                letterSpacing:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .002,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0x73000000)),
                                          ),
                                        )),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(8, 3))
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.5),
                                          width: 2),
                                      color: KPrimeryColor5,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        .08,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .push(AppRouter.KemailChange);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: KPrimeryColor1,
                                        size: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            60,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .05,
                                right: MediaQuery.of(context).size.width * .05,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.password,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          42,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .002,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03,
                                right: MediaQuery.of(context).size.width * .03,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .01,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .01,
                                        ),
                                        child: TextFormField(
                                          enabled: false,
                                          showCursor: false,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.password),
                                            prefixIconColor: Colors.grey,
                                            border: InputBorder.none,
                                            hintText:
                                                snapshot.data![index].password,
                                            hintStyle: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .aspectRatio *
                                                    37,
                                                fontFamily: KFont3,
                                                letterSpacing:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .002,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0x73000000)),
                                          ),
                                        )),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(8, 3))
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.5),
                                          width: 2),
                                      color: KPrimeryColor5,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        .08,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .02,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .push(AppRouter.Kpasschnage);
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: KPrimeryColor1,
                                        size: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            60,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lottie/error1.json",
                      height: MediaQuery.of(context).size.height * .1),
                  Text("${snapshot.error}")
                ],
              ),
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: KPrimeryColor1,
                  size: MediaQuery.of(context).size.aspectRatio * 100),
            );
          }
        },
      ),
    );
  }
}
