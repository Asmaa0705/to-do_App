import'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(){
  runApp (const TodoListApp());
}
class TodoListApp extends StatelessWidget {
  const TodoListApp ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp (
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal),
      home: const HomeScreen()
    );
  }
}