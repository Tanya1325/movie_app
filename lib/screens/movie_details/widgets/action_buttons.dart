import 'package:flutter/material.dart';
import 'package:movie_app/utils/index.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 28.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  StringConstants.myList,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(Icons.thumb_up_alt_outlined,
                  color: Colors.white, size: 28.0),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  StringConstants.rate,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(Icons.send, color: Colors.white, size: 28.0),
              Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    StringConstants.share,
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
