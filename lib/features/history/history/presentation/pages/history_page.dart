import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/bloc/history/history_bloc.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/widgets/history_list_widget.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late DateTime selectedDate;
  String selectedStatus = 'all';
  late HistoryBloc _historyBloc;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _historyBloc = locator<HistoryBloc>()
      ..add(
        FetchHistory(
          HistoryBody(month: selectedDate.month, year: selectedDate.year),
        ),
      );
  }

  @override
  void dispose() {
    _historyBloc.close();
    super.dispose();
  }

  void _onDateChanged(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
    _historyBloc.add(
      FetchHistory(HistoryBody(month: newDate.month, year: newDate.year)),
    );
  }

  void _onStatusChanged(String? newStatus) {
    if (newStatus != null) {
      setState(() {
        selectedStatus = newStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _historyBloc,
      child: Scaffold(
        appBar: AppBar(
          title: AtomText.bodyLarge(
            S.of(context)?.historyTitle ?? 'Riwayat Absensi',
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _historyBloc.add(
              FetchHistory(
                HistoryBody(month: selectedDate.month, year: selectedDate.year),
              ),
            );
          },
          child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              List<DataHistory>? data;
              bool isLoading = false;
              String? errorMessage;

              if (state is HistoryLoading || state is HistoryInitial) {
                isLoading = true;
              } else if (state is HistoryFailed) {
                errorMessage = state.failure.message;
              } else if (state is HistorySuccess) {
                data = state.data.data ?? [];
              }

              return Stack(
                children: [
                  ListView(),
                  Positioned.fill(
                    child: HistoryListWidget(
                      historyData: data,
                      selectedDate: selectedDate,
                      onDateChanged: _onDateChanged,
                      selectedStatus: selectedStatus,
                      onStatusChanged: _onStatusChanged,
                      isLoading: isLoading,
                      errorMessage: errorMessage,
                      onRetry: () {
                        _historyBloc.add(
                          FetchHistory(
                            HistoryBody(
                              month: selectedDate.month,
                              year: selectedDate.year,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
