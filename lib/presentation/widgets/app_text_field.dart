import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_framework/responsive_framework.dart';

enum TextFieldType {
  email,
  password,
  normal,
  number,
  plain,
}

class AppTextField extends HookWidget {
  final TextFieldType textFieldType;
  final String initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? counterText;
  final String? labelText;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool? autoFocus;
  final bool? autoCorrect;
  final bool? roundBorder;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool disableUnobscurePassword;
  final VoidCallback? onSuffixIconPressed;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;

  const AppTextField({
    super.key,
    this.initialValue = '',
    this.controller,
    this.validator,
    this.hintText,
    this.icon,
    this.autoFocus,
    this.maxLines,
    this.keyboardType,
    this.margin,
    this.padding,
    this.textFieldType = TextFieldType.normal,
    this.disableUnobscurePassword = false,
    this.onSuffixIconPressed,
    this.inputFormatters,
    this.labelText,
    this.onChanged,
    this.autoCorrect,
    this.suffixIcon,
    this.roundBorder = false,
    this.textAlign,
    this.maxLength,
    this.minLines,
    this.counterText,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPadding = EdgeInsets.symmetric(
      horizontal: ResponsiveValue(
        context,
        defaultValue: 100.0,
        conditionalValues: [
          Condition.smallerThan(name: MOBILE, value: 10.0),
          Condition.equals(name: TABLET, value: 25.0),
        ],
      ).value!,
    );
    print('defaultPaddingTest: $defaultPadding');

    const defaultMargin = EdgeInsets.symmetric(vertical: 15);
    switch (textFieldType) {
      case TextFieldType.email:
        //todo: Fix initial text not showing error
        final textController = useTextEditingController(text: initialValue);

        useEffect(
          () {
            textController.addListener(() {
              // print('CHanged => ${textController.text}');

              // textController.text = initialValu
            });

            return null;
          },
          [textController],
        );

        // print('InitialValue => $initialValue');
        return Container(
          padding: padding ?? defaultPadding,
          margin: margin ?? defaultMargin,
          child: TextFormField(
            autofocus: autoFocus ?? false,
            autocorrect: false,
            controller: textController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: validator,
            textAlign: textAlign ?? TextAlign.center,
            decoration: InputDecoration(
              labelText: labelText ?? 'Email',
              hintText: hintText ?? 'abc@email.com',
              counterText: counterText,
              prefixIcon: const Icon(Icons.mail),
              suffixIcon: textController.text
                      .isEmpty //only if controller is given and textfield is not empty
                  ? Container(width: 0)
                  : onSuffixIconPressed ==
                          null //if the onSuffixIconPressed function is not given
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => textController.clear(),
                        )
                      : IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            textController.clear();
                            onSuffixIconPressed!();
                          },
                        ),
            ),
            onChanged: onChanged,
          ),
        );

      case TextFieldType.password:
        final passwordObscurity = useState(true);
        return Container(
          padding: padding ?? defaultPadding,
          margin: margin ?? defaultMargin,
          child: TextFormField(
            autofocus: autoFocus ?? false,
            controller: controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: validator,
            autocorrect: false,
            textAlign: textAlign ?? TextAlign.center,
            obscureText: passwordObscurity.value,
            decoration: InputDecoration(
              labelText: labelText ?? 'Password',
              hintText: hintText ?? 'pAssWord1@',
              counterText: counterText,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: disableUnobscurePassword == true
                  ? null
                  : IconButton(
                      icon: passwordObscurity.value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () =>
                          passwordObscurity.value = !passwordObscurity.value,
                    ),
            ),
            onChanged: onChanged,
          ),
        );

      case TextFieldType.number:
        return Container(
          padding: padding ?? defaultPadding,
          margin: margin ?? defaultMargin,
          child: TextFormField(
            autofocus: autoFocus ?? false,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: validator,
            autocorrect: false,
            textAlign: textAlign ?? TextAlign.center,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: labelText ?? 'Numbers',
              hintText: hintText ?? '123',
              counterText: counterText,
              alignLabelWithHint: true,
              hintStyle: const TextStyle(textBaseline: TextBaseline.alphabetic),
              prefixIcon: icon != null ? Icon(icon) : null,
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                      icon: Icon(suffixIcon),
                      onPressed: onSuffixIconPressed,
                    ),
            ),
            onChanged: onChanged,
          ),
        );

      case TextFieldType.plain:
        return Container(
          padding: padding ?? defaultPadding,
          margin: margin ?? defaultMargin,
          child: TextFormField(
            autofocus: autoFocus ?? false,
            autocorrect: autoCorrect ?? false,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: validator,
            textAlign: textAlign ?? TextAlign.center,
            inputFormatters: [...?inputFormatters],
            decoration: InputDecoration(
              counterText: counterText,
              labelText: labelText,
              hintText: hintText,
              alignLabelWithHint: true,
              // hintStyle: const TextStyle(textBaseline: TextBaseline.alphabetic),
              prefixIcon: icon != null ? Icon(icon) : null,
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                      icon: Icon(suffixIcon),
                      onPressed: onSuffixIconPressed,
                    ),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        );

      case TextFieldType.normal:
      default:
        return Container(
          padding: padding ?? defaultPadding,
          margin: margin ?? defaultMargin,
          child: TextFormField(
            autofocus: autoFocus ?? false,
            autocorrect: autoCorrect ?? false,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: validator,
            textAlign: textAlign ?? TextAlign.center,
            inputFormatters: [...?inputFormatters],
            decoration: InputDecoration(
              counterText: counterText,
              labelText: labelText,
              hintText: hintText,
              alignLabelWithHint: true,
              // hintStyle: const TextStyle(textBaseline: TextBaseline.alphabetic),
              prefixIcon: icon != null ? Icon(icon) : null,
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                      icon: Icon(suffixIcon),
                      onPressed: onSuffixIconPressed,
                    ),
            ),
            onChanged: onChanged,
          ),
        );
    }
  }
}
