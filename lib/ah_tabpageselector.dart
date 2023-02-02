import 'package:flutter/material.dart';

/// Uses [CustomTabPageSelectorIndicator] to display a row of small circular
/// indicators, one per tab.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=Q628ue9Cq7U}
///
/// The selected tab's indicator is highlighted. Often used in conjunction with
/// a [TabBarView].
///
/// If a [TabController] is not provided, then there must be a
/// [DefaultTabController] ancestor.
class CustomTabPageSelector extends StatelessWidget {
  /// Creates a compact widget that indicates which tab has been selected.
  const CustomTabPageSelector(
      {super.key,
      this.controller,
      this.indicatorSize = 12.0,
      this.color,
      this.selectedColor,
      this.borderStyle,
      this.borderWidth})
      : assert(indicatorSize != null && indicatorSize > 0.0);

  /// This widget's selection.
  ///
  /// If [TabController] is not provided, then the value of
  /// [DefaultTabController.of] will be used.
  final TabController? controller;

  /// The indicator circle's diameter (the default value is 12.0).
  final double indicatorSize;

  /// The indicator circle's fill color for unselected pages.
  ///
  /// If this parameter is null, then the indicator is filled with [Colors.transparent].
  final Color? color;

  /// The indicator circle's fill color for selected pages and border color
  /// for all indicator circles.
  ///
  /// If this parameter is null, then the indicator is filled with the theme's
  /// [ColorScheme.secondary].
  final Color? selectedColor;

  /// The indicator circle's border style.
  ///
  /// Defaults to [BorderStyle.solid] if value is not specified.
  final BorderStyle? borderStyle;
  final double? borderWidth;

  Widget _buildTabIndicator(
    int tabIndex,
    TabController tabController,
    Color selectedColor,
    Color backgroundColor,
    Color borderColor,
  ) {
    return CustomTabPageSelectorIndicator(
      backgroundColor:
          (tabController.index == tabIndex) ? selectedColor : backgroundColor,
      borderColor: borderColor,
      size: indicatorSize,
      borderStyle: borderStyle ?? BorderStyle.solid,
      borderWidth: borderWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color fixColor = color ?? Colors.transparent;
    final Color fixSelectedColor =
        selectedColor ?? Theme.of(context).colorScheme.secondary;
    final TabController? tabController =
        controller ?? DefaultTabController.maybeOf(context);
    assert(() {
      if (tabController == null) {
        throw FlutterError(
          'No TabController for $runtimeType.\n'
          'When creating a $runtimeType, you must either provide an explicit TabController '
          'using the "controller" property, or you must ensure that there is a '
          'DefaultTabController above the $runtimeType.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());
    return Semantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List<Widget>.generate(tabController!.length, (int tabIndex) {
          return _buildTabIndicator(tabIndex, tabController, fixSelectedColor,
              fixColor, fixSelectedColor);
        }).toList(),
      ),
    );
  }
}

/// Displays a single circle with the specified size, border style, border color
/// and background colors.
///
/// Used by [TabPageSelector] to indicate the selected page.
class CustomTabPageSelectorIndicator extends StatelessWidget {
  /// Creates an indicator used by [TabPageSelector].
  ///
  /// The [backgroundColor], [borderColor], and [size] parameters must not be null.
  const CustomTabPageSelectorIndicator(
      {super.key,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.borderStyle = BorderStyle.solid,
      this.borderWidth = 1.0})
      : assert(backgroundColor != null),
        assert(borderColor != null),
        assert(size != null);

  /// The indicator circle's background color.
  final Color backgroundColor;

  /// The indicator circle's border color.
  final Color borderColor;

  /// The indicator circle's diameter.
  final double size;

  /// The indicator circle's border style.
  ///
  /// Defaults to [BorderStyle.solid] if value is not specified.
  final BorderStyle borderStyle;

  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
            color: borderColor, style: borderStyle, width: borderWidth!),
        shape: BoxShape.circle,
      ),
    );
  }
}
