import 'package:flutter/material.dart';
import 'package:todo/models/todoModel.dart';

class home extends StatelessWidget {
  List<TodoModel> ListTodo = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  // TextEditingController titleController = TextEditingController();

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
                itemBuilder: (context, index) {
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
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return bottomSheetContent(context);
                              // Container(
                              //   height: MediaQuery.of(context).size.height * 0.5,
                              // );
                            });
                      },
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
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return bottomSheetContent(context);
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.5,
                // );
              });
        },
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
        splashColor: Colors.blue,
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget bottomSheetContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_rounded, color: Colors.blue),
              SizedBox(width: 12),
              Text(
                "Add Todo's",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter title here ",
                  hintStyle:
                      TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //
}
