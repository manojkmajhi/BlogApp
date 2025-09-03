import 'package:blog_app/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'add_blog.dart';
import 'view_blog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Blog> blogs = [
    Blog(
      title: "Getting Started with Flutter",
      content: "Flutter is Google’s UI toolkit for building apps.",
    ),
    Blog(
      title: "Why I Built My Blog App",
      content:
          "This app is a practice project for learning Flutter state management.",
    ),
    Blog(
      title: "Tips for Better Blogging",
      content: "Consistency is key. Write often, write with passion.",
    ),
  ];

  void addBlog(Blog blog) {
    setState(() {
      blogs.add(blog);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reversedBlogs = blogs.reversed.toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 222, 222),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Blog App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: blogs.isEmpty
          ? const Center(child: Text("No blogs yet. Add one!"))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (reversedBlogs.isNotEmpty)
                  Card(
                    color: const Color.fromARGB(255, 235, 235, 235),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        reversedBlogs.first.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        reversedBlogs.first.content,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.fiber_new, color: Colors.red),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewBlogScreen(blogs: blogs),
                          ),
                        );
                      },
                    ),
                  ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    "Other Blogs",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: reversedBlogs.length > 2
                        ? 2
                        : reversedBlogs.length - 1,
                    itemBuilder: (context, index) {
                      final blog = reversedBlogs[index + 1];
                      return Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(blog.title),
                          subtitle: Text(
                            blog.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ViewBlogScreen(blogs: blogs),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.black,
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              "Add Blog",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final newBlog = await Navigator.push<Blog>(
                context,
                MaterialPageRoute(builder: (context) => const AddBlogScreen()),
              );

              if (newBlog != null) {
                addBlog(newBlog);
              }
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.article, color: Colors.white),
            label: const Text(
              "View Blogs",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewBlogScreen(blogs: blogs),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
