import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hama_app1/bottombar_class/cart.dart';
import 'package:hama_app1/widget/appbar.dart';
import 'package:hama_app1/widget/drawer.dart';
import 'package:hama_app1/widget/theme.dart';

import 'bottombar_class/home.dart';
import 'bottombar_class/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    _controller = TabController(
        initialIndex: 0,
        length: (user!.email.toString() == "benallaamin22@gmail.com")
            ? tabBarScreens0.length
            : tabBarScreens1.length,
        vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Widget> tabBarScreens0 = [
    Home(),
    Cart(),
    Container(color: Colors.black38),
    Container(),
    Profile(),
  ];

  final List<Widget> tabBarScreens1 = [
    Home(),
    Cart(),
    Container(color: Colors.black38),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Themeee.get();
    return Scaffold(
        appBar: buildAppBar(context),
        drawer: draw(),
        backgroundColor: themeData.scaffoldBackgroundColor,
        body: TabBarView(
          controller: _controller,
          children: (user!.email.toString() == "benallaamin22@gmail.com")
              ? tabBarScreens0
              : tabBarScreens1,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: Stack(
            children: [
              AnimatedContainer(
                curve: Curves.linear,
                duration: Duration(milliseconds: 200),
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: (user!.email.toString() == "benallaamin22@gmail.com")
                        ? _controller.index.toDouble() *
                            MediaQuery.of(context).size.width /
                            5
                        : _controller.index.toDouble() *
                            MediaQuery.of(context).size.width /
                            4),
                child: Builder(builder: (context) {
                  return Container(
                    margin:
                        EdgeInsets.only(top: 3, bottom: 2, left: 4 ,right: 7),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: (user!.email.toString() == "benallaamin22@gmail.com")? MediaQuery.of(context).size.width /5:MediaQuery.of(context).size.width /4.2,
                  );
                }),
              ),
              TabBar(
                controller: _controller,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
                isScrollable: false,
                tabs: (user!.email.toString() == "benallaamin22@gmail.com")
                    ? [
                        _buildTabIcon(
                          "home",
                          Icons.home,
                          0,
                          themeData,
                        ),
                        _buildTabIcon(
                            "cart", Icons.shopping_cart, 1, themeData),
                        _buildTabIcon(
                          "message",
                          Icons.message_rounded,
                          2,
                          themeData,
                        ),
                        _buildTabIcon("product",
                            Icons.add_shopping_cart_outlined, 3, themeData),
                        _buildTabIcon("person", Icons.person, 4, themeData),
                      ]
                    : [
                        _buildTabIcon(
                          "home",
                          Icons.home,
                          0,
                          themeData,
                        ),
                        _buildTabIcon(
                            "cart", Icons.shopping_cart, 1, themeData),
                        _buildTabIcon(
                          "message",
                          Icons.message_rounded,
                          2,
                          themeData,
                        ),
                        _buildTabIcon("person", Icons.person, 3, themeData),
                      ],
                onTap: (index) {
                  setState(() {
                    print("helb");
                  });
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildTabIcon(
    String name,
    IconData assetName,
    int index,
    ThemeData themeData,
  ) {
    return Column(
      children: [
        Container(
          height: 5,
        ),
        Icon(
          assetName,
          size: 25,
          color: index == _controller.index ? Colors.white : Colors.black,
        ),
        Text(
          name,
          style: TextStyle(

            fontSize: (user!.email.toString() == "benallaamin22@gmail.com")?10:14,
            color: index == _controller.index ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}
