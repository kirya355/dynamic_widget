import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class RaisedButtonParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    String? clickEvent = map.containsKey("click_event") ? map['click_event'] : "";

    var raisedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: map.containsKey('color') ? parseHexColor(map['color']) : null,
          disabledBackgroundColor: map.containsKey('disabledColor') ? parseHexColor(map['disabledColor']) : null,
          elevation: map.containsKey('elevation') ? map['elevation']?.toDouble() : 0.0,
          padding: map.containsKey('padding') ? parseEdgeInsetsGeometry(map['padding']) : null,
          textStyle: TextStyle(
            color: map.containsKey('textColor') ? parseHexColor(map['textColor']) : null,
          )),
      //disabledElevation: map.containsKey('disabledElevation') ? map['disabledElevation']?.toDouble() : 0.0,
      // disabledTextColor: map.containsKey('disabledTextColor') ? parseHexColor(map['disabledTextColor']) : null,
      //splashColor: map.containsKey('splashColor') ? parseHexColor(map['splashColor']) : null,
      child: DynamicWidgetBuilder.buildFromMap(map['child'], buildContext, listener),
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
    );

    return raisedButton;
  }

  @override
  String get widgetName => "RaisedButton";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    return <String, dynamic>{};
  }

  @override
  Type get widgetType => ElevatedButton;
}

class ElevatedButtonParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ElevatedButton;
    var color = realWidget.style?.foregroundColor != null ? realWidget.style?.foregroundColor?.resolve(MaterialState.values.toSet()) : null;
    var backgroundColor = realWidget.style?.backgroundColor != null ? realWidget.style?.backgroundColor?.resolve(MaterialState.values.toSet()) : null;
    var overlayColor = realWidget.style?.overlayColor != null ? realWidget.style?.overlayColor?.resolve(MaterialState.values.toSet()) : null;
    var shadowColor = realWidget.style?.shadowColor != null ? realWidget.style?.shadowColor?.resolve(MaterialState.values.toSet()) : null;
    var elevation = realWidget.style?.elevation != null ? realWidget.style?.elevation?.resolve(MaterialState.values.toSet()) : null;
    var edgeInsetsGeometry = realWidget.style?.padding != null ? realWidget.style?.padding?.resolve(MaterialState.values.toSet()) as EdgeInsets? : null;
    var textStyle2 = realWidget.style?.textStyle != null ? realWidget.style?.textStyle?.resolve(MaterialState.values.toSet()) : null;
    return <String, dynamic>{"type": widgetName, "foregroundColor": color != null ? color.value.toRadixString(16) : null, "backgroundColor": backgroundColor != null ? backgroundColor.value.toRadixString(16) : null, "overlayColor": overlayColor != null ? overlayColor.value.toRadixString(16) : null, "shadowColor": shadowColor != null ? shadowColor.value.toRadixString(16) : null, "elevation": elevation, "padding": edgeInsetsGeometry != null ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}" : null, "textStyle": exportTextStyle(textStyle2), "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)};
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    String? clickEvent = map.containsKey("click_event") ? map['click_event'] : "";

    return ElevatedButton(
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
      style: ButtonStyle(
        foregroundColor: map.containsKey("foregroundColor") ? MaterialStateProperty.all(parseHexColor(map["foregroundColor"])) : null,
        backgroundColor: map.containsKey("backgroundColor") ? MaterialStateProperty.all(parseHexColor(map["backgroundColor"])) : null,
        overlayColor: map.containsKey("overlayColor") ? MaterialStateProperty.all(parseHexColor(map["overlayColor"])) : null,
        shadowColor: map.containsKey("shadowColor") ? MaterialStateProperty.all(parseHexColor(map["shadowColor"])) : null,
        elevation: map.containsKey("elevation") ? MaterialStateProperty.all(map["elevation"]) : null,
        padding: map.containsKey("padding") ? MaterialStateProperty.all(parseEdgeInsetsGeometry(map["padding"])) : null,
        textStyle: map.containsKey("textStyle") ? MaterialStateProperty.all(parseTextStyle(map["textStyle"])) : null,
        alignment: map.containsKey("alignment") ? parseAlignment(map["alignment"]) : null,
      ),
      child: DynamicWidgetBuilder.buildFromMap(map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "ElevatedButton";

  @override
  Type get widgetType => ElevatedButton;
}

class TextButtonParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as TextButton;
    var color = realWidget.style?.foregroundColor != null ? realWidget.style?.foregroundColor?.resolve(MaterialState.values.toSet()) : null;
    var backgroundColor = realWidget.style?.backgroundColor != null ? realWidget.style?.backgroundColor?.resolve(MaterialState.values.toSet()) : null;
    var overlayColor = realWidget.style?.overlayColor != null ? realWidget.style?.overlayColor?.resolve(MaterialState.values.toSet()) : null;
    var shadowColor = realWidget.style?.shadowColor != null ? realWidget.style?.shadowColor?.resolve(MaterialState.values.toSet()) : null;
    var elevation = realWidget.style?.elevation != null ? realWidget.style?.elevation?.resolve(MaterialState.values.toSet()) : null;
    var edgeInsetsGeometry = realWidget.style?.padding != null ? realWidget.style?.padding?.resolve(MaterialState.values.toSet()) as EdgeInsets? : null;
    var textStyle2 = realWidget.style?.textStyle != null ? realWidget.style?.textStyle?.resolve(MaterialState.values.toSet()) : null;
    var map = <String, dynamic>{"type": widgetName, "foregroundColor": color != null ? color.value.toRadixString(16) : null, "backgroundColor": backgroundColor != null ? backgroundColor.value.toRadixString(16) : null, "overlayColor": overlayColor != null ? overlayColor.value.toRadixString(16) : null, "shadowColor": shadowColor != null ? shadowColor.value.toRadixString(16) : null, "elevation": elevation, "padding": edgeInsetsGeometry != null ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}" : null, "textStyle": exportTextStyle(textStyle2), "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)};
    return map;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    String? clickEvent = map.containsKey("click_event") ? map['click_event'] : "";

    return TextButton(
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
      style: ButtonStyle(
        foregroundColor: map.containsKey("foregroundColor") ? MaterialStateProperty.all(parseHexColor(map["foregroundColor"])) : null,
        backgroundColor: map.containsKey("backgroundColor") ? MaterialStateProperty.all(parseHexColor(map["backgroundColor"])) : null,
        overlayColor: map.containsKey("overlayColor") ? MaterialStateProperty.all(parseHexColor(map["overlayColor"])) : null,
        shadowColor: map.containsKey("shadowColor") ? MaterialStateProperty.all(parseHexColor(map["shadowColor"])) : null,
        elevation: map.containsKey("elevation") ? MaterialStateProperty.all(map["elevation"]) : null,
        padding: map.containsKey("padding") ? MaterialStateProperty.all(parseEdgeInsetsGeometry(map["padding"])) : null,
        textStyle: map.containsKey("textStyle") ? MaterialStateProperty.all(parseTextStyle(map["textStyle"])) : null,
        alignment: map.containsKey("alignment") ? parseAlignment(map["alignment"]) : null,
      ),
      child: DynamicWidgetBuilder.buildFromMap(map['child'], buildContext, listener)!,
    );
  }

  @override
  String get widgetName => "TextButton";

  @override
  Type get widgetType => TextButton;
}
