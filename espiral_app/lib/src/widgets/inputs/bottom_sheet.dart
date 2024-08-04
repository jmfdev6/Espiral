 import 'package:flutter/material.dart';

import '../dialogs/custom_dialog.dart';

void configurandoModalBottomSheet(context, Null Function(dynamic event) param1) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(12),
            child: Wrap(
              children: <Widget>[
                ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    leading: new Icon(Icons.list_alt_rounded),
                    title: new Text('escala manual'),
                    onTap: (){showCustomDialogScala(context);}),
                ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: new Icon(Icons.rocket_outlined),
                  title: new Text('escala automática'),
                  onTap: (){showCustomDialogProfissional(context);},
                ),
              ],
            ),
          );
        });
}