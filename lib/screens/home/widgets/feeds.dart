import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newfeed/core/provider.dart';
import 'package:newfeed/model/headlines.dart';
import 'package:newfeed/screens/widgets/article_card.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<TopHeadlines>().headlines == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: context.watch<TopHeadlines>().headlines!.articles.length,
            itemBuilder: (context, index) {
              var data = context
                  .read<TopHeadlines>()
                  .headlines!
                  .articles
                  .elementAt(index);
              return ArticleCard(data: data);
            },
          );
  }
}

