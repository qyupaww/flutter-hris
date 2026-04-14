part of 'history_filter_cubit.dart';

class HistoryFilterState extends Equatable {
  const HistoryFilterState({
    required this.selectedDate,
    required this.selectedStatus,
  });

  final DateTime selectedDate;
  final String selectedStatus;

  HistoryFilterState copyWith({
    DateTime? selectedDate,
    String? selectedStatus,
  }) {
    return HistoryFilterState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStatus: selectedStatus ?? this.selectedStatus,
    );
  }

  @override
  List<Object> get props => [selectedDate, selectedStatus];
}
