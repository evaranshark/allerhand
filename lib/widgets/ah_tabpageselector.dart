import 'package:flutter/material.dart';

/// Uses [CustomTabPageSelectorIndicator] to display a row of small circular
/// indicators, one per tab.

class CustomTabPageSelector extends StatelessWidget {
  /// Creates a compact widget that indicates which tab has been selected.
  const CustomTabPageSelector(
      {super.key,
      this.indicatorSize = 12.0,
      this.color = Colors.transparent,
      required this.length,
      required this.selectedIndex,
      this.spaceBetweenIndicators = 24,
      this.selectedColor = Colors.black,
      this.borderStyle,
      this.borderWidth})
      : assert(indicatorSize != null && indicatorSize > 0.0),
        assert(selectedIndex != null);

  /// The indicator circle's diameter (the default value is 12.0).
  final double indicatorSize;

  /// Number of dots in selector.
  /// Should be equal to number of pages
  final int length;

  final int selectedIndex;

  final int spaceBetweenIndicators;

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
    int selectedIndex,
    Color selectedColor,
    Color backgroundColor,
    Color borderColor,
    int space,
  ) {
    return CustomTabPageSelectorIndicator(
      backgroundColor:
          (selectedIndex == tabIndex) ? selectedColor : backgroundColor,
      borderColor: borderColor,
      size: indicatorSize,
      borderStyle: borderStyle ?? BorderStyle.solid,
      borderWidth: borderWidth ?? 1.0,
      margins: space / 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color fixColor = color ?? Colors.transparent;
    final Color fixSelectedColor = selectedColor ?? Colors.black;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List<Widget>.generate(length, (int tabIndex) {
        return _buildTabIndicator(tabIndex, selectedIndex, fixSelectedColor,
            fixColor, fixSelectedColor, spaceBetweenIndicators);
      }).toList(),
    );
  }
}

/// Displays a single circle with the specified size, border style, border color
/// and background colors.
///
/// Used by [CustomTabPageSelector] to indicate the selected page.
class CustomTabPageSelectorIndicator extends StatelessWidget {
  /// Creates an indicator used by [TabPageSelector].
  ///
  /// The [backgroundColor], [borderColor], and [size] parameters must not be null.
  const CustomTabPageSelectorIndicator(
      {super.key,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.margins,
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

  final double? margins;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.all(margins ?? 4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
            color: borderColor, style: borderStyle, width: borderWidth!),
        shape: BoxShape.circle,
      ),
    );
  }
}
