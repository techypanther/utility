// import 'package:avunja/ui/shared/app_theme.dart';
import 'package:techypantherutility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxline;
  final bool editable;
  final Function onPress;
  final Function(String value) onChnaged;
  final TextInputType inputType;
  final Widget suffixIconWidget;
  final Size suffixIconSize;
  final double fontSize;
  TextEditingController controller;
  Color color;
  List<TextInputFormatter> inputFormatters ;
  CustomTextField(this.hint,
      {this.maxline = 1,
      this.editable = true,
      this.onPress,
      this.suffixIconWidget,
      this.suffixIconSize = const Size(0, 0),
      this.controller,
      this.color,
        this.onChnaged,
        this.fontSize = 16,
        this.inputFormatters = const [],
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // if (color == null) color = AppTheme.plRedColor;
    return InkWell(
      onTap: onPress,
      child: controller != null
          ? TextFormField(
              enabled: editable,
              maxLines: maxline == 0 ? null : maxline,
              controller: controller,
              keyboardType: inputType,
              style: valueStyle(fontSize: fontSize),
              onChanged: (String value) => onChnaged(value),
              inputFormatters: inputFormatters,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: hintStyle(),
                border: borderWidget(Color(0xfff2f2f2)),
                disabledBorder: borderWidget(Color(0xfff2f2f2)),
                enabledBorder: borderWidget(Color(0xfff2f2f2)),
                focusedBorder: borderWidget(Color(0xfff2f2f2)),
                suffixIconConstraints: BoxConstraints.tight(suffixIconSize),
                suffixIcon:
                    suffixIconWidget == null ? Container() : suffixIconWidget,
                alignLabelWithHint: true,
                labelStyle: labelStyle(),

              ),
            )
          : TextFormField(
              enabled: editable,
              maxLines: maxline == 0 ? null : maxline,
              keyboardType: inputType,
              style: valueStyle(fontSize: fontSize),
              inputFormatters: inputFormatters,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: hint,
                hintStyle: hintStyle(),
                isDense: true,
                border: borderWidget(Color(0xfff2f2f2)),
                disabledBorder: borderWidget(Color(0xfff2f2f2)),
                enabledBorder: borderWidget(Color(0xfff2f2f2)),
                focusedBorder: borderWidget(Color(0xfff2f2f2)),
                suffixIconConstraints: BoxConstraints.tight(suffixIconSize),
                suffixIcon:
                    suffixIconWidget == null ? Container() : suffixIconWidget,
                alignLabelWithHint: true,
                labelStyle: labelStyle(),
              ),
            ),
    );
  }

  labelStyle() {
    return TextStyle(
      fontSize: SizeConfig.setSp(13),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }

  hintStyle() {
    return TextStyle(
      color: Color(0xff5a5a5a),
      fontSize: SizeConfig.setSp(13),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }

  valueStyle({double fontSize }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }
}

borderWidget(Color color) {
  return new UnderlineInputBorder(
      borderSide: new BorderSide(color: color, width: 1));
}
