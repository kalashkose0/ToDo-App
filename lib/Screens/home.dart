import 'package:flutter/material.dart';
import 'package:todo/models/todoModel.dart';

class home extends StatelessWidget {
  List<TodoModel> ListTodo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: RichText(
              text: TextSpan(text: "ToDo", children: [
        TextSpan(
            text: "Manager",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))
      ]))),
      body: ListView.builder(
        itemCount: ListTodo.length,
        itemBuilder: (context,snapshot){

        }),
    );
  }
}
