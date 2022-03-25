import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama_app1/bloc/quantit%C3%A9bloc/quantit%C3%A9bloc.dart';
import 'package:hama_app1/globale_parametrs/Rtconfig.dart';
import 'package:hama_app1/globale_parametrs/config.dart';

class ProductCard extends StatefulWidget {
  final String collection;
  final BuildContext context;

  const ProductCard({Key? key, required this.collection, required this.context})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Quantitebloc bloc2;

  getParams(String jsoon) async {
    Map<String, dynamic> params = {};
    String _params = await rootBundle.loadString(jsoon);
    params = await json.decode(_params);
    RtConfig.prefs = params;
    print("parametrs from json done");
    return params;
  }

  int quntite = 0;
  Color fav_color = Colors.white;

  @override
  void initState() {
    super.initState();

    bloc2 = BlocProvider.of<Quantitebloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    bloc2.close();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getParams(Config.theme),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var json = RtConfig.prefs["Product"];

          Map Product = json;
          late List type1 = [];
          for (int i = 0; i < Product.length; i++) {
            if (widget.collection == "all") {
              type1.add(Product[i.toString()]);
            } else if (Product[i.toString()]["collection"] ==
                widget.collection) {
              type1.add(Product[i.toString()]);
            }
          }

          int lenght_of_type = type1.length;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                GridView.count(
                  childAspectRatio: 0.7,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  children: List.generate(lenght_of_type, (index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5.0, left: 5, right: 5),
                      child: InkWell(
                        focusColor: Colors.red,
                        hoverColor: Colors.red,
                        onTap: () {
                          print("");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.5,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(19)),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 5,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10.0)),
                                      child: Hero(
                                        tag: 2,
                                        child: Image.network(
                                          type1[index]["url"],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                type1[index]["name"],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Hamlet",
                                                    color: Colors.blue),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                type1[index]["price"],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: "Hamlet",
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container()
                                    ],
                                  ),
                                  StatefulBuilder(
                                    builder: (BuildContext context, wsetState) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              wsetState(() {
                                                quntite--;
                                              });
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  6))),
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            quntite.toString(),
                                            style: TextStyle(),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              wsetState(() {
                                                quntite++;
                                              });
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  6))),
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    height: 25,
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    child: Center(
                                        child: Text(
                                      "add to cart",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Hamlet"),
                                    )),
                                  )
                                ],
                              ),
                              Positioned(
                                top: 6,
                                right: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: fromHex("#edebeb"),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff999291),
                                          blurRadius: 0.5,
                                          spreadRadius: 0.5
                                      )
                                    ],),
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            type1[index]["wishlist"] =
                                                (!type1[index]["wishlist"]);
                                          });
                                        },
                                        child: Builder(builder: (context) {
                                          return Icon(
                                            Icons.favorite_sharp,
                                            size: 30,
                                            color: (type1[index]["wishlist"])
                                                ? Colors.red
                                                : Colors.white,
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                  height: 10,
                )
              ],
            ),
          );
        } else {
          return Container(
            color: Colors.red,
          );
        }
        return Container();
      },
    );
  }
}
