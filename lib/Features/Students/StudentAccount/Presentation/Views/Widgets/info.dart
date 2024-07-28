import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myshop/Features/Students/StudentAccount/Presentation/Views/Widgets/pichart.dart';
import 'package:myshop/Features/Students/StudentAccount/Presentation/Views/Widgets/picharthodor.dart';
import 'package:myshop/Features/Students/StudentAccount/data/datasource/user_datasource.dart';
import 'package:myshop/Features/Students/StudentAccount/data/models/user_models.dart';
import 'package:myshop/constant.dart';
import 'package:myshop/core/Utils/app_router.dart';

class Info_student extends StatelessWidget {
  const Info_student({super.key});

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
        title: Text(AppLocalizations.of(context)!.schoolinfo,
            style: TextStyle(
                color: KPrimeryColor1,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                letterSpacing: MediaQuery.of(context).size.width * .002)),
      ),
      body: FutureBuilder<List<UserModel>>(
          future: UserDatasource().getUserList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //List<UserModel> users = snapshot.data!;
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .008,
                            ),
                            Text(
                              snapshot.data![index].firstName!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.date,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .008,
                            ),
                            Text(
                              " ${snapshot.data![index].birtDate!.day.toString()}/${snapshot.data![index].birtDate!.month.toString()}/${snapshot.data![index].birtDate!.year.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Divider(
                      color: KPrimeryColor4,
                      indent: MediaQuery.of(context).size.height * .05,
                      endIndent: MediaQuery.of(context).size.height * .05,
                      thickness: MediaQuery.of(context).size.aspectRatio * 1.5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.fatherName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .008,
                            ),
                            Text(
                              snapshot.data![index].parent!.fatherName!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.motherName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .008,
                            ),
                            Text(
                              snapshot.data![index].parent!.motherName!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Divider(
                      color: KPrimeryColor4,
                      indent: MediaQuery.of(context).size.height * .05,
                      endIndent: MediaQuery.of(context).size.height * .05,
                      thickness: MediaQuery.of(context).size.aspectRatio * 1.5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.academicyear,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .008,
                            ),
                            Text(
                              snapshot.data![index].userModelClass!.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.divisionNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: KPrimeryColor1,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .008,
                            ),
                            Text(
                              snapshot.data![index].section!.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          35),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .08,
                    ),
                    Row(
                      children: [pichart(), picharthodor()],
                    )
                  ]);
                },
              );
            } else if (snapshot.hasError) {
              return Text("error=${snapshot.error}");
            } else {
              return Center(
                child: LoadingAnimationWidget.hexagonDots(
                    color: KPrimeryColor1,
                    size: MediaQuery.of(context).size.aspectRatio * 100),
              );
            }
          }),
    );
  }
}
