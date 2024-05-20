import 'package:flutter/material.dart';

import '../../../../cores/colors.dart';
import '../../../../cores/widgets/image_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              height: 41,
              decoration: const BoxDecoration(
                color: softBlueGreyBackGround,
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Quản lý video",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Flexible(
            child: ImageButton(
              onPressed: () {},
              image: "pen.png",
              haveColor: true,
            ),
          ),
          Flexible(
            child: ImageButton(
              onPressed: () {},
              image: "time-watched.png",
              haveColor: true,
            ),
          ),
        ],
      ),
    );
  }
}
