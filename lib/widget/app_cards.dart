import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_constant.dart';
import '../constants/app_dimen.dart';
import '../constants/assets_path.dart';
import '../utils/helper/app_helpers.dart';
import '../utils/ui/app_styles.dart';
import '../utils/ui/ui_utils.dart';

class StandardCard extends StatelessWidget {
  final String title;
  final String duration;
  final String departure;
  final String arrival;
  final String capin;
  final String price;
  final VoidCallback onCardTap;
  final bool isSelected;
  final StandardCardMode mode;
  final VoidCallback? onReadMoreTap;
  final bool readMore;

  const StandardCard({
    super.key,
    required this.title,
    required this.duration,
    required this.departure,
    required this.arrival,
    required this.capin,
    required this.price,
    required this.onCardTap,
    this.isSelected = false,
    this.readMore = false,
    this.onReadMoreTap,
    this.mode = StandardCardMode.withOutPrice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.sizeSmallCardCorner),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: AppColors.romance,
          constraints: const BoxConstraints(
            minHeight: AppDimen.sizeStandardCardHeight,
            minWidth: double.infinity,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppDimen.spacingRegular,
            horizontal: AppDimen.spacingLarge,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: departure.isNotEmpty
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style:
                            TextStyleExtension.normalSemiBoldTextStyle.copyWith(
                          color: AppColors.ebonyClay,
                        ),
                      ),
                      Text(
                        'Duration: $duration',
                        style: TextStyleExtension.medSmallRegularTextStyle
                            .copyWith(
                          color: AppColors.ebonyClay,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: AppDimen.spacingTiny,
                  ),
                  Text(
                    departure,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleExtension.smallRegularTextStyle.copyWith(
                      color: AppColors.boulder,
                    ),
                  ),
                  Text(
                    arrival,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleExtension.smallRegularTextStyle.copyWith(
                      color: AppColors.boulder,
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: AppDimen.spacingTiny,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(capin,
                            overflow: TextOverflow.ellipsis,
                          style:
                              TextStyleExtension.medSemiBoldTextStyle.copyWith(
                            color: AppColors.boulder,
                          )),
                      Text(
                        price,
                        style: TextStyleExtension.normalMedTextStyle
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  Visibility(
                      visible: false,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: AppDimen.spacingSmall),
                        child: InkWell(
                          onTap: onReadMoreTap,
                          child: Text(
                            'Read more',
                            style: TextStyleExtension.smallMedTextStyle
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      )),
                ],
              )),
              Visibility(
                  visible: isSelected,
                  child: SvgPicture.asset(Assets.nextIcon)),
            ],
          ),
        ),
      ),
    );
  }
}
