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
                'https://mblogthumb-phinf.pstatic.net/MjAyMjAyMDdfMjEy/MDAxNjQ0MTk0Mzk2MzY3.WAeeVCu2V3vqEz_98aWMOjK2RUKI_yHYbuZxrokf-0Ug.sV3LNWlROCJTkeS14PMu2UBl5zTkwK70aKX8B1w2oKQg.JPEG.41minit/1643900851960.jpg?type=w800'
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
