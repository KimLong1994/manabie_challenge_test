import 'package:challengemanabieapp/screens/both_screen.dart';
import 'package:challengemanabieapp/screens/completed_screen.dart';
import 'package:challengemanabieapp/screens/incompleted_screen.dart';

class LocalData {
  final List<Map<String, dynamic>> changeScreenList = [
    {
      "title": "BOTH",
      "screen": BothScreen(),
    },
    {
      "title": "COMPLETED",
      "screen": CompletedScreen(),
    },
    {
      "title": "INCOMPLETED",
      "screen": IncompletedScreen(),
    }
  ];

  final List<Map<String, dynamic>> toDoList = [
    {
      "work": "Help Father",
      "boolean": true,
    },
    {
      "work": "Help Mother",
      "boolean": true,
    },
    {
      "work": "Learn Flutter",
      "boolean": true,
    },
    {
      "work": "Learn Swift",
      "boolean": true,
    },
    {
      "work": "Learn Kotlin",
      "boolean": false,
    },
    {
      "work": "Learn React Native",
      "boolean": false,
    },
    {
      "work": "Learn Iconic",
      "boolean": false,
    },
  ];
}
