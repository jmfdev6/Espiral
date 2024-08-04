import 'package:espiral_app/src/widgets/calendar.dart';
import 'package:flutter/material.dart';
import '../../widgets/inputs/bottom_sheet.dart';

final List<Widget> _pages = [
  Calendar(),
  const Center(child: Text('Page 2')),
];
final List<BottomNavigationBarItem> _navItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: 'mais',
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late Map<DateTime, List<Map<String, dynamic>>> _events;
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _events = {};
  }

  void _addEvent(Map<String, dynamic> event) {
    setState(() {
      if (_events[_selectedDay] != null) {
        _events[_selectedDay]!.add(event);
      } else {
        _events[_selectedDay] = [event];
      }
    });
  }

  void _removeEvent(DateTime date, int index) {
    setState(() {
      _events[date]!.removeAt(index);
      if (_events[date]!.isEmpty) {
        _events.remove(date);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          mini: true,
          onPressed: () {
            configurandoModalBottomSheet(context, (event) {
              _addEvent(event);
            });
          },
          child: const Icon(
            Icons.add,
            size: 24,
          ),
        ),
        floatingActionButtonLocation: MediaQuery.sizeOf(context).width < 600
            ? FloatingActionButtonLocation.centerDocked
            : FloatingActionButtonLocation.endFloat,
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
