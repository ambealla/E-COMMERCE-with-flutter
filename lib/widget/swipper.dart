import 'package:dio/dio.dart';
import 'package:flutter/material.dart';




class Swipper extends StatefulWidget {
  const Swipper({Key? key}) : super(key: key);

  @override
  _SwipperState createState() => _SwipperState();
}

class _SwipperState extends State<Swipper> {
  Future<List> getData() async {
    var response = await Dio().get(
        'https://jsonplaceholder.typicode.com/users');
    print(response.data);
    List data = response.data;

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if(snapshot.hasData){
              List? data=snapshot.data;
              return ListView.builder(

                itemCount: data?.length,
                itemBuilder: (context,index){
                  return Column(

                    children: [
                      ListTile(
                        leading: Text(data?[index]["id"].toString()??""),
                        title: Text(data?[index]["email"]),
                        subtitle: Text(data?[index]["company"]["name"]),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),

                      ),
                      SizedBox(height: 10.0,)
                    ],
                  );

                },

              );
            }else{
              return Container();
            }
          },

        ),
      ),
    );
  }
}
