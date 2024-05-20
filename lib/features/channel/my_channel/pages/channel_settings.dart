import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_video/cores/screens/error_page.dart';
import 'package:watch_video/features/auth/provider/user_provider.dart';
import 'package:watch_video/features/channel/my_channel/widgets/edit_setting-dialog.dart';
import 'package:watch_video/features/channel/my_channel/widgets/setting_field_item.dart';

import '../../../../cores/screens/loader.dart';
import '../repository/edit_field.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
        data: (currentUser) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 170,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/flutter background.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            left: 180,
                            top: 60,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Positioned(
                            left: 180,
                            top: 60,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              backgroundImage: CachedNetworkImageProvider(
                                  currentUser.profilePic),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 10,
                            child: Image.asset(
                              "assets/icons/camera.png",
                              height: 34,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      //second part
                      const SizedBox(height: 14),
                      SettingsItem(
                        identifier: "Tên",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Tên mới của kênh",
                              onSave: (name) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editDisplayName(name);
                              },
                            ),
                          );
                        },
                        value: currentUser.displayName,
                      ),
                      const SizedBox(height: 14),
                      SettingsItem(
                        identifier: "Username",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Username mới",
                              onSave: (username) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editusername(username);
                              },
                            ),
                          );
                        },
                        value: currentUser.username,
                      ),
                      const SizedBox(height: 14),
                      SettingsItem(
                        identifier: "Mô tả",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Nhập mô tả",
                              onSave: (description) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editDescription(description);
                              },
                            ),
                          );
                        },
                        value: currentUser.description,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Hiện thị chế độ riêng tư"),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                isSwitched = value;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text(
                          "Các thay đổi tên và ảnh hồ sơ chỉ được hiện thị trên đây. Sẽ không thay đổi trên các dịch vụ khác của Google",
                          style: TextStyle(color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        error: (error, stackTrace) => const ErrorPage(),
        loading: () => const Loader());
  }
}
