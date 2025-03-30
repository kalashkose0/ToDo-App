import 'package:flutter/material.dart';
import 'package:todo/models/todoModel.dart';

class home extends StatelessWidget {
  List<TodoModel> ListTodo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "ToDo",
            children: [
              TextSpan(
                  text: " Manager",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTodo.isNotEmpty
            ? ListView.builder(
                itemCount: ListTodo.length,
                itemBuilder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Checkbox(value: false, onChanged: (value) {}),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Todo's yet",
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Add Now"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 1.0, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        splashColor: Colors.blue,
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add),
      ),
    );
  }

  


}
