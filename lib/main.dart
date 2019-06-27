import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DragBox(Offset(0.0, 0.0), 'خازن 1', Colors.blueAccent, "c1.png","c"),
        DragBox(Offset(200.0, 0.0), 'خازن 2', Colors.blueAccent, "c2.png","c"),
        DragBox(Offset(300.0, 0.0), 'مقاومت 1', Colors.lightGreen, "r2.png","r"),
        DragBox(Offset(300.0, 0.0), 'مقاومت 2', Colors.lightGreen, "rv.jpg","r"),
     /*   Positioned(
          left: 100.0,
          bottom: 0.0,
          child: DragTarget(
            onAccept: (Color color) {
              caughtColor = color;
            },
            builder: (BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,) {
              return Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text("Drag Here!"),
                ),
              );
            },
          ),
        ) */
      ],
    );
  }
}

class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final String image;
  final String type;

  DragBox(this.initPos, this.label, this.itemColor, this.image,this.type);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    double height;
    if(widget.type=='c'){
      height = 60;
    }else{
      height = 40;
    }
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 60.0,
            height: height,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize:13.0,
                ),
              ),
            ),
            /* decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/'+widget.image),
                // ...
              ),
              // ...
            ),
            */
            ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 60.0,
            height: height,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ));
  }
}
