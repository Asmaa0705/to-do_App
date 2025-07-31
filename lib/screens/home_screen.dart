import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreen() ;
}
class _HomeScreen extends State<HomeScreen>{
  final List<Task> _tasks = [];
  final TextEditingController _text = TextEditingController ();
  void _addTask (){
    final text = _text.text.trim();
    if (text.isNotEmpty){
    _tasks.add(Task(title: text));
    _text.clear();
    setState(() {}); //notify Flutter to rbuild the UI
    }
  }
  void _toggleTask (int index){
    setState((){_tasks[index].toggleDone();});
  }
  
  void _deleteTask(int index){
    setState((){_tasks.removeAt(index);});
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children:[
                Expanded(
                  child: TextField(
                    controller: _text,
                    decoration: const InputDecoration(labelText: 'enter a atask',)
                  ),
                ),
                const SizedBox(width:10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ]
            ),
            const SizedBox(height:20),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder:(context, index){
                  final task = _tasks[index];
                  return ListTile (
                    leading: Checkbox(
                      value : task.isDone,
                       onChanged : (_) => _toggleTask(index),
                    ),

                        
                    title: Text( task.title,
                      style: TextStyle(
                        decoration: task.isDone ? TextDecoration.lineThrough : null
                      ),
                      ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteTask(index)
                    )
                  );
                }
              )
            )


          ]
        )
      )
    );
  }

}