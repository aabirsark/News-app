import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newfeed/constants.dart';
import 'package:newfeed/core/provider.dart';
import 'package:newfeed/screens/home/home.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TopHeadlines(),
    ),
    ChangeNotifierProvider(
      create: (context) => SearchFeed(),
    )
  ], child: const NewFeed()));
}

class NewFeed extends StatelessWidget {
  const NewFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.nunito().fontFamily,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.grey.shade900))),
      home: const HomePage(),
    );
  }
}
