import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:puble_frontend/const/constant.dart';
import 'package:puble_frontend/data/task_data.dart';
import 'package:puble_frontend/screens/login/login_screen.dart';
import 'package:puble_frontend/utils/search_provider.dart';
import 'package:puble_frontend/utils/sort_provider.dart';
import 'package:puble_frontend/data/pr_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => SortProvider()),
        Provider(create: (_) => PullRequestData()),
        Provider(create: (_) => TaskData())
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
        title: 'Puble',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: loginPageBackgroundColor,
            brightness: Brightness.dark,
            textTheme: GoogleFonts.notoSansCherokeeTextTheme(textTheme)),
     home: const Login()
     );
  }
}
