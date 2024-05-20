import 'package:flutter/material.dart';
import 'package:watch_video/features/auth/pages/logout_page.dart';
import 'package:watch_video/features/content/Long_video/long_video_screen.dart';
import 'package:watch_video/features/content/short_video/pages/short_video_page.dart';
import 'package:watch_video/features/search/pages/search_screen.dart';

List pages = const [
  LongVideoScreen(),
  ShortVideoPage(),
  Center(
    child: Text("upload"),
  ),
  SearchScreen(),
  LogoutPage(),
];
