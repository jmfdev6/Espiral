import 'package:flutter/material.dart';
import 'dialog_actions.dart';
import 'dialog_content_profissional.dart';
import 'dialog_content_scala.dart';
import 'full_screen_dialog.dart';
import 'simple_dialog.dart';

Future<void> showCustomDialogScala(
  BuildContext context,
) async {
  showDialog(
    context: context,
    builder: (context) {
      final showFullScreenDialog = MediaQuery.sizeOf(context).width < 600;
      if (showFullScreenDialog) {
        return  Dialog.fullscreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FullScreenDialogTitle(title: 'Criar escala'),
              DialogContentScala(),
            ],
          ),
        );
      } else {
        return Dialog(
          child: ConstrainedBox(
            constraints:  BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SimpleDialogTitle(),
                DialogContentScala(),
                DialogActions(),
              ],
            ),
          ),
        );
      }
    },
  );
}

Future<void> showCustomDialogProfissional(
  BuildContext context,
) async {
  showDialog(
    context: context,
    builder: (context) {
      final showFullScreenDialog = MediaQuery.sizeOf(context).width < 600;
      if (showFullScreenDialog) {
        return const Dialog.fullscreen(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FullScreenDialogTitle(title: 'escala automática',),
              DialogContentProfissional(),
            ],
          ),
        );
      } else {
        return Dialog(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SimpleDialogTitle(),
                DialogContentProfissional(),
                DialogActions(),
              ],
            ),
          ),
        );
      }
    },
  );
}

const namesList = [
  'Alejandro Ortega',
  'Marty Reyes',
  'Ines Ortega Reyes',
  'Pia Hana Carmen',
  'Carmen'
];
