import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/home/login_screen.dart';
 // Contains your color constants and other configurations.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the light theme data with GoogleFonts and a scaffold background color
    final ThemeData lightTheme = ThemeData(
     
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    // Define the dark theme data
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      // Use darker colors for the dark theme
      // Define other dark theme properties as needed
      primarySwatch: Colors.blue,
      primaryColor: Colors.blueGrey[900],
      scaffoldBackgroundColor: Color(0xFF121212), // A common dark theme background color
      visualDensity: VisualDensity.adaptivePlatformDensity,
    /*  textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,*/
      
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sign In Sign Up Ui',
      theme: lightTheme, // The light theme data
      darkTheme: darkTheme, // The dark theme data
      themeMode: ThemeMode.system, // Use the system theme mode
      home: LoginPage(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}