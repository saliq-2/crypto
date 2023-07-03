import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycrypto/screens/coin_details.dart';
import '../model/coin_model.dart';

class coin_full_list extends StatefulWidget
{
  @override
  State<coin_full_list> createState() => _coin_full_listState();
}

class _coin_full_listState extends State<coin_full_list> {
  List<dynamic> values=[];

  List<Coin> coins_list=[];

  @override
  void initState() {

    getData();
    Timer.periodic(Duration(seconds: 20), (timer)=>getData());

    super.initState();
  }

  void getData() async {
    coins_list=[];
    //print("called");

    final response=await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"));
    print(response.statusCode);
    //print(response.isRedirect);
    if(response.statusCode==200)
    {
      values=json.decode(response.body);
      for(int x=0;x<values.length;x++)
      {
        print(values[x]);
        Map<String,dynamic> map=values[x];
        print(Coin.fromJson(map).name);
        coins_list.add(Coin.fromJson(map));
        //print(coins_list[x]);

      }

      setState((){

        coins_list;

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF252429),
      ),
      backgroundColor: Color(0xFF26262a),
      body: Container(
        child: ListView.builder(

            itemCount: coins_list.length,
            itemBuilder: (context,index)=>

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>coin_details(coins_list[index])));
            },
            child: Container(

              width: MediaQuery.of(context).size.width*1,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF3f3e45),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(coins_list[index].imageUrl,width: 50,height: 50,),
                  ),
                  Text(coins_list[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(width: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(coins_list[index].price.toDouble().toString()),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(coins_list[index].priceChange24H.toStringAsFixed(4)),
                      ),

                    ],
                  ),




                ],
              ),
            ),
          ),
        )


        ),
      ),
    );
  }
}