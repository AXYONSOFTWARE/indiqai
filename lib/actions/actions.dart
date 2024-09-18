import '/modals/notificationmodal/notificationmodal_widget.dart';
import 'package:flutter/material.dart';

Future cpfauthvalidator(BuildContext context) async {}

Future notificationShow(BuildContext context) async {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    enableDrag: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: MediaQuery.viewInsetsOf(context),
        child: const NotificationmodalWidget(
          buttonText: '.',
        ),
      );
    },
  );

  await Future.delayed(const Duration(milliseconds: 2000));
}

Future giraroleta(BuildContext context) async {}
