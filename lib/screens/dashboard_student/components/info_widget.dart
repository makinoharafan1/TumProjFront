import 'package:flutter/material.dart';

import 'package:puble_frontend/models/task_model.dart';
import 'package:puble_frontend/screens/dashboard_student/components/task_description.dart';

class InfoWidget extends StatefulWidget {
  const InfoWidget({super.key, required this.task, required this.close});

  final Task? task;

  final Function() close;

  @override
  State<InfoWidget> createState() => _InfoWidget();
}

class _InfoWidget extends State<InfoWidget> {
  double opacityLevel = 0;

  double descriptionBoxPercent = 0.3;
  double descriptionBoxPercentWidthMin = 0.2;
  double descriptionBoxPercentWidthMax = 0.4;

  double GetDescriptionBoxWidth(BuildContext context, double percent){
    return MediaQuery.of(context).size.width * percent;
  }

  double GetDescriptionBoxPercent(BuildContext context, double width){
    return width / MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.task != null)
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
          width: widget.task == null ? 0 : GetDescriptionBoxWidth(context, descriptionBoxPercent),
          child: TaskDescription(
            selectedTask: widget.task,
            close: widget.close,
          ),
        ),
      ],
    );
  }
}
