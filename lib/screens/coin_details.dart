import 'package:flutter/material.dart';

import '../model/coin_model.dart';

class coin_details extends StatefulWidget
{
  late Coin coin_object;
  coin_details(this.coin_object);
  @override
  State<coin_details> createState() => _coin_detailsState();
}

class _coin_detailsState extends State<coin_details>
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF252429),
      appBar: AppBar(
        backgroundColor: Color(0xFF252429),

      ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Placeholder(
                fallbackWidth: 200,
                fallbackHeight: 200,
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("High 24h          ",style: TextStyle(fontSize: 20,color: Color(0xFF5e5d62)),),
                  Text(""+widget.coin_object.priceChange24H.toString(),
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFfefefe)),
                  ),
                ],
              ),

              Divider(thickness: 3,
              height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("Low 24h          ",style: TextStyle(fontSize: 20,color: Color(0xFF5e5d62)),),
                  Text(""+widget.coin_object.priceChange24H.toString(),
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFfefefe)),
                  ),
                ],
              ),

              Divider(thickness: 3,
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("Market Cap          ",style: TextStyle(fontSize: 20,color: Color(0xFF5e5d62)),),
                  Text(""+widget.coin_object.priceChange24H.toString(),
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFfefefe)),
                  ),
                ],
              ),

              Divider(thickness: 3,
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text("Circulating Supply          ",style: TextStyle(fontSize: 20,color: Color(0xFF5e5d62)),),
                  Text(""+widget.coin_object.priceChange24H.toString(),
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFfefefe)),
                  ),
                ],
              ),

              Divider(thickness: 3,
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFf58965),
                      borderRadius: BorderRadius.circular(25),

                    ),
                    child: Center(child: Text("Sell",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold ),)),
                  ),

                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFcaf99c),
                      borderRadius: BorderRadius.circular(25),

                    ),
                    child: Center(child: Text("Buy",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold ),)),
                  ),
                ],
              )

            ],
          ),
        ),
      ) ,
    );
  }
}