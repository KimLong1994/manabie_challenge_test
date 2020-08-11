import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:challengemanabieapp/data/local_data.dart';
import 'package:challengemanabieapp/widgets/check_box_list_widget.dart';

final GetIt getIt = GetIt.instance;

class BothScreen extends StatefulWidget {
  @override
  State createState() => _BothScreenState();
}

class _BothScreenState extends State<BothScreen> {
  final LocalData _localData = getIt.get<LocalData>();

  List<Map<String, dynamic>> _toDoList = [];

  @override
  void initState() {
    _toDoList = _localData.toDoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      height: 1920,
      width: 1080,
      allowFontScaling: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[CheckBoxListWidget(toDoList: _toDoList)],
          ),
        ),
      ),
    );
  }
}
