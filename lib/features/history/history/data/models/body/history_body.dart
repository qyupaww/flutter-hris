import 'package:equatable/equatable.dart';

class HistoryBody extends Equatable {
  const HistoryBody({this.rawBody, this.month, this.year});

  final Map<String, dynamic>? rawBody;
  final int? month;
  final int? year;

  Map<String, dynamic> toMap() {
    return {
      if (rawBody?.isNotEmpty ?? false) ...rawBody ?? {},
      if (month != null) 'month': month,
      if (year != null) 'year': year,
    };
  }

  @override
  List<Object?> get props => [rawBody, month, year];
}
