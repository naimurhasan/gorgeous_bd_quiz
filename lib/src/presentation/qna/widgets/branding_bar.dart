import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';

class BrandingBar extends StatelessWidget {
  const BrandingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          Image.asset(AppAssets.logo, width: 120.0,),
          const Spacer(),
          const SizedBox(width: AppSizes.padding*2),
        ],
      ),
    );
  }
}
