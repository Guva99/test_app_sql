import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_sql/core/internal/di/modal_bottom_sheet_di/abstract/modal_bottom_sheet_di.dart';
import 'package:test_app_sql/core/theme/app_corners.dart';
import 'package:test_app_sql/core/theme/style.dart';


@LazySingleton(as: ModalBottomSheetDi)
class ModalBottomSheetDiImpl extends ModalBottomSheetDi {
  /// DI для вызова стандартного ModalBottomSheet

  @override
  void showBottomSheet({
    required BuildContext context,
    required Widget body,
    String? title,
    double? heightScale,
    Color backgroundColor = AppColors.white,
    EdgeInsets? padding,
    bool? isDismissible,
    bool? enableDrag,
    VoidCallback? onTapBack,
    bool? isUseOwnHeaderWidget,
    double? leftHeaderPadding,
    FutureOr<void> Function()? onComplete,
  }) async =>
      showMaterialModalBottomSheet(
        isDismissible: isDismissible ?? false,
        enableDrag: enableDrag ?? false,
        useRootNavigator: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        backgroundColor: Colors.transparent,
        builder: (ctx) => _buildTextScaleBottomSheet(
          context: ctx,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppCorners.radius15,
              ),
              height: heightScale != null ? MediaQuery.of(ctx).size.height * heightScale : null,
              child: SingleChildScrollView(
                controller: ModalScrollController.of(ctx),
                child: Padding(
                    padding: padding ?? const EdgeInsets.fromLTRB(4, 8, 4, 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (isUseOwnHeaderWidget == false)
                          ..._buildSheetHeader(
                            onTapBack: onTapBack,
                            context: ctx,
                            title: title,
                            leftPadding: leftHeaderPadding,
                          ),
                        body,
                        SizedBox(height: MediaQuery.of(ctx).viewInsets.bottom),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ).whenComplete(onComplete ?? () {});

  /// Метод, возвращающий header, сверстанный под дизайн приложения в виде
  /// массива виджетов, для инъекции в [Column].
  List<Widget> _buildSheetHeader({
    required BuildContext context,
    String? title,
    double? leftPadding,
    VoidCallback? onTapBack,
    TextStyle? textStyle,
    double? marginTitleTop,
    double? marginTop,
    Widget? leading,
    Widget? appBarWidget,
  }) =>
      [
        if (appBarWidget != null) appBarWidget,
        if (appBarWidget == null)
          Container(
            alignment: Alignment.center,
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(28),
            ),
          ),
        SizedBox(
          height: marginTop ?? 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: leftPadding ?? 8,
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTapBack ?? () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_left,
                  size: 20,
                ),
              ),
            ),
            Text(
              title ?? '',
              textAlign: TextAlign.center,
            ),
            if (leading == null) ...[
              const SizedBox(width: 28),
            ] else ...[
              leading,
            ]
            // const SizedBox(width: 28),
          ],
        ),
        const SizedBox(height: 6),
      ];

  /// Функция для контроля размера шрифта в боттомщитах,
  /// при включенном "увеличении шрифта" в специальных возможностях нативно
  Widget _buildTextScaleBottomSheet({
    required Widget child,
    required BuildContext context,
  }) {
    final _data = MediaQuery.of(context);
    return MediaQuery(
      data: _data.copyWith(
        textScaleFactor: _data.textScaleFactor > 1.2 ? 1 : _data.textScaleFactor,
      ),
      child: child,
    );
  }
}
