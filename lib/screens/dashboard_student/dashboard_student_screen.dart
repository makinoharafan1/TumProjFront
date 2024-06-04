import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puble_frontend/utils/responsive.dart';

import 'package:puble_frontend/screens/dashboard/components/info_widget.dart';
// import 'package:puble_frontend/screens/dashboard/components/dashboard_widget.dart';
import 'package:puble_frontend/screens/dashboard/components/side_menu_widget.dart';

// import 'package:puble_frontend/screens/dashboard_student/components/submitted_task_list.dart';
import 'package:puble_frontend/screens/dashboard_student/components/task_description.dart';
import 'package:puble_frontend/screens/dashboard_student/components/task_list.dart';

class DashboardStudentScreen extends StatefulWidget {
  const DashboardStudentScreen({super.key});

  @override
  State<DashboardStudentScreen> createState() => _DashboardStudentScreen();
}


class _DashboardStudentScreen extends State<DashboardStudentScreen> {

  String? x = """# ЛР№1 Реализовать движение объектов на игровом поле в рамках подсистемы Игровой сервер.

Задание:
1. Реализовать прямолинейное равномерное движение без деформации космического корабля и фотонной торпеды.

## Definition of Done критерии

1. Само движение реализовано в виде отдельного класса
2. Для движущихся объектов определен интерфейс, устойчивый к появлению новых видов движущихся объектов
3. Код решения опубликован на github в отдельной ветке (каждая задача).
4. Код компилируется без ошибок
5. Реализован тест: Для объекта, находящегося в точке (12, 5) и движущегося со скоростью (-7, 3) движение меняет положение объекта на (5, 8)
6. Реализован тест: Попытка сдвинуть объект, у которого невозможно прочитать положение объекта в пространстве, приводит к ошибке
7. Реализован тест: Попытка сдвинуть объект, у которого невозможно прочитать значение мгновенной скорости, приводит к ошибке
8. Реализован тест: Попытка сдвинуть объект, у которого невозможно изменить положение в пространстве, приводит к ошибке
9. Все тесты успешно выполняются.
10. Настроен расчет покрытия кода тестами.
11. Настроен CI, который умеет собирать проект и прогонять тесты, вычислять покрытие кода тестами.
12. Покрытие кода тестами 100%.
13. Пайплайн “зеленый”""";

  double width_ = 500;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: !isDesktop
          ? const SizedBox(
              width: 250,
              child: SideMenuWidget(),
            )
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const InfoWidget(),
            )
          : null,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop)
              const Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(),
                ),
              ),
            const Expanded(
              flex: 6,
              child: TaskList(),
            ),
            if (x != null)
              Row(
                children: [
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      if (details.delta.dx > 0) {
                        final newWidth = width_ - details.delta.distance;
                        setState(() {
                          width_ = newWidth;
                      });
                      }
                      if (details.delta.dx < 0){
                        final newWidth = width_ + details.delta.distance;
                        setState(() {
                          width_ = newWidth;
                      });
                      }
                    },
                    child: Container(
                        width: 10,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.purple,
                    ),
                  ),
                  Container(
                    width: width_,
                    child: TaskDescription(description: x!,),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
