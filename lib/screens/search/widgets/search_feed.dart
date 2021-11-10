import 'package:flutter/material.dart';
import 'package:newfeed/core/provider.dart';
import 'package:newfeed/screens/widgets/article_card.dart';
import 'package:provider/provider.dart';

class SrFeeds extends StatelessWidget {
  const SrFeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<SearchFeed>().feed == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<SearchFeed>().feed!.articles.length,
            itemBuilder: (context, index) {
              var data =
                  context.read<SearchFeed>().feed!.articles.elementAt(index);
              return ArticleCard(data: data);
            },
          );
  }
}
