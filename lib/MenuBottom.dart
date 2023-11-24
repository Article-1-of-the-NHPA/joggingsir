import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    /*
      onTap: ( ) {

        }
      },
      */
      selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.run_circle),
          label: 'Route',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'MyPage',
        ),
      ],
    );
  }
}
