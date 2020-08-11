import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:challengemanabieapp/data/local_data.dart';
import 'package:challengemanabieapp/widgets/check_box_list_widget.dart';

final GetIt getIt = GetIt.instance;

class IncompletedScreen extends StatefulWidget {
  @override
  State createState() => _IncompletedScreenState();
}

class _IncompletedScreenState extends State<IncompletedScreen> {
  final LocalData _localData = getIt.get<LocalData>();

  List<Map<String, dynamic>> _toDoList = [];

  void _updateIncompleted(List<Map<String, dynamic>> list) {
    for (var item in list) {
      if (!item["boolean"]) {
        _toDoList.add(item);
      }
    }
  }

  @override
  void initState() {
    _updateIncompleted(_localData.toDoList);
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
        body: _toDoList.isEmpty
            ? Center(
                child: Text(
                  "No Works Are Incompleted",
                  style: GoogleFonts.robotoSlab(
                    fontSize: 60.sp,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[CheckBoxListWidget(toDoList: _toDoList)],
                ),
              ),
      ),
    );
  }
}
