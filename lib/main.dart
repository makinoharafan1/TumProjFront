import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:puble_frontend/const/constant.dart';
// import 'package:puble_frontend/screens/dashboard/dashboard_screen.dart';
// import 'package:puble_frontend/screens/login/login_screen.dart';
import 'package:puble_frontend/utils/search_provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';
import 'package:puble_frontend/data/pr_data.dart';
import 'package:puble_frontend/data/task_data.dart';

import 'package:puble_frontend/screens/dashboard_student/dashboard_student_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => SortProvider()),
        Provider(create: (_) => PullRequestData()),
        Provider(create: (_) => TaskData()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dashborad UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.dark,
        ),
        home: const DashboardStudentScreen(), //const Login(title: "3212121",));
    );
  }
}
