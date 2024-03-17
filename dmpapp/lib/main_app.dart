import 'package:dmpapp/views/login_view.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark, 
          primary:  Color.fromARGB(255,152,151,26), 
          onPrimary:  Color.fromARGB(255,184,187,38),
          secondary:  Color.fromARGB(255,215,153,33), 
          onSecondary:  Color.fromARGB(255,250,189,47), 
          error:  Color.fromARGB(255,204,36,29), 
          onError:  Color.fromARGB(255,251,73,52), 
          background:  Color.fromARGB(255,40,40,40), 
          onBackground:  Color.fromARGB(255,146,131,116), 
          surface:  Color.fromARGB(255,50,48,47), 
          onSurface:  Color.fromARGB(255,251,241,199)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
