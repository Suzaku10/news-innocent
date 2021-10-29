import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_innocent/data/constant/color.dart';
import 'package:news_innocent/data/remote/news_response/news_response.dart';
import 'package:news_innocent/utils/function_helper.dart';
import 'package:news_innocent/view/component/appbar.dart';

class NewsDetailView extends StatefulWidget {
  final NewsResponse argument;

  const NewsDetailView({Key? key, required this.argument}) : super(key: key);

  @override
  _NewsDetailViewState createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  late NewsResponse item;

  @override
  void initState() {
    item = widget.argument;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  item.title ?? '',
                  style: const TextStyle(
                      fontSize: 20, color: black, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'By ${item.contributorName ?? ''}',
                  style: const TextStyle(
                      color: pink, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  getFormattedDate(item.createdAt),
                  style: const TextStyle(
                      color: black, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FadeInImage.assetNetwork(
                    placeholder: getSourceByName('logo_celebrities_id'),
                    image: item.contentThumbnail!),
              ),
              if (item.slideshow!.isNotEmpty)
                ListView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      _slideshowItem(item.slideshow![index]),
                ),
              Text(
                item.content!,
                textAlign: TextAlign.left,
                style: const TextStyle(wordSpacing: 2),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _slideshowItem(String image) {
    return SizedBox(
      height: 100,
      child: Image.network(image, width: 100),
    );
  }
}
