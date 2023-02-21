import 'text.dart';
import 'package:teniyo/src/property/border_radius.dart';
import 'package:teniyo/src/property/color.dart';
import 'package:teniyo/src/lib/css.dart';
import 'package:teniyo/src/property/edge_insets.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';

class TextButton extends Widget{
  final Widget child;
  final Function() onPressed;
  BorderRadius borderRadius;
  EdgeInsets padding;
  final bool disabled;

  TextButton({
    required this.child,
    required this.onPressed,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    this.disabled = false,
  }): borderRadius = borderRadius??BorderRadius.all(20),
      padding = padding??EdgeInsets.symmetric(vertical: 6, horizontal: 25);

  @override
  build(){
    JsFunction onClick = JsFunction.withThis((self, args){
      onPressed();
    });
    if (child is Text){
      if ((child as Text).color==null){
        if (disabled) (child as Text).color = Colors.grey;
        else (child as Text).color = Colors.blue;
      }
      if ((child as Text).selectable==null)
        (child as Text).selectable = false;
    }

    return Html(
      tag: "Button",
      children: child.build(),
      attributes: {
        "onclick": onClick,
        "variant": "text",
        "@disabled": disabled,
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": borderRadius.render(),
        }
      },
    );
  }
}

class ElevatedButton extends Widget{
  final Widget child;
  final Function() onPressed;
  Color? color;
  BorderRadius borderRadius;
  EdgeInsets padding;
  final bool disabled;

  ElevatedButton({
    required this.child,
    required this.onPressed,
    this.color,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    this.disabled = false,
  }): borderRadius = borderRadius??BorderRadius.all(20),
      padding = padding??EdgeInsets.symmetric(vertical: 6, horizontal: 25);

  @override
  build(){
    JsFunction onClick = JsFunction.withThis((self, args){
      onPressed();
    });

    if (child is Text){
      if ((child as Text).color==null){
        if (disabled) (child as Text).color = Colors.grey;
        else (child as Text).color = Colors.white;
      }
      if ((child as Text).selectable==null)
        (child as Text).selectable = false;
    }

    return Html(
      tag: "Button",
      children: child.build(),
      attributes: {
        "onclick": onClick,
        "variant": "contained",
        "@disabled": disabled,
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": borderRadius.render(),
          "backgroundColor": color?.toHex() ?? Colors.blue.toHex(),
          "&:hover": {
            "backgroundColor": Color.lerp(
              color??Colors.blue,
              Colors.black,
              0.1).toHex()
          }
        }
      },
    );
  }
}

class OutlineButton extends Widget{
  final Widget child;
  final Function() onPressed;
  Color? borderColor;
  BorderRadius borderRadius;
  EdgeInsets padding;
  final bool disabled;

  OutlineButton({
    required this.child,
    required this.onPressed,
    this.borderColor,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    this.disabled = false,
  }): borderRadius = borderRadius??BorderRadius.all(20),
      padding = padding??EdgeInsets.symmetric(vertical: 6, horizontal: 25);

  @override
  build(){
    JsFunction onClick = JsFunction.withThis((self, args){
      onPressed();
    });

    if (child is Text){
      if ((child as Text).color==null){
        if (disabled) (child as Text).color = Colors.grey;
        else (child as Text).color = Colors.blue;
      }
      if ((child as Text).selectable==null)
        (child as Text).selectable = false;
    }

    Color secondaryColor = Color.lerp(
      borderColor??Colors.blue,
      Colors.black,
      0.1
    );

    return Html(
      tag: "Button",
      children: child.build(),
      attributes: {
        "onclick": onClick,
        "variant": "outlined",
        "@disabled": disabled,
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": borderRadius.render(),
          "borderColor": borderColor?.toHex() ?? Colors.blue.toHex(),
          "&:hover": {
            "borderColor": secondaryColor.toHex(),
            "backgroundColor": secondaryColor.withAlpha(10).toHex()
          }
        }
      },
      style: Style({
        'color': secondaryColor.toHex()
      })
    );
  }
}