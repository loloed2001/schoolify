import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/core/widgets/main_error_widget.dart';

import '../../../../../constant.dart';
import '../../../../../core/shared/request_status.dart';
import '../bloc/posts_bloc.dart';
import 'widgets/Container_Post_custom.dart';

class PostsPageView extends StatefulWidget {
  PostsPageView({super.key});

  @override
  State<PostsPageView> createState() => _PostsPageViewState();
}

class _PostsPageViewState extends State<PostsPageView> {
  @override
  void initState() {
    context.read<PostsBloc>().add(IndexPostsEvent());

    super.initState();
  }

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
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.notifications,
                    //       color: KPrimeryColor1,
                    //       size: MediaQuery.of(context).size.aspectRatio * 55,
                    //     ))
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
            child: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                return state.status == RequestStatus.loading
                    ? Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : state.status == RequestStatus.failed
                        ? Center(
                            child: MainErrorWidget(onPressed: () {
                              context.read<PostsBloc>().add(IndexPostsEvent());
                            }),
                          )
                        : GridView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.2,
                              mainAxisSpacing:
                                  MediaQuery.of(context).size.height * .04,
                            ),
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              return ContainerPost(post: state.posts[index]);
                            });
              },
            ),
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
