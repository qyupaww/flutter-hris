import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/bloc/history/history_bloc.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/cubit/history_filter_cubit.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/features/history/history/presentation/widgets/history_list_widget.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with MorphemeStatePage<HistoryPage, HistoryFilterCubit> {
  @override
  HistoryFilterCubit setCubit() =>
      HistoryFilterCubit(historyBloc: locator<HistoryBloc>());

  @override
  void initState() {
    super.initState();
    cubit.fetchHistory();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return BlocProvider.value(
      value: cubit.historyBloc,
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
            cubit.fetchHistory();
          },
          child: Builder(
            builder: (context) {
              final state = context.watch<HistoryBloc>().state;
              final selectedDate = context.select(
                (HistoryFilterCubit cubit) => cubit.state.selectedDate,
              );
              final selectedStatus = context.select(
                (HistoryFilterCubit cubit) => cubit.state.selectedStatus,
              );

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
                      onDateChanged: cubit.onDateChanged,
                      selectedStatus: selectedStatus,
                      onStatusChanged: cubit.onStatusChanged,
                      isLoading: isLoading,
                      errorMessage: errorMessage,
                      onRetry: cubit.fetchHistory,
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
