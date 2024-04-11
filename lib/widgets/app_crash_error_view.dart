import 'package:flutter/material.dart';
import 'package:taro_leaf_blight/core/utils/constants/strings.dart';
import 'package:taro_leaf_blight/packages/textstyles/app_textstyles.dart';


class AppCrashErrorView extends StatelessWidget {
  const AppCrashErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 40),
            // const Align(alignment: Alignment.centerLeft, child: AppIcon()),
            const Align(alignment: Alignment.centerLeft, child: Icon(Icons.error)),
            const SizedBox(height: 38),
            Text(
              AppStrings.crashViewTitleMessage,
              style: textTheme.displaySmall!.copyWith(
                height: 1.08,
                color: theme.colorScheme.onBackground,
              ).w500,
            ),
            const SizedBox(height: 35),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: AppStrings.crashViewQuoteMessage,
                    style: textTheme.headlineSmall!.copyWith(height: 1.5),
                  ),
                  TextSpan(text: '  —  ', style: textTheme.titleMedium),
                  TextSpan(
                    text: AppStrings.crashViewQuoteAuthor,
                    style: textTheme.titleMedium!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.crashViewBugMessage1,
              style: textTheme.titleMedium!.copyWith(height: 1.45),
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.crashViewBugMessage2,
              style: textTheme.titleMedium!.copyWith(height: 1.45),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


extension BuildContextThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}
