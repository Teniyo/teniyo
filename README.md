**Teniyo** is a modern and powerful framework designed for building web applications with Dart. It provides a simple and intuitive API, allowing developers to build responsive and visually stunning web applications with ease. Teniyo has a rich set of components and widgets that enable you to create beautiful and sophisticated web interfaces. Its Flutter-inspired development approach means that developers who are already familiar with Flutter can easily transition to building web applications using Teniyo. With Teniyo, you can focus on building your application logic rather than spending time on low-level details.

### Important Notice

> This library is currently under development and no release version has been published yet. We're working hard to provide you with the best possible experience and will publish a stable version as soon as possible. Until then, please note that the library may contain bugs or incomplete features, and is not recommended for production use. Your feedback and contributions are highly appreciated and will help us improve the library. Thank you for your understanding and support!

## Simple Example

```dart
import 'package:teniyo/teniyo.dart';

void main() {
  App().run();
}

class App extends Teniyo {
  int counter = 0;

  @override
  build(Page page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$counter",
          fontSize: 40
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text("Add"),
              onPressed: (){
                counter++;
                page.update();
              }
            ),
            TextButton(
              child: Text("Reset", color: Colors.red),
              onPressed: (){
                counter=0;
                page.update();
              }
            ),
          ]
        )
      ]
    );
  }
}
```

## Output

<img src="https://github.com/Teniyo/teniyo/raw/main/doc/simple-output.webp" width=250>
