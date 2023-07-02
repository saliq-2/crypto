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
      appBar: AppBar(

      ),
      body:Center(child: Text(widget.coin_object.name),) ,
    );
  }
}