import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mycrypto/model/coin_model.dart';
import 'package:mycrypto/screens/coin_details.dart';
import 'package:mycrypto/screens/coin_full_list.dart';

import 'coincard.dart';






//
//
//
// class homepage extends StatefulWidget {
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
// class _homepageState extends State<homepage> {
//   Future<List<Coin>> fetchCoin() async {
//     coinList = [];
//     final response = await http.get(Uri.parse(
//         'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> values = [];
//       values = json.decode(response.body);
//       if (values.length > 0) {
//         for (int i = 0; i < values.length; i++) {
//           if (values[i] != null) {
//             Map<String, dynamic> map = values[i];
//             coinList.add(Coin.fromJson(map));
//           }
//         }
//         setState(() {
//           coinList;
//         });
//       }
//       return coinList;
//     } else {
//       throw Exception('Failed to load coins');
//     }
//   }
//
//   @override
//   void initState() {
//     fetchCoin();
//     Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[300],
//         appBar: AppBar(
//           backgroundColor: Colors.grey[300],
//           title: Text(
//             'CRYPTOBASE',
//             style: TextStyle(
//               color: Colors.grey[900],
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: ListView.builder(
//           scrollDirection: Axis.vertical,
//           itemCount: coinList.length,
//           itemBuilder: (context, index) {
//             return CoinCard(
//               name: coinList[index].name,
//               symbol: coinList[index].symbol,
//               imageUrl: coinList[index].imageUrl,
//               price: coinList[index].price.toDouble(),
//               change: coinList[index].change.toDouble(),
//               changePercentage: coinList[index].changePercentage.toDouble(),
//             );
//           },
//         ));
//   }
// }

class homepage extends StatefulWidget
{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<dynamic> values=[];
  List<Coin> coins_list=[];
  @override
  // void initState() {
  //
  //   getData();
  //   Timer.periodic(Duration(seconds: 10), (timer)=>getData());
  //
  //   super.initState();
  // }
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
  Color color=Color(0xFF3f3e45);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF252429),

      body:


      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*1,


          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,


              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                  ),
                ),
                Center(child: Text("\$12,234.03",style: TextStyle(color: Color(0xFFfffffd),fontWeight: FontWeight.bold,fontSize: 40),)),
                SizedBox(height: 15,),
                Center(
                  child: Container(
                    height: 30,
                  width: 150,

                    decoration: BoxDecoration(
                      color: Color(0xFFccf99f),
                      borderRadius: BorderRadius.circular(18),


                    ),
                        child: Row(


                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text("+5.25%   |"),

                            ),
                            Text("+\$635.25"),


                          ],
                        ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                         child:Center(child: FaIcon(FontAwesomeIcons.arrowUp)) ,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:Center(child: FaIcon(FontAwesomeIcons.arrowDown)) ,
                      ),

                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:Center(child: FaIcon(FontAwesomeIcons.tag)) ,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:Center(child: FaIcon(FontAwesomeIcons.arrowRightArrowLeft)) ,
                      ),
                    ],
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("Send",style: TextStyle(color: Colors.white),),
                    Text("Recieve",style: TextStyle(color: Colors.white),),
                    Text("Buy",style: TextStyle(color: Colors.white),),
                    Text("Swap",style: TextStyle(color: Colors.white),),




                  ],
                ),
                
                
                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>coin_full_list()));
                }, child: Text("See All")),

          
                SingleChildScrollView(
                  child: Container(
                    




                    
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width*1,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                ),
                    
              ],
            ),
          ),
        ),
      ),
    );

  }
}