import 'package:flutter/material.dart';
import 'package:hama_app1/bloc/quantit%C3%A9bloc/quantit%C3%A9bloc.dart';
import 'package:hama_app1/globale_parametrs/Rtconfig.dart';
import 'package:hama_app1/globale_parametrs/config.dart';
import 'package:hama_app1/widget/theme.dart';
import 'package:hama_app1/widget/whishlist.dart';

AppBar buildAppBar(BuildContext context) {
  ThemeData theeme = Themeee.get();
  return AppBar(

    automaticallyImplyLeading: false,
    actions: [
      SizedBox(
        width: 5,
      ),
      Stack(
        alignment: Alignment.topLeft,
        children: [
  IconButton(onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist()));
  }, icon: Icon(Icons.favorite)),
          FutureBuilder(
              future: getParams(Config.theme),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var json = RtConfig.prefs["Product"];

                  Map Product = json;
                  int number=0;
                  for (int i = 0; i < Product.length; i++) {
                    if (Product[i.toString()]["wishlist"]) {
                      number++;
                    }
                  }
                  return Positioned(
                      top: 10,
                      left: 5,
                      child: Container(color: Colors.redAccent, child: Text(number.toString())));
                }else{ return Container(color: Colors.red,);}}),

        ],
      )
    ],
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    ),
    elevation: 10.0,
    shadowColor: theeme.primaryColor,
    title: Container(
      padding: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintText: "recherche des produit ",
            hintStyle: TextStyle(color: Colors.black54, fontSize: 13),
            contentPadding: EdgeInsets.symmetric(vertical: 10)),
      ),
    ),
  );
}
