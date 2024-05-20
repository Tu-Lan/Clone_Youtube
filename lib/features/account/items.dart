import 'package:flutter/material.dart';

import '../../cores/widgets/image_item.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 35,
            child: ImageItem(
              imageName: "your-channel.png",
              itemClicked: () {},
              itemText: "Kênh của bạn",
              haveColor: false,
            ),
          ),
          const SizedBox(height: 6.5),
          SizedBox(
            height: 34,
            child: ImageItem(
              imageName: "your-channel.png",
              itemClicked: () {},
              itemText: "Chế độ ẩn danh",
              haveColor: false,
            ),
          ),
          const SizedBox(height: 6.5),
          SizedBox(
            height: 34,
            child: ImageItem(
              imageName: "add-account.png",
              itemClicked: () {},
              itemText: "Thêm tài khoản",
              haveColor: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: Divider(
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 35,
            child: ImageItem(
              imageName: "purchases.png",
              itemClicked: () {},
              itemText: "Giao dịch mua và gói thành viên",
              haveColor: false,
            ),
          ),
          const SizedBox(height: 7),
          SizedBox(
            height: 31,
            child: ImageItem(
              imageName: "time-watched.png",
              itemClicked: () {},
              itemText: "Thời gian đã xem",
              haveColor: false,
            ),
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 31,
            child: ImageItem(
              imageName: "your-data.png",
              itemClicked: () {},
              itemText: "Dữ liệu của bạn trên ứng dụng",
              haveColor: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: Divider(
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 33,
            child: ImageItem(
              imageName: "settings.png",
              itemClicked: () {},
              itemText: "Cài đặt",
              haveColor: false,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 35,
            child: ImageItem(
              imageName: "help.png",
              itemClicked: () {},
              itemText: "Trợ giúp và phản hồi",
              haveColor: false,
            ),
          ),
        ],
      ),
    );
  }
}
