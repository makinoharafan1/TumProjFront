import 'package:flutter/material.dart';

import 'package:puble_frontend/models/task_model.dart';
import 'package:puble_frontend/screens/dashboard_teacher/components/task_list.dart';
import 'package:puble_frontend/screens/dashboard_teacher/components/task_description.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key});

  @override
  State<InfoWidget> createState() => _InfoWidget();
}

class _InfoWidget extends State<InfoWidget> {

  Widget? currentWidget;

  double opacityLevel = 0;

  double GetDescriptionBoxWidth(BuildContext context, double percent){
    return MediaQuery.of(context).size.width * percent;
  }

  double GetDescriptionBoxPercent(BuildContext context, double width){
    return width / MediaQuery.of(context).size.width;
  }

  double descriptionBoxPercent = 0.3;
  double descriptionBoxPercentWidthMin = 0.2;
  double descriptionBoxPercentWidthMax = 0.4;

  void GetTaskDescription(Task selectedTask) {
      setState(() {
        currentWidget = TeacherTaskDescription(selectedTask: selectedTask, back: GetTaskList);
      });
  }

  void GetTaskList(){
    setState(() {
      currentWidget = TeacherTaskList(callback: GetTaskDescription,);
    });
  }

  @override
  void initState() {
    super.initState();
    currentWidget = TeacherTaskList(callback: GetTaskDescription,);
  } 

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              opacityLevel = 1;
              descriptionBoxPercent = GetDescriptionBoxPercent(context, (GetDescriptionBoxWidth(context, descriptionBoxPercent) - details.delta.dx)
                  .clamp(
                      MediaQuery.of(context).size.width *
                          descriptionBoxPercentWidthMin,
                      MediaQuery.of(context).size.width *
                          descriptionBoxPercentWidthMax));
            });
          },
          onHorizontalDragEnd: (dragEndDetails) {
            setState(() {
              opacityLevel = 0;
            });
          },
          child: InkWell(
            onTap: () => (),
            onHover: (value) {
              setState(() {
                opacityLevel = value ? 1 : 0;
              });
            },
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 5,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
              ),
            ),
          ),
        ),

        SizedBox(
          width: GetDescriptionBoxWidth(context, descriptionBoxPercent),
          child: currentWidget!,
        ),
      ],
    );
  }
}
