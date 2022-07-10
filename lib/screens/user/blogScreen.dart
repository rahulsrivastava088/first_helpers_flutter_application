import 'package:first_helpers/utilities/blogsCards.dart';
import 'package:first_helpers/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);
  static const routeName = 'blog-screen';
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Blogs",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh_rounded),
            color: Colors.black,
          )
        ],
      ),
      body: CupertinoScrollbar(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: [
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            BlogCard(
                headline: lorem(words: 10, paragraphs: 1),
                subtitle: lorem(words: 20, paragraphs: 1)),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
