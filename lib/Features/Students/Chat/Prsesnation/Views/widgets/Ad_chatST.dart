import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myshop/Features/Students/LoginStudent/data/bloc/auth_bloc.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/shared/request_status.dart';
import '../../../../../../core/shared/shared_preferences_service.dart';
import '../../../../../../core/widgets/main_error_widget.dart';
import '../../../../Posts/Prsesnation/bloc/posts_bloc.dart';
import 'chatBubble.dart';

class AdChat extends StatefulWidget {
  const AdChat({super.key});

  @override
  State<AdChat> createState() => _AdChatState();
}

class _AdChatState extends State<AdChat> {
  late ValueNotifier<int?> selectedChild;

  @override
  void initState() {
    if (SharedPreferencesService.getType() == 'Parents') {
      selectedChild = ValueNotifier(
          (context.read<AuthBloc>().state as Authsucss)
                  .childs
                  .firstOrNull
                  ?.id ??
              1);
      context.read<PostsBloc>().add(
            IndexAdvertssEvent(
              id: (context.read<AuthBloc>().state as Authsucss)
                      .childs
                      .firstOrNull
                      ?.id
                      ?.toString() ??
                  1.toString(),
            ),
          );
    } else {
      context.read<PostsBloc>().add(
            IndexAdvertssEvent(
              id: (context.read<AuthBloc>().state as Authsucss)
                  .auth!
                  .id!
                  .toString(),
            ),
          );
    }
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
              if (SharedPreferencesService.getType() == 'Parents')
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.chosestd,
                          style: TextStyle(fontFamily: KFont3, fontSize: 20),
                        ),
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return ValueListenableBuilder(
                              valueListenable: selectedChild,
                              builder: (context, value, _) {
                                return DropdownButton<int>(
                                    dropdownColor: KPrimeryColor2,
                                    style: TextStyle(
                                        color: KPrimeryColor1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    alignment: Alignment.centerRight,
                                    value: value,
                                    items: (state as Authsucss)
                                        .childs
                                        .toSet()
                                        .map((k) {
                                      return DropdownMenuItem(
                                        child: Text(k.firstName! +
                                            '-' +
                                            k.section!.name!),
                                        value: k.id!,
                                      );
                                    }).toList(),
                                    onChanged: (item) {
                                      selectedChild.value = item!;
                                      context.read<PostsBloc>().add(
                                          IndexAdvertssEvent(
                                              id: item.toString()));
                                    });
                              });
                        },
                      ),
                    ],
                  ),
                ),
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
                                context.read<PostsBloc>().add(
                                    IndexAdvertssEvent(
                                        id: selectedChild.value.toString()));
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
