import 'package:flutter/material.dart';
import 'package:nike_store/pages/cart_page.dart';
import 'package:nike_store/pages/shop_page.dart';

import '../widgets/bottom_nav_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _pageIndex = 0;

  List _pages = [
    ShopPage(),
    CartPage(),
  ];

  //Metodos
  void navigateBottomBar(int index){
    setState(() {
      _pageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTap: (value) {
          navigateBottomBar(value);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset('assets/images/nikelogonoback.png',
                color: Colors.white,
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text('About', style: TextStyle(color: Colors.white),),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.white,),
                title: Text('Logout', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_pageIndex],
    );
  }
}
