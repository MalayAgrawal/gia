import 'package:flutter/widgets.dart';

abstract class MarketListEvent {}

class MarketSelectEvent extends MarketListEvent {
  final String? value;
  MarketSelectEvent({@required this.value}) : assert(value != null);
}

class MarketFilterEvent extends MarketListEvent {
  final String? value;
  MarketFilterEvent({@required this.value}) : assert(value != null);
}

class MarektSearchEvent extends MarketListEvent {
  final String? value;
  MarektSearchEvent({@required this.value}) : assert(value != null);
}
