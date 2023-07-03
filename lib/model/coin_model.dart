import 'package:flutter/material.dart';

class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.marketCap,
    required this.priceChange24H,
  });

  String name;
  String symbol;
  String imageUrl;
  num price;
  num change;
  num changePercentage;
  int marketCap;
  double priceChange24H;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
      marketCap:json['market_cap'],
      priceChange24H: json['price_change_24h']?.toDouble(),
    );
  }
}

List<Coin> coinList = [];