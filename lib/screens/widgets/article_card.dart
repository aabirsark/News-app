import 'package:flutter/material.dart';
import 'package:newfeed/model/headlines.dart';
import 'package:newfeed/screens/detail/detail.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Articles data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Detail(url: data.url ?? "https://google.com/"),
            ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8, horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Container(
          // height: 250,
          clipBehavior: Clip.antiAlias,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                        image: NetworkImage(
                          data.urlToImage ?? "",
                        ),
                        fit: BoxFit.cover),
                    // border: Border.all(color: Colors.grey.shade100, width: 3),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                width: double.maxFinite,
                // child: Image.network(
                //   data.urlToImage ?? "",
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 12, bottom: 4),
                child: Text(data.title ?? "",
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        wordSpacing: 2)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: Text(data.description ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        wordSpacing: 2)),
              ),
              data.source!.name != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              data.source!.name ?? "",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
