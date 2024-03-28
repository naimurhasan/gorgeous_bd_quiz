import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/qna/widgets/option_widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        children: [
          // thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            child: SizedBox(
              width: double.infinity,
              height: 190,
              child: CachedNetworkImage(
                imageUrl: "https://picsum.photos/536/354",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.padding * 2),
          // question
          Text(
            "Wie ist das aktuelle Rating der CHECK24 App?",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.padding * 2),
          // options
          const OptionWidget(
            theme: OptionTheme.neutral,
          ),
          const OptionWidget(
            theme: OptionTheme.correct,
          ),
          const OptionWidget(
            theme: OptionTheme.incorrect,
          ),
          const OptionWidget(
            theme: OptionTheme.neutral,
          ),
        ],
      ),
    );
  }
}
