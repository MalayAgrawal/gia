import 'package:gia/market_data.dart';

abstract class MarketListState {}

class MarketLoading extends MarketListState {}

class MarketDataFetched extends MarketListState {
  List<Data>? marDat;
  String? dealType;
  MarketDataFetched({this.marDat, this.dealType});
  List<Data>? get props => marDat;
}
