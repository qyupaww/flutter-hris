import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/components/radius_info_card.dart';
import 'package:morpheme_flutter_lite/features/home/attendance/presentation/cubit/attendance_cubit.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AttendanceCubit>();

    return BlocBuilder<AttendanceCubit, AttendanceStateCubit>(
      builder: (context, state) {
        return SizedBox(
          height: ConstantSizes.s80 * 5,
          child: Stack(
            children: [
              _buildMap(context, cubit, state),
              _buildGradientOverlay(context),
              _buildMyLocationButton(context, cubit),
              _buildRadiusInfoCard(context, cubit, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMap(
    BuildContext context,
    AttendanceCubit cubit,
    AttendanceStateCubit state,
  ) {
    if (state.isLoading ||
        state.currentPosition == null ||
        state.officePosition == null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: context.color.grey.withValues(alpha: 0.2),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return FlutterMap(
      mapController: cubit.mapController,
      options: MapOptions(
        initialCenter: state.currentPosition!,
        initialZoom: 17,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
          subdomains: const ['a', 'b', 'c', 'd'],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: state.officePosition!,
              radius: state.maxRadius,
              useRadiusInMeter: true,
              color: state.isInRadius
                  ? context.color.success.withValues(alpha: 0.15)
                  : context.color.error.withValues(alpha: 0.15),
              borderColor: state.isInRadius
                  ? context.color.success
                  : context.color.error,
              borderStrokeWidth: 2,
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: state.officePosition!,
              width: ConstantSizes.s40,
              height: ConstantSizes.s40,
              child: Icon(
                Icons.business,
                color: context.color.primary,
                size: ConstantSizes.s32,
              ),
            ),
            Marker(
              point: state.currentPosition!,
              width: ConstantSizes.s44,
              height: ConstantSizes.s44,
              child: Container(
                decoration: BoxDecoration(
                  color: context.color.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.color.white,
                    width: ConstantSizes.s2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.color.primary.withValues(alpha: 0.4),
                      blurRadius: ConstantSizes.s8,
                      spreadRadius: ConstantSizes.s2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  color: context.color.white,
                  size: ConstantSizes.s20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGradientOverlay(BuildContext context) {
    return Positioned(
      bottom: -1,
      left: 0,
      right: 0,
      height: ConstantSizes.s80 * 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, context.color.background],
          ),
        ),
      ),
    );
  }

  Widget _buildMyLocationButton(BuildContext context, AttendanceCubit cubit) {
    return Positioned(
      bottom: ConstantSizes.s80 * 2,
      right: ConstantSizes.s16,
      child: InkWell(
        onTap: cubit.recenterMap,
        borderRadius: BorderRadius.circular(ConstantRadius.r12),
        child: Container(
          padding: const EdgeInsets.all(ConstantSizes.s12),
          decoration: BoxDecoration(
            color: context.color.background,
            borderRadius: BorderRadius.circular(ConstantRadius.r12),
          ),
          child: Icon(
            Icons.my_location,
            color: context.color.white,
            size: ConstantSizes.s24,
          ),
        ),
      ),
    );
  }

  Widget _buildRadiusInfoCard(
    BuildContext context,
    AttendanceCubit cubit,
    AttendanceStateCubit state,
  ) {
    return Positioned(
      bottom: ConstantSizes.s16,
      left: ConstantSizes.s16,
      right: ConstantSizes.s16,
      child: RadiusInfoCard(
        distanceInMeters: state.distanceInMeters,
        isInRadius: state.isInRadius,
        gpsAccuracy: state.gpsAccuracy,
        onRefresh: cubit.fetchCurrentLocation,
      ),
    );
  }
}
