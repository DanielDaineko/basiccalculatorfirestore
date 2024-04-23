import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Импорт Firebase Core
import 'calculator_screen.dart';
import 'converter_screen.dart';
import 'themes.dart';

void main() async {
  // Обязательный вызов ensureInitialized для WidgetsFlutterBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Firebase
  await Firebase.initializeApp();

  // Запуск приложения
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => CalculatorScreen(),
        '/converter': (context) => ConverterScreen(),
      },
    );
  }
}
