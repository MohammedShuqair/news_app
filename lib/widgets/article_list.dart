import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/web_view/web_view.dart';
import 'package:news_app/widgets/orange_divider.dart';
import 'package:news_app/widgets/card.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.list,
  });

  final List<Article> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const DividerOrange(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: list[index].url != null
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => WebViewScreen(url: list[index].url!)));
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: NewsCard(
            article: list[index],
          ),
        ),
      ),
    );
  }
}
