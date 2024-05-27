import 'package:flutter/material.dart';

enum TaskState { NotLoaded, Awaiting, Rejected, Approved}

var map = <TaskState, StateData>{
  TaskState.NotLoaded: StateData(
    icon: Icons.add,
    color: Colors.grey,
  ),
  TaskState.Awaiting: StateData(
    icon: Icons.remove_red_eye,
    color: Colors.yellow,
  ),
  TaskState.Rejected: StateData(
    icon: Icons.clear,
    color: Colors.red,
  ),
  TaskState.Approved: StateData(
    icon: Icons.check,
    color: Colors.green,
  ),
};

class StateData{
  final IconData icon;
  final Color color;

  StateData({
    required this.icon,
    required this.color,
  });
}

// var map = <TaskState, Widget>{
//   TaskState.NotLoaded: CircleAvatar(
//     backgroundColor: Colors.grey,
//     child: IconButton(
//       icon: const Icon(Icons.add, color: Colors.black),
//       onPressed: () async {

//       },
//     ),
//   ),

//   TaskState.Awaiting: const CircleAvatar(
//     backgroundColor: Colors.yellow,
//     child: Icon(Icons.remove_red_eye, color: Colors.black),
//   ),

//   TaskState.Approved: const CircleAvatar(
//     backgroundColor: Colors.green,
//     child: Icon(Icons.check, color: Colors.black),
//   ),

//   TaskState.Rejected: CircleAvatar(
//     backgroundColor: Colors.red,
//     child: IconButton(
//       icon: const Icon(Icons.clear, color: Colors.black),
//       onPressed: () async {

//       },
//     ),
//   ),
// };

class Task{
  final int number;
  final String description;
  final TaskState state;
  Task({
    required this.number,
    required this.description,
    required this.state,
  });
}
