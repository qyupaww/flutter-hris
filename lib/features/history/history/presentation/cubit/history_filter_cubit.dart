import 'package:morpheme_base/morpheme_base.dart';
import 'package:equatable/equatable.dart';

import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/bloc/history/history_bloc.dart';

part 'history_filter_state.dart';

class HistoryFilterCubit extends MorphemeCubit<HistoryFilterState> {
  HistoryFilterCubit({required this.historyBloc})
    : super(
        HistoryFilterState(selectedDate: DateTime.now(), selectedStatus: 'all'),
      );

  final HistoryBloc historyBloc;

  void fetchHistory() {
    historyBloc.add(
      FetchHistory(
        HistoryBody(
          month: state.selectedDate.month,
          year: state.selectedDate.year,
        ),
      ),
    );
  }

  void onDateChanged(DateTime newDate) {
    emit(state.copyWith(selectedDate: newDate));
    fetchHistory();
  }

  void onStatusChanged(String? newStatus) {
    if (newStatus != null) {
      emit(state.copyWith(selectedStatus: newStatus));
    }
  }

  @override
  Future<void> close() {
    historyBloc.close();
    return super.close();
  }
}
