import 'package:flutter/material.dart';

import 'package:puble_frontend/models/task_model.dart';
import 'package:puble_frontend/screens/dashboard_student/components/task_description.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({
    super.key, 
    required this.task,
    required this.close
  });

  final Task? task;

  final Function() close;

  @override
  State<InfoWidget> createState() => _InfoWidget();
}

class _InfoWidget extends State<InfoWidget> {

  double descriptionBoxWidth = 550;

  @override
  void initState() {
    super.initState();
    descriptionBoxWidth = 550;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.task == null ? 0 : descriptionBoxWidth ,
      child: TaskDescription(selectedTask: widget.task, close: widget.close,),
    );
  }
}

// if (selectedTask != null)
//   Row(
//     children: [
//       GestureDetector(
//         onHorizontalDragUpdate: (details) {
//           setState(() {
//               opacityLevel = 1;

//               descriptionBoxWidth = (descriptionBoxWidth - details.delta.dx).clamp(descriptionBoxWidthMin, descriptionBoxWidthMax);
//               if (descriptionBoxWidth == descriptionBoxWidthMin) {
//                 selectedTask = null;
//                 descriptionBoxWidth = descriptionBoxWidthStart;
//               }
//           });
//         },
//         onHorizontalDragEnd: (dragEndDetails){
//           setState(() {opacityLevel = 0;});
//         },
//         child : InkWell(
//           onTap: () => (),
//           onHover: (value) {
//             setState(() {
//               opacityLevel = value ? 1 : 0;
//             });
//           },
//           child: AnimatedOpacity(
//             opacity: opacityLevel,
//             duration: const Duration(milliseconds: 100),
//             child: Container(
//                 width: 5,
//                 height: MediaQuery.of(context).size.height,
//                 color: Colors.blue,
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: descriptionBoxWidth,
//         child: TaskDescription(selectedTask: selectedTask!, updateMode: updateMode, isRedacting: isRedacting,),
//       )
//     ],
//   ),