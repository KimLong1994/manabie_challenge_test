import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CheckBoxListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> toDoList;

  CheckBoxListWidget({this.toDoList});

  @override
  State createState() => _CheckBoxListWidgetState();
}

class _CheckBoxListWidgetState extends State<CheckBoxListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: widget.toDoList.length,
      itemBuilder: (BuildContext context, int index) {
        final item = widget.toDoList[index];
        return CheckboxListTile(
          title: Text(
            item["work"],
            style: GoogleFonts.robotoSlab(fontSize: 50.sp),
          ),
          value: item["boolean"],
          onChanged: (bool value) {
            setState(() {
              item["boolean"] = value;
            });
          },
        );
      },
    );
  }
}
