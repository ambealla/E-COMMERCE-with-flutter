import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama_app1/bloc/quantit%C3%A9bloc/quantit%C3%A9bloc.dart';
import 'package:hama_app1/widget/Productcard.dart';
import 'package:hama_app1/widget/theme.dart';

import '../bloc/test/counter_bloc.dart';
import '../bloc/test/counter_state.dart';
import '../data.dart';
import '../globale_parametrs/Rtconfig.dart';
import '../globale_parametrs/config.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Counter_Bloc bloc; late Quantitebloc bloc2;

  Future<List> getData() async {
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/users');
    print(response.data);
    List data = response.data;

    return data;
  }

  ThemeData theeme = Themeee.get();
  int checkedItem = 0;
  final List<List<String>> Categories = StubData().Categories;

  getParams(String jsoon) async {
    Map<String, dynamic> params = {};
    String _params = await rootBundle.loadString(jsoon);
    params = await json.decode(_params);
    RtConfig.prefs = params;
    print("parametrs from json done");
    return params;
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<Counter_Bloc>(context);
    bloc2 = BlocProvider.of<Quantitebloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();bloc2.close();
  }
    Color fav_color=Colors.white;
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffedf2f1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Swiper(
                    autoplay: true,
                    duration: 1000,
                    itemHeight: 30,
                    itemWidth: MediaQuery.of(context).size.width,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            imageList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                    pagination: SwiperPagination(),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: MediaQuery.of(context).size.height * 0.135,
                  decoration: BoxDecoration(
                    color: theeme.highlightColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                  ),
                  child: ListView.builder(
                    itemCount: Categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            checkedItem = index;
                            String collection = Categories[checkedItem][0];
                            switch (collection) {
                              case "sport":
                                bloc.add(IncreamentEvent.sport);
                                break;
                              case "vetement":
                                bloc.add(IncreamentEvent.vetement);
                                break;
                              case "beaute":
                                bloc.add(IncreamentEvent.Beaute);
                                break;
                              case "All":
                                bloc.add(IncreamentEvent.all);
                                break;
                              case "electronique":
                                bloc.add(IncreamentEvent.electronique);
                                break;
                              case "game":
                                bloc.add(IncreamentEvent.game);
                                break;
                            }

                            dev.log("setstate called");
                          });
                        },
                        child: AnimatedContainer(
                          curve: Curves.linear,
                          duration: Duration(milliseconds: 400),
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width * 0.3,
                          margin: EdgeInsets.only(
                              left: index == 0 ? 6 : 5,
                              right: 5,
                              top: 3,
                              bottom: 3),
                          decoration: BoxDecoration(
                            color: index == checkedItem
                                ? Colors.white70
                                : Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            border: index == checkedItem
                                ? Border.all(
                                    color: Colors.blue,
                                    width: 1,
                                  )
                                : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 5,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Categories[index][1],
                                    fit: BoxFit.cover,
                                    height:
                                        MediaQuery.of(context).size.height * 0.08,
                                  ),
                                ),
                                Container(
                                  height: 6,
                                ),
                                Text(
                                  Categories[index][0],
                                  style: TextStyle(
                                      fontFamily:
                                          index == checkedItem ? "Hamlet" : "OpenSans-italic",
                                      fontSize: index == checkedItem
                                          ? MediaQuery.of(context).size.height *
                                              0.018
                                          : 14,
                                      color: index == checkedItem
                                          ? Colors.blue
                                          : theeme.accentColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 10,
            ),
            BlocBuilder<Counter_Bloc, CounterState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return ProductCard(collection: "all",context: context,);
                } else if (state is vetement) {
                  return ProductCard(collection:"vetement",context: context,);
                } else if (state is Beaute) {
                  return ProductCard(collection:"Beaute",context: context,);
                } else if (state is all) {
                  return ProductCard(collection:"all",context: context,);
                } else if (state is sport) {
                  return ProductCard(collection:"sport",context: context,);
                } else if (state is game) {
                  return ProductCard(collection:"game",context: context,);
                } else if (state is electronique) {
                  return ProductCard(collection:"electronique",context: context,);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

 
}
