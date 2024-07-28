import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myshop/Features/Students/Posts/Prsesnation/bloc/posts_bloc.dart';
import 'package:myshop/core/widgets/main_error_widget.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import 'chatBubble.dart';

class AdChat extends StatefulWidget {
  const AdChat({super.key});

  @override
  State<AdChat> createState() => _AdChatState();
}

class _AdChatState extends State<AdChat> {
  @override
  void initState() {
    context.read<PostsBloc>().add(IndexAdvertssEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPrimeryColor5,
        appBar: AppBar(
          title: Center(
              child: Text(
            AppLocalizations.of(context)!.adv,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.aspectRatio * 50,
                color: KPrimeryColor5),
          )),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: KPrimeryColor1,
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            return Column(children: [
              Expanded(
                child: state.advertStatus == RequestStatus.success
                    ? ListView.builder(
                        itemCount: state.adverts.length,
                        itemBuilder: (context, index) {
                          return ChatBubbleFreind(
                            message: state.adverts[index].description!,
                          );
                        })
                    : Center(
                        child: state.advertStatus == RequestStatus.failed
                            ? MainErrorWidget(onPressed: () {
                                context
                                    .read<PostsBloc>()
                                    .add(IndexAdvertssEvent());
                              })
                            : CircularProgressIndicator.adaptive(),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02,
                  bottom: MediaQuery.of(context).size.height * .02,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                  width: MediaQuery.of(context).size.width * .95,
                  child: Container(
                    color: KPrimeryColor5,
                    child: Text(
                      AppLocalizations.of(context)!.apply,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              MediaQuery.of(context).size.aspectRatio * 35,
                          color: KPrimeryColor1),
                    ),
                  ),
                ),
              )
            ]);
          },
        ));
  }
}
