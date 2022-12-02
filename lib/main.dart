import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/detail_page.dart';
import 'page/home_page.dart';
import 'provider/movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
         ChangeNotifierProvider<MovieProvider>(create: (context) => MovieProvider()),
      ],
      child: const HomePage()),
    );
  }
}



