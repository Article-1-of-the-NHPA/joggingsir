import 'package:flutter/material.dart';

class RunningRecord extends StatelessWidget {
  const RunningRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357,
      child: Column(
        children: [
          Title(),
          SizedBox(height: 12),
          Container(
            height: 150, // Set a specific height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3, // Set the number of items
              itemBuilder: (context, index) {
                return RecordItem();
              },
            ),
          ),
        ],
      )
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '내 런닝 기록',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class RecordItem extends StatelessWidget {
  const RecordItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/recordItem.png", fit: BoxFit.cover),
    );
  }
}
