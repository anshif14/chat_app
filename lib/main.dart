import 'package:chat_app/screens/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}
Color primaryColor = Color(0xff31C48D);
Color primaryColorLight = Color(0x3331c48d);
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
        home: tabBar(),
      ),
    );
  }
}

