import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/article_details/web_view_article.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/widgets/all.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;
  const ArticleDetails({super.key , required this.article});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Title"),
          toolbarHeight: MediaQuery.of(context).size.height * .1,
        ),
        body: Container(
          constraints:const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.splashBackground),
                fit: BoxFit.cover),
          ),
          margin:const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  progressIndicatorBuilder: (_, __, progress) => Center(
                      child: CircularProgressIndicator(value: progress.progress,)),
                  height: MediaQuery.of(context).size.height * .25,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("${article.source!.name!}*" ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(fontSize: 11, color: const Color(0xffA3A3A3))),
              const SizedBox(
                height: 5,
              ),
              Text(article.description ?? "" ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                article.publishedAt ?? "",
                textAlign: TextAlign.end,
                style: GoogleFonts.inter(fontSize: 11, color: const Color(0xffA3A3A3)),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .6,
                  child: Card(
                    // borderOnForeground: true,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0 , vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              article.description??"",
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 13
                            ),
                          ),
                          const Spacer(),
                          InkWell(

                            onTap: () {
                              navigateTo(context, webview(url: article.url??""));
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("View Full Article"),
                                Icon(Icons.arrow_right,size: 30,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
