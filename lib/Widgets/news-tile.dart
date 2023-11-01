import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.articleModel}) : super(key: key);

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            height: 150,
            width: double.infinity,
            fit: BoxFit.fill,
            imageUrl: articleModel.urlToImage ?? '',
         errorWidget: (context, url, error) {

              return const Center(
                child: Icon(
                  Icons.error,
                  size: 20,
                  color: Colors.black,
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.description ?? '',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ),
    );
  }
}
