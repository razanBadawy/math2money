import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencySelectionState {
  final String from;
  final String to;

  const CurrencySelectionState({required this.from, required this.to});

  CurrencySelectionState copyWith({String? from, String? to}) {
    return CurrencySelectionState(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}

class CurrencySelectionCubit extends Cubit<CurrencySelectionState> {
  CurrencySelectionCubit()
      : super(const CurrencySelectionState(from: 'EGP', to: 'USD'));

  void setFrom(String code) => emit(state.copyWith(from: code));

  void setTo(String code) => emit(state.copyWith(to: code));

  void swap() => emit(
        CurrencySelectionState(from: state.to, to: state.from),
      );
}
