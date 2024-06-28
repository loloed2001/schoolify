import 'package:flutter/material.dart';
import 'package:myshop/Features/Students/Chat/Prsesnation/Views/widgets/chatBubble.dart';
import 'package:myshop/constant.dart';

class ChatParents extends StatelessWidget {
  const ChatParents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPrimeryColor2,
        appBar: AppBar(
          title: Center(
              child: Text(
            'المشرف',
            style: TextStyle(
                fontFamily: KFont2,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: KPrimeryColor2),
          )),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: KPrimeryColor1,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ChatBubble();
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 3),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .07,
              width: MediaQuery.of(context).size.width * .95,
              child: TextField(
                minLines: 1,
                maxLines: 3,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: '...قم بكتابة رسالة',
                  hintStyle: TextStyle(
                      fontFamily: KFont2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      fontSize: 20),
                  suffixIcon: Icon(
                    Icons.send,
                    color: KPrimeryColor1,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: KPrimeryColor1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: KPrimeryColor1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
