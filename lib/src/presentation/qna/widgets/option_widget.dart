import 'package:flutter/material.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';


enum OptionTheme { correct, incorrect, neutral }

class OptionWidget extends StatelessWidget {
  final OptionTheme theme;
  const OptionWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.padding * 2),
      margin: const EdgeInsets.only(bottom: AppSizes.padding),
      decoration: BoxDecoration(
        color: getOptionBgColor(theme),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius / 2),
        border: Border.all(
          color: getSurfaceColor(theme),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Option 1",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          Icon(
            theme == OptionTheme.correct
                ? Icons.check_circle
                : theme == OptionTheme.incorrect
                    ? Icons.cancel
                    : Icons.circle,
            color: getSurfaceColor(theme),
          ),
        ],
      ),
    );
  }

  Color getOptionBgColor(OptionTheme theme) {
    switch (theme) {
      case OptionTheme.correct:
        return const Color(0xFFE6F6EA);
      case OptionTheme.incorrect:
        return const Color(0xFFF6E6E6);
      case OptionTheme.neutral:
        return const Color(0xFFE9E9EB);
    }
  }

  Color getSurfaceColor(OptionTheme theme) {
    switch (theme) {
      case OptionTheme.correct:
        return const Color(0xFF0fbe37);
      case OptionTheme.incorrect:
        return const Color(0xFFBE0F0F);
      case OptionTheme.neutral:
        return const Color(0xFFE9E9EB);
    }
  }
}