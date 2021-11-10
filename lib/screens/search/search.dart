import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfeed/screens/search/widgets/search_container.dart';
import 'package:newfeed/screens/search/widgets/search_feed.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool visible = false;

  resetVisible() {
    visible = !visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Hero(
            tag: "search",
            child: SearchContainer(
              resetFunc: resetVisible,
            ),
          ),
          Expanded(child: Visibility(visible: visible, child: const SrFeeds()))
        ],
      ),
    );
  }
}
