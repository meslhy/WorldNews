

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/article_details/article_details.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_colors.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context ,
            MaterialPageRoute(
            builder: (context) => ArticleDetails(article: article),
        ),
        );
      },
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                errorWidget: (_, __, ___) => Lottie.asset("assets/icons/not_found.json"),
                progressIndicatorBuilder: (_, __, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress,color: AppColors.primary)),
                height: MediaQuery.of(context).size.height * .25,
                fit: BoxFit.cover,
                ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(article.title ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(fontSize: 11, color: const Color(0xffA3A3A3))),
            const SizedBox(
              height: 2,
            ),
            Text(article.description ?? "" ,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,),
            const SizedBox(
              height: 2,
            ),
            Text(
              article.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(fontSize: 11, color: const Color(0xffA3A3A3)),
            )
          ],
        ),
      ),
    );
  }
}
