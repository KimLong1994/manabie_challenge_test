import 'package:flutter_test/flutter_test.dart';

import 'package:get_it/get_it.dart';

import 'package:challengemanabieapp/check/function.dart';

final GetIt getIt = GetIt.instance;

Future setupGetIt() async {
  getIt.registerLazySingleton<FunctionTest>(
    () => FunctionTest(),
  );
}

void main() async {
  await setupGetIt();

  final FunctionTest _functionTest = getIt.get<FunctionTest>();
  final List<Map<String, dynamic>> _onlyTrueValueList = [
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
      "boolean": true,
    },
    {
      "work": "Learn React Native",
      "boolean": true,
    },
    {
      "work": "Learn Iconic",
      "boolean": true,
    },
  ];
  final List<Map<String, dynamic>> _onlyFalseValueList = [
    {
      "work": "Help Father",
      "boolean": false,
    },
    {
      "work": "Help Mother",
      "boolean": false,
    },
    {
      "work": "Learn Flutter",
      "boolean": false,
    },
    {
      "work": "Learn Swift",
      "boolean": false,
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

  // Test updateCompleted Function

  test(
    "Return String: List has value because this function recieve true value",
    () {
      var result = _functionTest.updateCompleted(_onlyTrueValueList);
      expect(result, "List has value");
    },
  );

  test(
    "Return String: List Empty because this function don't recieve false value",
    () {
      var result = _functionTest.updateCompleted(_onlyFalseValueList);
      expect(result, "List Empty");
    },
  );

  // Test updateIncompleted Function

  test(
    "Return String: List Empty because this function don't recieve true value",
    () {
      var result = _functionTest.updateIncompleted(_onlyTrueValueList);
      expect(result, "List Empty");
    },
  );

  test(
    "Return String: List has value because this function recieve false value",
    () {
      var result = _functionTest.updateIncompleted(_onlyFalseValueList);
      expect(result, "List has value");
    },
  );
}
