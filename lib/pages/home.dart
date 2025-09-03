import 'package:blog_app/pages/add_blog.dart';
import 'package:blog_app/pages/view_blog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.black,
    title: const Text('Welcome to My Blog App', style: TextStyle(color: Colors.white)),
    centerTitle: true,
  ),
  body: const Center(
    child: Text("Home Screen"),
  ),
  floatingActionButton: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      FloatingActionButton(
        heroTag: "addBlog",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddBlogScreen()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      const SizedBox(width: 16),
      FloatingActionButton(
        heroTag: "viewBlog",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewBlogScreen()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.article),
      ),
    ],
  ),
);

  }
}
