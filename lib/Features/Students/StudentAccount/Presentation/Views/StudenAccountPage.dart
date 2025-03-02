import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../DialogLogin/Presentation/Widget/CircleImage.dart';
import 'Widgets/Container_widget.dart';
import '../../../../../constant.dart';

import '../../../LoginStudent/data/bloc/auth_bloc.dart';

class StudentAccountView extends StatelessWidget {
  const StudentAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, colors: [
          KPrimeryColor2,
          Color(0xFFCD6FD0),
          Color(0xFF9B71D2),
          Color(0xFF9B71D2),
          Color(0xFF703EA9),
          Color(0xFFCD6FD0),
        ])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                CircleImageCustom(
                    image: AssetImage('assets/images/studentAccount.jpg'),
                    ontap: () {}),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return (state is Authsucss)
                        ? Text(
                            (state.auth!.firstName ?? ' ') +' '+
                                (state.auth!.lastName ?? ' '),
                            style: TextStyle(
                                fontFamily: KFont2,
                                fontSize:
                                    MediaQuery.of(context).size.aspectRatio *
                                        70,
                                color: KPrimeryColor2,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            'تيم لاجين',
                            style: TextStyle(
                                fontFamily: KFont2,
                                fontSize:
                                    MediaQuery.of(context).size.aspectRatio *
                                        70,
                                color: KPrimeryColor2,
                                fontWeight: FontWeight.bold),
                          );
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Expanded(child: ContainerWidget()),
          ],
        ));
  }
}
