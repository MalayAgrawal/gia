import 'package:flutter/material.dart';
import 'package:gia/UI/header.dart';
import 'package:gia/UI/marketlist.dart';
import 'package:gia/api_call.dart';
import 'package:gia/market_data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getDataTest() async {
    await ApiCall().getData("Bulk_Deal");
  }

  @override
  void initState() {
    getDataTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [HeaderFilter(), MarketListUi()],
          ),
        ),
      ),
    );
  }
}
