  import 'package:blog_app/pages/add_blog.dart';
import 'package:blog_app/pages/home.dart';
import 'package:blog_app/pages/view_blog.dart';
  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatefulWidget {
    const MyApp({super.key});

    @override
    State<MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        // home: const AddBlogScreen(),
        // home: const ViewBlogScreen(),
      );
    }
  }