import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gia/bloc/market_bloc.dart';
import 'package:gia/market_data.dart';
import 'package:gia/UI/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MarketData _marketData = MarketData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Malay Agrawal',
        debugShowCheckedModeBanner: false,
        home: BlocProvider<MarketBloc>(
            create: (context) => MarketBloc(), child: MyHomePage()));
  }
}
