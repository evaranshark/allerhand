import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/allerhand_icons.dart';
import '../utils/locator.dart';
import '../utils/my_router_delegate.dart';
import '../utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading, trailing;
  final String? title, subtitle;
  final double? height;
  const CustomAppBar(
      {super.key,
      this.leading,
      this.trailing,
      this.title,
      this.subtitle,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 170,
      child: Row(
        children: [
          leading ?? _defaultLeading(),
          const SizedBox(
            width: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title ?? '',
                    style: CustomStyles.pageTitleTextStyle,
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: CustomStyles.pageSubtitleTextStyle,
                  ),
              ],
            ),
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }

  _defaultLeading() {
    return Align(
      alignment: Alignment.topCenter,
      child: CupertinoButton(
          child: const Icon(
            AllerhandIcons.arrow_left,
            color: Colors.black,
            size: 65,
          ),
          onPressed: () => locator.get<MyRouterDelegate>().popRoute()),
    );
  }
}
