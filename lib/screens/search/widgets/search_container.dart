import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfeed/api/apis.dart';
import 'package:newfeed/core/provider.dart';
import 'package:newfeed/model/headlines.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchContainer extends StatelessWidget {
  SearchContainer({
    Key? key,
    required this.resetFunc,
  }) : super(key: key);

  final VoidCallback resetFunc;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey.shade300),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(
            //   width: 6,
            // ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(CupertinoIcons.left_chevron),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // const SizedBox(
            //   width: 6,
            // ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: TextFormField(
                  controller: _controller,
                  cursorColor: Colors.blueAccent,
                  style: TextStyle(color: Colors.grey.shade900),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search a topic...",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Material(
                color: Colors.transparent,
                child: IconButton(
                    onPressed: () async {
                      resetFunc();
                      var searchUrl = Api.search(_controller.text);
                      print(searchUrl);
                      var res = await http.get(Uri.parse(searchUrl));
                      var decoded = jsonDecode(res.body);
                      Headlines data = Headlines.fromJson(decoded);
                      context.read<SearchFeed>().setFeed(data);
                      print(decoded);
                    },
                    icon: Icon(CupertinoIcons.search))),
            const SizedBox(
              width: 6,
            ),
          ],
        ));
  }
}
