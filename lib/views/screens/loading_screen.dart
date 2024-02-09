// fichier: lib/views/loading_screen.dart

import 'package:flutter/material.dart';
import 'package:best_rent/views/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simuler une requête API avec un délai
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); // Naviguer vers HomeScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading...'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
