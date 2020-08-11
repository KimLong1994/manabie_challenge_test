import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;

import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:challengemanabieapp/data/local_data.dart';
import 'package:challengemanabieapp/check/function.dart';

final getIt = GetIt.instance;

Future setupGetIt() async {
  getIt.registerLazySingleton<LocalData>(
    () => LocalData(),
  );
  getIt.registerLazySingleton<FunctionTest>(
    () => FunctionTest(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Services.SystemChrome.setPreferredOrientations([
    Services.DeviceOrientation.portraitUp,
    Services.DeviceOrientation.portraitDown,
  ]);

  await setupGetIt();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _startIndex = 0;
  final LocalData _localData = getIt.get<LocalData>();

  void _changedIndex(int index) {
    setState(() => _startIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920,
      width: 1080,
      allowFontScaling: false,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _localData.changeScreenList[_startIndex]["title"],
          style: GoogleFonts.robotoSlab(
            fontSize: 58.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _localData.changeScreenList[_startIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.format_list_checkbox),
            title: Text("Both", style: GoogleFonts.robotoSlab()),
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.checkbox_multiple_marked_circle),
            title: Text("Completed", style: GoogleFonts.robotoSlab()),
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.checkbox_multiple_blank_circle),
            title: Text("Incompleted", style: GoogleFonts.robotoSlab()),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 78.sp),
        selectedFontSize: 38.sp,
        unselectedIconTheme: IconThemeData(size: 78.sp),
        unselectedFontSize: 38.sp,
        currentIndex: _startIndex,
        onTap: _changedIndex,
      ),
    );
  }
}
