import 'package:flutter/material.dart';

class TabPages extends StatelessWidget {
  const TabPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(children: [
        Center(
          child: Text("Home"),
        ),
        Center(
          child: Text("Videos"),
        ),
        Center(
          child: Text("Videos ngắn"),
        ),
        Center(
          child: Text("Cộng đồng"),
        ),
        Center(
          child: Text("Danh sách phát"),
        ),
        Center(
          child: Text("Kênh"),
        ),
        Center(
          child: Text("Thông tin"),
        ),
      ]),
    );
  }
}
