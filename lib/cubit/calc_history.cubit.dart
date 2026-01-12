import 'package:math2money/models/calc_history.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcHistoryCubit extends Cubit<List<CalcHistoryModel>> {
  CalcHistoryCubit(): super([]);


  void addToHistory(CalcHistoryModel entry) {
    final updatedHistory = List<CalcHistoryModel>.from(state);
    updatedHistory.insert(0, entry);
    emit(updatedHistory);
  }

  void clearHistory() {
    emit([]);
  }
}