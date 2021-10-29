import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_innocent/data/constant/color.dart';
import 'package:news_innocent/utils/function_helper.dart';

AppBar mainAppBar() {
  return AppBar(
    elevation: 1,
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: pink),
    title: Image.asset(
      getSourceByName('logo_celebrities_id'),
      height: kToolbarHeight - 20,
    ),
    centerTitle: true,
    backgroundColor: white,
  );
}

AppBar detailAppBar() {
  return AppBar(
    elevation: 1,
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: pink),
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          getSourceByName('logo_celebrities_id'),
          height: kToolbarHeight - 20,
        ),
        const Text(
          'Genre',
          style: TextStyle(color: pink, fontSize: 14),
        )
      ],
    ),
    backgroundColor: white,
  );
}
