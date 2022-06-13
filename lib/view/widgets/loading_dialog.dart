import 'package:flutter/material.dart';
import 'package:nicetodo/const/colors.dart';

void showLoading(BuildContext context, {String? message}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: background, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  message ?? "Processing, Please wait...",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            ],
          ),
        )),
      );
    },
  );
}
