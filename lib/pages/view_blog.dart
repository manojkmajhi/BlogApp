import 'package:flutter/material.dart';

class ViewBlogScreen extends StatefulWidget {
  const ViewBlogScreen({super.key});

  @override
  State<ViewBlogScreen> createState() => _ViewBlogScreenState();
}

class _ViewBlogScreenState extends State<ViewBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 244, 245),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('View Blog', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Blog Title:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'My First Blog Post',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Blog Content:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This is where the blog content will be displayed. '
                  'You can load it from a database or API later.',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
