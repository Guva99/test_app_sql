import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app_sql/core/theme/style.dart';

abstract class ModalBottomSheetDi {


  /// Метод вызова стандартного ModalBottomSheet
  void showBottomSheet({
    required BuildContext context,
    required Widget body,
    String? title,
    double? heightScale,
    Color backgroundColor = AppColors.black36,
    EdgeInsets? padding,
    bool? isDismissible,
    bool? enableDrag,
    VoidCallback? onTapBack,
    bool? isUseOwnHeaderWidget,
    double? leftHeaderPadding,
    FutureOr<void> Function()? onComplete,
  });

}
