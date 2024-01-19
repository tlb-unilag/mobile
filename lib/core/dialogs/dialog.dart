/// The above class provides methods to show loading dialogs and snackbars with different types of
/// messages in a Flutter app.

import 'package:taro_leaf_blight/packages/packages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showLoadingDialog() {
    showDialog(
      context: NavigationService.navigatorKey.currentState!.context,
      barrierDismissible: kDebugMode,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void showErrorSnackbar({
    required String message,
  }) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showSnackbar({
    required String message,
  }) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        content: Text(message),
        // backgroundColor: Colors.red,
      ),
    );
  }

  static void showSuccessSnackbar({
    required String message,
  }) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  static Future<bool> confirmDialog({
    String? title,
    String? subtitle,
    String yesText = 'Confirm',
    String noText = 'Cancel',
  }) async {
    final t = await openBottomSheet(
      children: [
        34.gap,
        if (title != null)
          Text(
            title,
            style: CustomTextStyle.labelLBold,
          ),
        8.gap,
        if (subtitle != null)
          Text(
            subtitle,
            style: CustomTextStyle.paragraphMedium,
          ),
        34.gap,
        AppButton(
          onPressed: () {
            pop(true);
          },
          label: yesText,
        ),
        8.gap,
        AppButton.outline(
          onPressed: () {
            pop(false);
          },
          label: noText,
        ),
      ],
    );

    if (t.runtimeType != bool) return false;
    return t;
  }

  static Future openCloseBottomSheet({
    String? title,
    List<Widget>? children,
    Widget? child,
  }) {
    return showModalBottomSheet(
      context: NavigationService.navigatorKey.currentState!.context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title ?? '',
                            style: CustomTextStyle.labelLBold,
                          ),
                        ),
                        const Icon(
                          Icons.close,
                          color: AppColors.greyQuatinary,
                        ),
                      ],
                    ),
                    if (children != null) ...children,
                    if (child != null) child,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future openBottomSheet({
    bool showBar = true,
    List<Widget>? children,
    Widget? child,
  }) {
    return showModalBottomSheet(
      context: NavigationService.navigatorKey.currentState!.context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(),
                    if (showBar)
                      Container(
                        width: 80,
                        height: 4,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE2E2E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ).alignCenter,
                    if (children != null) ...children,
                    if (child != null) child,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
