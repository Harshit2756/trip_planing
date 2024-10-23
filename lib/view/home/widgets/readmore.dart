import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/view_model/home_view_model.dart';

import '../../../core/theme.dart';

class ReadMoreText extends StatelessWidget {
  final String text;
  final int trimLength;

  const ReadMoreText({
    required this.text,
    super.key,
    this.trimLength = 180,
  });

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    final String displayText = homeViewModel.isExpanded
        ? text
        : text.length > trimLength
            ? '${text.substring(0, trimLength)}...'
            : text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: displayText,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                homeViewModel.isExpanded
                    ? homeViewModel.toggleReadMore()
                    : null;
              },
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.iconColor,
                ),
            children: <TextSpan>[
              if (!homeViewModel.isExpanded && text.length > trimLength)
                TextSpan(
                  text: " Read More",
                  style: const TextStyle(color: Colors.black, fontSize: 19),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      homeViewModel.toggleReadMore();
                    },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
