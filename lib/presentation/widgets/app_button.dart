import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

enum ButtonType {
  primary,
  secondary,
}

class AppButton extends StatelessWidget {
  final ButtonType buttonType;
  final String textString;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  const AppButton({
    super.key,
    required this.textString,
    required this.onPressed,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.textColor,
    this.borderColor,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.secondary:
        return Container(
          margin: margin ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  color ?? Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.0,
              minimumSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                  color: borderColor ?? kSecondaryColor,
                  width: 2,
                ),
              ),
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
              alignment: alignment,
              textStyle: TextStyle(
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 14.0,
                  conditionalValues: [
                    Condition.smallerThan(name: MOBILE, value: 15.0),
                    Condition.largerThan(name: TABLET, value: 25.0)
                  ],
                ).value,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              textString,
              style: TextStyle(
                color: textColor ?? kSecondaryColor,
              ),
            ),
          ),
        );

      case ButtonType.primary:
      default:
        return Container(
          margin: margin ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Theme.of(context).colorScheme.primary,
              elevation: 0.0,
              minimumSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                  color: borderColor ?? Colors.white.withOpacity(0.00),
                  width: 2,
                ),
              ),
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 40,
                  ),
              alignment: alignment,
              textStyle: TextStyle(
                fontSize: ResponsiveValue(
                  context,
                  defaultValue: 14.0,
                  conditionalValues: [
                    Condition.smallerThan(name: MOBILE, value: 15.0),
                    Condition.largerThan(name: TABLET, value: 25.0)
                  ],
                ).value,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              textString,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        );
    }
  }
}
