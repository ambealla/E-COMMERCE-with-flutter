import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hama_app1/globale_parametrs/Rtconfig.dart';
import 'package:hama_app1/globale_parametrs/config.dart';
import 'package:hama_app1/widget/appbar.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int quntite = 0;
    return Expanded(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.72,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [

                    FutureBuilder(
                        future: getParams(Config.theme),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            var json = RtConfig.prefs["Product"];

                            Map Product = json;
                            late List whisl = [];
                            for (int i = 0; i < Product.length; i++) {
                              if (Product[i.toString()]["wishlist"]) {
                                whisl.add(Product[i.toString()]);
                              }
                            }
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: whisl.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 8,
                                      ),
                                      Container(

                                        margin: EdgeInsets.only(left: 5, right: 5),
                                        height:
                                        MediaQuery.of(context).size.height * 0.18,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xff8a9490),
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5
                                              )
                                            ],
                                            color: Color(0xfff2f5f4),
                                            border: Border.all(
                                                color: Colors.white38, width: 2),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10))),
                                        child: Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                child: Image.network(
                                                  whisl[index]["url"],
                                                  fit: BoxFit.cover,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.4,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.4,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:
                                                2.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.42,
                                                      child: Text(
                                                        whisl[index]["name"],

                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.blue,
                                                            fontFamily: "Hamlet"),

                                                      ),
                                                    ),

                                                    Text(
                                                      whisl[index]["price"],
                                                      style: TextStyle(
                                                        color: Colors.redAccent,
                                                        fontFamily: "Hamlet",
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.42,
                                                      child: StatefulBuilder(
                                                          builder: (context, wsetState) {
                                                            return Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
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
                                                                            BorderRadius
                                                                                .all(Radius
                                                                                .circular(
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
                                                                            BorderRadius
                                                                                .all(Radius
                                                                                .circular(
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
                                                          }),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius: BorderRadius.only(
                                                              bottomLeft:
                                                              Radius.circular(10),
                                                              bottomRight:
                                                              Radius.circular(10))),
                                                      height: 25,
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width *
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
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  bottom:
                                                  MediaQuery.of(context).size.height *
                                                      0.1,
                                                ),
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Color(0xff394541),
                                                          blurRadius: 0.5,
                                                          spreadRadius: 0.5
                                                      )
                                                    ],
                                                    color: Color(0xffebf2ed),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10))),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    whisl[index]["description"] = false;
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            return Container(
                              color: Colors.red,
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height*0.05,
            child: FlatButton(onPressed: () {  }, child:Text(""
                "chekout"),

            ),
          )
        ],
      ),
    );
  }
}
