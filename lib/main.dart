import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techypantherutility/CustomTextField.dart';
import 'package:techypantherutility/size_config.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF000000, const {
          50: const Color(0xFF000000),
          100: const Color(0xFF000000),
          200: const Color(0xFF000000),
          300: const Color(0xFF000000),
          400: const Color(0xFF000000),
          500: const Color(0xFF000000),
          600: const Color(0xFF000000),
          700: const Color(0xFF000000),
          800: const Color(0xFF000000),
          900: const Color(0xFF000000),
        }),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController screenHeightController = TextEditingController();
  TextEditingController enteredHeightController = TextEditingController();
  TextEditingController screenWidthController = TextEditingController();
  TextEditingController enteredWidthController = TextEditingController();

  double screenHeight;
  double enteredHeight;
  double screenWidth;
  double enteredWidth;
  bool onChangeHeightEditable = false;
  bool onChangeWidthEditable = false;
  double onChangeHeight = 0.0;
  double onChangeWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        SizeConfig().init(ctx, constraints);
        return Scaffold(
          appBar: AppBar(
            title: Text('Techy Panther Utility'),
          ),
          body: _getBody(),
        );
      },
    );
  }

  Widget _getBody() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: SizeConfig.relativeWidth(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headingWidget(title: "Height"),
              SizeConfig.verticalSpacer(8),
              Container(
                width: SizeConfig.relativeWidth(35),
                child: CustomTextField(
                    "Enter Screen Height",
                  controller: screenHeightController,
                  onChnaged: (value) {
                      screenHeight = value.isNotEmpty ?double.parse(value) / 100
                      : 0.0;
                      onChangeHeightEditable = value.isNotEmpty ? true : false;
                      setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(8),
              Container(
                width: SizeConfig.relativeWidth(35),
                child: CustomTextField(
                    "Enter Height",
                  editable: onChangeHeightEditable,
                  controller: enteredHeightController,
                  onChnaged: (value) {
                      onChangeHeight = value.isNotEmpty ? double.parse(value) / screenHeight : 0.0;
                      setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(10),
              resultWidget(isHeight: true),
            ],
          ),
        ),
        Container(
          width: SizeConfig.relativeWidth(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headingWidget(title: "Width"),
              SizeConfig.verticalSpacer(8),
              Container(
                width: SizeConfig.relativeWidth(35),
                child: CustomTextField(
                  "Enter Screen Width",
                  controller: screenWidthController,
                  onChnaged: (value){
                    screenWidth = value.isNotEmpty ? double.parse(value) / 100 : 0.0;
                    onChangeWidthEditable = value.isNotEmpty ? true : false;
                    setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(8),
              Container(
                width: SizeConfig.relativeWidth(35),
                child: CustomTextField(
                    "Enter Width",
                  editable: onChangeWidthEditable,
                  controller: enteredWidthController,
                  onChnaged: (value) {
                      onChangeWidth = value.isNotEmpty ? double.parse(value) / screenWidth : 0.0;
                      setState(() {});
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(10),
              resultWidget(isHeight: false)
            ],
          ),
        ),
      ],
    );
  }

  resultWidget({bool isHeight}) {
    return Container(
      width: SizeConfig.relativeWidth(25),
      height: SizeConfig.relativeHeight(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Center(
        child: Text(
          isHeight ? "${onChangeHeight.toStringAsFixed(2)}" : "${onChangeWidth.toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.red,
            fontSize: SizeConfig.setSp(14),
          ),
        ),
      ),
    );
  }

  headingWidget({String title}) {
    return Text(
      "$title",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.setSp(16),
      ),
    );
  }

}
