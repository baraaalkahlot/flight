/*
import 'package:flight/modules/home/bloc/home_bloc.dart';
import 'package:flight/modules/home/search/search_flight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimen.dart';
import '../../constants/assets_path.dart';
import '../../widget/app_cards.dart';
import '../helper/app_helpers.dart';
import 'app_styles.dart';
import 'ui_utils.dart';

abstract class AppBottomSheet {
  AppBottomSheet._();

  static void searchFlightBottomSheet(
      {required BuildContext context,
      required TextEditingController adultTextController,
      required VoidCallback onSearchClick}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimen.sizeBottomSheetCorner),
          bottom: Radius.zero,
        ),
      ),
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: AppDimen.sizeBottomSheetFilterHeight,
      ),
      builder: (context) {
        return BlocConsumer<SearchFlightBloc, SearchFlightState>(
          listener: (context, state) {
            if (state.status.isSubmissionSuccess) {
              print('clicked');
              onSearchClick;
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimen.spacingHuge,
                horizontal: AppDimen.spacingLarge,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildAdultInput(adultTextController),
                  const SizedBox(
                    height: AppDimen.spacingNormal,
                  ),
                  OutlineButton(
                    context,
                    label: 'Search',
                    onPressed:() {
                            context
                                .read<SearchFlightBloc>()
                                .add(SearchSubmitted());
                          },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

}
*/
