import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gia/bloc/market_bloc.dart';
import 'package:gia/bloc/market_list_event.dart';

class HeaderFilter extends StatelessWidget {
  const HeaderFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<MarketBloc>(context)
                      .add(MarketSelectEvent(value: "Bulk_Deal"));
                },
                child: Text(
                  "Bulk Deal",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<MarketBloc>(context)
                      .add(MarketSelectEvent(value: "Block_Deal"));
                },
                child: Text(
                  "Block Deal",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            filterButton(context, "ALL"),
            SizedBox(
              width: 5,
            ),
            filterButton(context, "BUY"),
            SizedBox(
              width: 5,
            ),
            filterButton(context, "SELL")
          ],
        )),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: TextField(
            onChanged: (term) {
              print(term);
              BlocProvider.of<MarketBloc>(context)
                  .add(MarektSearchEvent(value: term));
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              hintText: 'Search Client Name',
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget filterButton(context, val) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MarketBloc>(context).add(MarketFilterEvent(value: val));
      },
      child: Container(
        padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
        color: val == "ALL"
            ? Color(0xff92A2D2)
            : val == "SELL"
                ? Colors.red
                : Colors.green,
        child: Text(
          val,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
