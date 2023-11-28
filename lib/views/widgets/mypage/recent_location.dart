import 'package:flutter/material.dart';

class RecentLocation extends StatelessWidget {
  const RecentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 357,
      child: Column(
        children: [
          Title(),
          SizedBox(height: 12),
          Location(),
          Divider()
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('최근 방문한 장소는 어땠나요?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Icon(
          Icons.cancel_outlined, // Use Icons.edit for a pencil icon
          size: 30,
          color: Color(0xff989491),
        ),
      ],
    );
  }
}

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 91,
            height: 88,
            child: Image.network(
              'data:image/jpeg;base64,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', // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('마포대교'),
            Text('총 5879 걸음', style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xff989491))),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Icon(Icons.star_half, color: Colors.yellow, size: 20),
                SizedBox(width: 8),
                Text('4.5(999+)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 21),
      width: double.infinity,
      height: 1,
      color: Colors.grey, // You can set the color of the border
    );
  }
}
