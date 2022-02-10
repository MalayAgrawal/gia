import 'dart:convert';

import 'package:gia/market_data.dart';
import 'package:http/http.dart' as http;

MarketData globalData = MarketData();

class ApiCall {
  Future getData(String id) async {
    var reponse = await http.get(Uri.parse(
        "https://www.goindiastocks.com/api/service/GetBulkBlockDeal?fincode=100114&DealType=$id"));
    final responseData = jsonDecode(reponse.body);
    var filter = MarketData.fromJson(responseData);
    int? num = filter.data?[0].clientName.toString().lastIndexOf(" ");
    return filterData(filter);
  }

  //Raw Data Fix
  MarketData filterData(MarketData filter) {
    for (int i = 0; i < filter.data!.length; i++) {
      //Name Fix
      try {
        String? er = filter.data?[i].clientName.toString();
        int? num = er!.lastIndexOf(" ");
        er = er.toString().substring(0, num);
        num = er.toString().lastIndexOf(" ");
        er = er.toString().substring(0, num);
        filter.data?[i].clientName = er;
      } catch (e) {}
      //Date Fix
      String? date = filter.data?[i].dealDate;
      filter.data?[i].dealDate = date!.substring(8, 10) +
          " " +
          monthsInYear[date.substring(5, 7)]! +
          " " +
          date.substring(0, 4);
    }
    return filter;
  }
}

const Map<String, String> monthsInYear = {
  "01": "Jan",
  "02": "Feb",
  "03": "Mar",
  "04": "Apr",
  "05": "May",
  "06": "Jun",
  "07": "Jul",
  "08": "Aug",
  "09": "Sep",
  "10": "Oct",
  "11": "Nov",
  "12": "Dec",
};
