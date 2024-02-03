import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/widgets/news_image.dart';

class NewsCard extends StatelessWidget {
  NewsCard({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: NewsImage(
              imagePath: article.imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    article.title ?? "No title found",
                    style: Theme.of(context).textTheme.headline6,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Text(article.date ?? "No date found"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
