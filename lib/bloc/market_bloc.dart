import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gia/api_call.dart';
import 'package:gia/bloc/market_list_event.dart';
import 'package:gia/bloc/market_list_state.dart';
import 'package:gia/market_data.dart';

class MarketBloc extends Bloc<MarketListEvent, MarketListState> {
  MarketBloc() : super(MarketLoading()) {
    on<MarketSelectEvent>((event, emit) async {
      emit(MarketLoading());
      final data = await ApiCall().getData(event.value!);
      globalData = data;
      emit(MarketDataFetched(marDat: globalData.data, dealType: event.value));
    });

    on<MarketFilterEvent>((event, emit) {
      List<Data> passedData = [];
      for (int i = 0; i < globalData.data!.length; i++) {
        if (globalData.data![i].dealType == event.value) {
          passedData.add(globalData.data![i]);
        }
        if (event.value == "ALL") {
          passedData = globalData.data!;
        }
      }
      emit(MarketDataFetched(marDat: passedData));
    });
    on<MarektSearchEvent>(((event, emit) {
      List<Data> passedData = [];
      for (int i = 0; i < globalData.data!.length; i++) {
        if (globalData.data![i].clientName!
            .toLowerCase()
            .contains(event.value!.toLowerCase())) {
          passedData.add(globalData.data![i]);
        }
        if (event.value == "ALL") {
          passedData = globalData.data!;
        }
      }
      emit(MarketDataFetched(marDat: passedData));
    }));
  }
}
