import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfeed/screens/search/search.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "search",
      child: Container(
          height: 42,
          // margin: EdgeInsets.symmetric(
          //     horizontal: MediaQuery.of(context).size.width * 0.05),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.shade300),
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              const Icon(
                CupertinoIcons.search,
                // size: 15,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: IgnorePointer(
                  child: Material(
                    color: Colors.transparent,
                    child: TextFormField(
                      cursorColor: Colors.blueAccent,
                      style: TextStyle(color: Colors.grey.shade900),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search a topic...",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
