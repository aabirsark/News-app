import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfeed/api/apis.dart';
import 'package:newfeed/constants.dart';
import 'package:newfeed/core/provider.dart';
import 'package:newfeed/model/headlines.dart';
import 'package:newfeed/screens/home/widgets/feeds.dart';
import 'package:newfeed/screens/home/widgets/search.dart';
import 'package:newfeed/screens/search/search.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    setTrending();
    super.initState();
  }

  setTrending() async {
    var res = await http.get(Uri.parse(Api.topHeadlines));
    var jsonDecoded = jsonDecode(res.body);
    print(jsonDecoded);
    Headlines headlines = Headlines.fromJson(jsonDecoded);
    Provider.of<TopHeadlines>(context, listen: false).setHeadlines(headlines);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appName,
          style: TextStyle(
              fontSize: 22,
              color: Colors.grey.shade900,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Search(),
                    ));
              },
              child: const HomeSearch()),
          // Expanded(child: Lis)
          const SizedBox(
            height: 15,
          ),

          Expanded(child: const Feeds())
        ],
      ),
    );
  }
}
