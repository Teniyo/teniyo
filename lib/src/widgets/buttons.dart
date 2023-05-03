import 'package:teniyo/src/lib/attribute.dart';
import 'package:teniyo/src/property/button_style.dart';
import 'package:teniyo/src/property/color.dart';
import 'package:teniyo/src/property/edge_insets.dart';
import 'package:teniyo/src/lib/html.dart';
import 'package:teniyo/src/property/widget.dart';
import 'package:teniyo/src/lib/not_web.dart' if (dart.library.html) 'package:teniyo/src/lib/is_web.dart';
import 'package:teniyo/src/widgets/text.dart';

class Button extends Widget{
  final Widget child;
  final Function() onPressed;
  EdgeInsets padding;
  final bool disabled;
  final ButtonStyle buttonStyle;

  Button({
    required this.child,
    required this.onPressed,
    ButtonStyle? buttonStyle,
    EdgeInsets? padding,
    this.disabled = false,
  }):
    buttonStyle = buttonStyle??ButtonStyle(),
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
      key: key,
      children: child.build(),
      attributes: {
        "onClick": onClick,
        "variant": "text",
        "disabled": Attribute.setKey(disabled),
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": buttonStyle.borderRadius.render(),
          "backgroundColor": buttonStyle.color?.toRgba(),
        }
      },
    );
  }
}

class TextButton extends Button{

  TextButton({
    required super.child,
    required super.onPressed,
    super.buttonStyle,
    super.padding,
    super.disabled,
  });
  
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
      key: key,
      children: child.build(),
      attributes: {
        "onClick": onClick,
        "variant": "text",
        "disabled": Attribute.setKey(disabled),
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": buttonStyle.borderRadius.render(),
          "backgroundColor": Attribute.If(!disabled, buttonStyle.color?.toRgba()),
          "&:hover": {
            "backgroundColor": buttonStyle.hoverColor?.toRgba() ?? Attribute.If(
              buttonStyle.color != null,
              Color.lerp(
                buttonStyle.color ?? Colors.blue,
                Colors.white,
                0.15
              ).toRgba()
            )
          },
          "&:disabled": {
            "backgroundColor": Attribute.If(
              buttonStyle.disabledColor!=null,
              buttonStyle.disabledColor?.toRgba()
            )
          },
          "& .MuiTouchRipple-root": {
            "color": buttonStyle.splashColor?.toRgba() ?? Attribute.If(
              buttonStyle.color!=null,
              Color.lerp(
                buttonStyle.color ?? Colors.blue,
                Colors.white,
                0.95
              ).toRgba()
            )
          }
        }
      },
    );
  }
}

class ElevatedButton extends Button{

  ElevatedButton({
    required super.child,
    required super.onPressed,
    super.buttonStyle,
    super.padding,
    super.disabled,
  });

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
      key: key,
      children: child.build(),
      attributes: {
        "onClick": onClick,
        "variant": "contained",
        "disabled": Attribute.setKey(disabled),
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": buttonStyle.borderRadius.render(),
          "backgroundColor": buttonStyle.color?.toRgba(),
          "&:hover": {
            "backgroundColor": buttonStyle.hoverColor?.toRgba() ?? Attribute.If(
              buttonStyle.color != null,
              Color.lerp(
                buttonStyle.color ?? Colors.blue,
                Colors.black,
                0.1
              ).toRgba()
            )
          },
          "&:disabled": {
            "backgroundColor": Attribute.If(
              buttonStyle.disabledColor!=null,
              buttonStyle.disabledColor?.toRgba()
            )
          },
          "& .MuiTouchRipple-root": {
            "color": Attribute.If(
              buttonStyle.splashColor!=null,
              buttonStyle.splashColor?.toRgba()
            )
          }
        }
      },
    );
  }
}

class OutlineButton extends Button{

  OutlineButton({
    required super.child,
    required super.onPressed,
    super.buttonStyle,
    super.padding,
    super.disabled,
  });

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
      buttonStyle.hoverColor ?? buttonStyle.color?? Colors.blue,
      Colors.black,
      0.15
    );

    return Html(
      tag: "Button",
      key: key,
      children: child.build(),
      attributes: {
        "onClick": onClick,
        "variant": "outlined",
        "disabled": Attribute.setKey(disabled),
        "sx": {
          "textTransform": "none",
          "padding": padding.render(),
          "borderRadius": buttonStyle.borderRadius.render(),
          "borderColor": buttonStyle.color?.toRgba() ?? Colors.blue.toRgba(),
          "&:hover": {
            "borderColor": secondaryColor.toRgba(),
            "backgroundColor": buttonStyle.hoverColor?.toRgba() ?? Attribute.If(
              buttonStyle.color!=null,
              Color.lerp(
                buttonStyle.color ?? Colors.blue,
                Colors.white,
                0.95
              ).toRgba()
            )
          },
          "&:disabled": {
            "backgroundColor": Attribute.If(
              buttonStyle.disabledColor!=null,
              buttonStyle.disabledColor?.toRgba()
            )
          },
          "& .MuiTouchRipple-root": {
            "color": Attribute.If(
              buttonStyle.splashColor!=null || buttonStyle.color != null,
              Color.lerp(
                buttonStyle.splashColor ?? buttonStyle.color ?? Colors.blue,
                Colors.white,
                0.3
              ).toRgba()
            )
          }
        }
      },
    );
  }
}