import 'package:flutter/material.dart';

class PermanentOverlay {
  final String message;
  final BuildContext context;

  PermanentOverlay(this.message, this.context);

  void show() {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.blue,
            child: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
    // Sau một khoảng thời gian, bạn có thể muốn loại bỏ overlay
    Future.delayed(Duration(seconds: 3), () {
       overlayEntry.remove();
    });
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permanent Overlay Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),));
              },
              child: Text('2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Hiển thị Overlay khi nhấn nút
                PermanentOverlay('This is a permanent overlay!', context).show();
              },
              child: Text('Show Permanent Overlay'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        // Nút back mặc định được thêm tự động
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Sử dụng Navigator để quay lại màn hình trước đó
            Navigator.of(context).pop();
          },
        ),
        title: Text('My App'),
      ),
    );
  }
}
