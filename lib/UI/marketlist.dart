import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gia/bloc/market_bloc.dart';
import 'package:gia/bloc/market_list_state.dart';

import '../bloc/market_list_event.dart';
import '../market_data.dart';

class MarketListUi extends StatefulWidget {
  @override
  State<MarketListUi> createState() => _MarketListUiState();
}

class _MarketListUiState extends State<MarketListUi> {
  @override
  void initState() {
    BlocProvider.of<MarketBloc>(context)
        .add(MarketSelectEvent(value: "Bulk_Deal"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketBloc, MarketListState>(builder: (context, state) {
      if (state is MarketLoading)
        return Center(
          child: Center(child: Text("Loading")),
        );
      if (state is MarketDataFetched) {
        var displayData = state.marDat;
        return buildMarketList(displayData!);
      }
      return Center(child: Text("Error"));
    });
  }

  Widget buildMarketList(List<Data> li) {
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: li.length,
            itemBuilder: ((context, index) => Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  height: 180,
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  child: Row(
                    children: [
                      Container(
                        width: 7,
                        color: li[index].dealType == "BUY"
                            ? Colors.green
                            : Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 240,
                                child: Text(
                                  li[index].clientName.toString(),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  li[index].dealDate.toString(),
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              li[index].dealType == "BUY"
                                  ? Text(
                                      "Bought  ",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  : Text("Sold  ",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                              Text(li[index].quantity.toString() + " shares",
                                  style: TextStyle(
                                      color: li[index].dealType == "BUY"
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text(" @ Rs " + li[index].tradePrice.toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                          Spacer(),
                          Text("Value  Rs  " + li[index].value.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 31, 111, 177),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
