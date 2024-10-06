import 'package:espiral_app/src/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final List<Widget> _pages = [
  const Calendar(),
  const Center(child: Text('Page 2')),
  const Center(child: Text('Page 3')),

];
final List<BottomNavigationBarItem> _navItems = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/svg/bottom1.svg'),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/svg/bottom2.svg'),
    label: '',
  ),
    BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/svg/bottom3.svg'),
    label: '',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset('assets/svg/logo.svg'),
          actions: [SvgPicture.asset('assets/svg/notifi.svg')],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          iconSize: 18,
          onTap: _onNavItemTapped,
          items: _navItems,
        ),
      ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
