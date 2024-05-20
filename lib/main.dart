import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/screens/dashboard/dashboard_screen.dart';
import 'package:puble_frontend/screens/login/login_screen.dart';
import 'package:puble_frontend/utils/search_provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';
import 'package:puble_frontend/data/pr_data.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => SortProvider()),
        Provider(create: (_) => PullRequestData()),
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
        title: 'Puble',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.dark,
        ),
        home: const Login());
  }
}
