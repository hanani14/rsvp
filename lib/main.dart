import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rsvp/Frontend/rsvp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return ResponsiveSizer(builder: (context, orientation, screenType) {
    return MaterialApp(
      title: 'RSVP Form',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0, 166, 184, 100)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const RSVPLanding(),
    );});
  }
}
