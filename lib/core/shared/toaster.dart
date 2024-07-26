import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Toaster {
  Toaster._();
  static void showToast(String text, {bool isError = true}) {
    BotToast.showCustomText(toastBuilder: (cancelFunc) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(isError ? Icons.warning_amber_rounded : Icons.done,
                  color: isError ? Colors.red : Colors.green, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(text,
                    maxLines: 3,
                    style: TextStyle(
                        color: isError ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
            ],
          ));
    });
  }

  static void showLoading() {
    BotToast.showCustomLoading(toastBuilder: (cancelFunc) {
      return const Card(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 59, 92, 30),
              )));
    });
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void showNotification({
    Widget Function(void Function())? leading,
    Widget Function(void Function())? title,
    Widget Function(void Function())? subtitle,
    Color? backgroundColor,
  }) {
    BotToast.showNotification(
      title: title,
      subtitle: subtitle,
      leading: leading,
      backgroundColor: backgroundColor,
    );
  }
}
