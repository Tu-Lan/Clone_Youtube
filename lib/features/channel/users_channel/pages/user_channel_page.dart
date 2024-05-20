import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_video/cores/screens/loader.dart';
import 'package:watch_video/cores/widgets/flat_button.dart';

import '../../../../cores/screens/error_page.dart';
import '../../../auth/provider/user_provider.dart';

class UserChannelPage extends StatefulWidget {
final String userId;
  const UserChannelPage({super.key, required this.userId});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              return ref.watch(anyUserDataProvider(widget.userId)).when(
                    data: (user) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset("assets/images/flutter background.png"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 20, right: 12),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                backgroundColor: Colors.grey,
                                backgroundImage:
                                    CachedNetworkImageProvider(user.profilePic),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.displayName,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      user.username,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${user.subscriptions.length} người đăng kí'),
                                          TextSpan(
                                              text: '${user.videos} videos'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20, left: 8, right: 8),
                          child: FlatButton(
                              text: "ĐĂNG KÝ",
                              onPressed: () {},
                              colour: Colors.black),
                        ),
                        user.videos == 0
                            ? const Center(
                                child: Text(
                                  "Không có video",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 14),
                                child: Text(
                                  "${user.displayName}' Videos",
                                  style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                      ],
                    ),
                    error: (error, stackTrace) => const ErrorPage(),
                    loading: () => const Loader(),
                  );
            })
          ],
        ),
      ),
    );
  }
}
