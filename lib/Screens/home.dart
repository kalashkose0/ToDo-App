import 'package:flutter/material.dart';
import 'package:todo/models/todoModel.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<TodoModel> ListTodo = [
    TodoModel(
        title: "Notes App",
        desc: "completed with firebase",
        assignedAt: DateTime.now().millisecondsSinceEpoch.toString()),
  ];

  List<String> ListPriority = ["High", "Medium", "Low"];

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

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
                  color: Colors.blue,
                ),
              )
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
                      elevation: 8.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CheckboxListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tileColor:
                            getBackgroundColor(ListTodo[index].priority!),
                        value: ListTodo[index].isCompleted ??
                            false, // Ensure it's not null
                        onChanged: (value) {
                          setState(() {
                            ListTodo[index].isCompleted =
                                value ?? false; // Directly updating the value
                          });
                        },
                        title: Text(
                          ListTodo[index].title ??
                              "Untitled", // Handle null safety
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            decoration: (ListTodo[index].isCompleted ?? false)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text(
                          ListTodo[index].desc ??
                              "No description", // Handle null safety
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            decoration: (ListTodo[index].isCompleted ?? false)
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ),
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
      padding: EdgeInsets.only(
          top: 12,
          left: 12,
          right: 12,
          bottom: 12 + MediaQuery.of(context).viewInsets.bottom),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5 +
          MediaQuery.of(context).viewInsets.bottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Icon(Icons.arrow_back_ios_new_rounded, color: Colors.blue),
              ),
              SizedBox(width: 12),
              Text(
                "Add Todo's",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Title
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter title here",
              label: Text(
                "Title",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          // Description
          TextField(
            controller: descController,
            decoration: InputDecoration(
              hintText: "Enter description here",
              label: Text(
                "Description",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          DropdownMenu(
              width: MediaQuery.of(context).size.width - 22,
              textStyle: TextStyle(fontSize: 16, color: Colors.blue),
              selectedTrailingIcon: Icon(Icons.low_priority_outlined),
              trailingIcon: Icon(
                Icons.arrow_drop_down,
                color: Colors.blue,
              ),
              label: Text(
                "Priority",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              dropdownMenuEntries: ListPriority.map((Priority) =>
                      DropdownMenuEntry(label: Priority, value: Priority))
                  .toList() // [
              //   DropdownMenuEntry(label: "Priority", value: "High"),
              // ],
              ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                child: Text("Add"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 1.0, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
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
                child: Text("Cancel"),
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
        ],
      ),
    );
  }

  Color getBackgroundColor(int priority) {
    if (priority == 1) {
      return Colors.blue;
    } else if (priority == 2) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
