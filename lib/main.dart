import 'package:flutter/material.dart';

void main() {
  runApp(MeetingNotesApp());
}

class MeetingNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meeting Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Meeting Notes')),
        body: const Center(child: Text('Welcome to Meeting Notes')),
      ),
    );
  }
}