import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math2money/cubit/calc_history.cubit.dart';
import 'package:math2money/models/calc_history.model.dart';

class CalcHistoryWidget extends StatelessWidget {
  const CalcHistoryWidget({super.key, required this.calcHistoryCubit});
  final CalcHistoryCubit calcHistoryCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalcHistoryCubit, List<CalcHistoryModel>>(
      bloc: calcHistoryCubit,
      builder: (context, state) => ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: state.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                state[index].operation,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                state[index].result,
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
