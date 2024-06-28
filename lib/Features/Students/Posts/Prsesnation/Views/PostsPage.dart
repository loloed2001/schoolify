import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/Features/Students/Posts/Prsesnation/Views/widgets/Container_Post_custom.dart';
import 'package:myshop/constant.dart';

class PostsPageView extends StatelessWidget {
  PostsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimeryColor5,
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .04,
                  bottom: MediaQuery.of(context).size.height * .01,
                  left: MediaQuery.of(context).size.width * .07,
                  right: MediaQuery.of(context).size.width * .07,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Schoolify',
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 50,
                          fontWeight: FontWeight.bold,
                          color: KPrimeryColor1,
                          fontFamily: KFont,
                          letterSpacing:
                              MediaQuery.of(context).size.width * .006),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: KPrimeryColor1,
                          size: MediaQuery.of(context).size.aspectRatio * 55,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .03,
            ),
            child: GridView.builder(

                //physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: MediaQuery.of(context).size.height * .04,
                ),
                itemBuilder: (context, index) {
                  return ContainerPost();
                }),
          ),
        ),
      ]

          // body: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 1,
          //       childAspectRatio: 1.2,
          //       mainAxisSpacing: 12,
          //     ),
          //     itemBuilder: (context, index) {
          //       return ContainerPost();
          //     }),
          ),
    );
  }
}
