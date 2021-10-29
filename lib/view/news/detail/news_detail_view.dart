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
  late ScrollController _scrollController;

  @override
  void initState() {
    item = widget.argument;
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      item.title ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'By ${item.contributorName ?? ''}',
                      style: const TextStyle(
                          color: pink,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      getFormattedDate(item.createdAt),
                      style: const TextStyle(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: FadeInImage.assetNetwork(
                        placeholder: getSourceByName('logo_celebrities_id'),
                        image: item.contentThumbnail!),
                  ),
                  if (item.slideshow!.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            _slideshowItem(item.slideshow![index]),
                        itemCount: item.slideshow?.length,
                      ),
                    ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Foto: api/innocent/',
                      style: TextStyle(color: grey, fontSize: 12),
                    ),
                  ),
                  Text(
                    item.content!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(wordSpacing: 2, fontSize: 14),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _slideshowItem(String image) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(image, width: 100),
        ),
      ),
    );
  }
}
