import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_innocent/data/constant/color.dart';
import 'package:news_innocent/utils/function_helper.dart';

AppBar mainAppBar() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: pink),
    title: Image.asset(
      getSourceByName('logo_celebrities_id'),
      height: kToolbarHeight - 16,
    ),
    centerTitle: true,
    backgroundColor: white,
  );
}

AppBar detailAppBar() {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: pink),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          getSourceByName('logo_celebrities_id'),
          height: kToolbarHeight - 16,
        ),
        const Text(
          'K-POP',
          style: TextStyle(color: pink, fontSize: 14),
        )
      ],
    ),
    backgroundColor: white,
  );
}
