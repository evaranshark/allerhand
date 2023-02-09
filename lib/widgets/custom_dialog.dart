import 'package:flutter/cupertino.dart';

class CustomDialog extends StatelessWidget {
  final double? width, height;
  final EdgeInsets? padding;
  final Widget? content;

  const CustomDialog({
    super.key,
    this.width,
    this.height,
    this.content,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: width,
      height: height,
      /*constraints: BoxConstraints(
        minWidth: size.width / 4,
        minHeight: size.height / 3,
        maxWidth: size.width / 2,
      ),*/
      child: CupertinoPopupSurface(
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
          child: content,
        ),
      ),
    );
  }
}

class CustomDialogContent extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  const CustomDialogContent(
      {super.key, this.title, this.content, this.actions});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(48, 30, 48, 0),
          child: title,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: content,
        ),
        if (actions != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
            child: Row(children: actions!),
          ),
      ],
    );
  }
}
