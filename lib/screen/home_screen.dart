import 'package:flutter/material.dart';
import 'package:login_ui_4/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _appBar = 'Esta es la pantalla de inicio';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SafeArea(
          child: Text('Bienvenido! ${_appBar}'),
        )
      ),
    );
  }
}
