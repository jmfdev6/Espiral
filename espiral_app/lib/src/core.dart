import 'package:espiral_app/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class Core extends StatelessWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Espiral App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (_) =>  HomePage(), 
      },
    );
  }
}