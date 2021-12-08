import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import 'appbar.dart';

class Category {
  final int id;
  final int imgtitle;
  var hover;

  Category({
    @required this.id,
    @required this.imgtitle,
    @required this.hover,
  });
}

var DummyPhoto = [
  Category(id: 0, imgtitle: 0, hover: false),
  Category(id: 1, imgtitle: 1, hover: false),
  Category(id: 2, imgtitle: 2, hover: false),
  Category(id: 3, imgtitle: 3, hover: false),
  Category(id: 4, imgtitle: 4, hover: false),
  Category(id: 5, imgtitle: 5, hover: false),
  Category(id: 6, imgtitle: 6, hover: false),
  Category(id: 7, imgtitle: 7, hover: false),
  Category(id: 8, imgtitle: 8, hover: false),
  Category(id: 9, imgtitle: 9, hover: false),
  Category(id: 10, imgtitle: 10, hover: false),
  Category(id: 11, imgtitle: 11, hover: false),
  Category(id: 12, imgtitle: 12, hover: false),
  Category(id: 13, imgtitle: 13, hover: false),
  Category(id: 14, imgtitle: 14, hover: false),
  Category(id: 15, imgtitle: 15, hover: false),
  Category(id: 16, imgtitle: 16, hover: false),
  Category(id: 17, imgtitle: 17, hover: false),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // double _heightGetter() {
  //   var list = [220, 230, 240, 190, 180, 175, 150, 210, 200, 260];
  //   final _random = new Random();
  //   var element = list[_random.nextInt(list.length)];
  //   return element.toDouble();
  // }

  var counter = 2;
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => null,
          onHover: (hovering) {
            
          },
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: Row(
          children: [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: InkWell(
                  onTap: () => null,
                  onHover: (hovering) {
                  },
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Search'),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: StaggeredGridView.countBuilder(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: DummyPhoto.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => null,
              onHover: (hovering) {
                setState(() {
                  // isHovering = hovering;
                  for (var i = 0; i < DummyPhoto.length; i++) {
                    DummyPhoto[i].hover = false;
                  }
                  DummyPhoto[index].hover = true;
                });
              },
              child: Container(
                //height: _heightGetter(),
                child: (DummyPhoto[index].hover == true)
                    ? Container(
                        // print("hi");
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                // height: _heightGetter(),
                                // margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: (index == 12)
                                        ? NetworkImage(
                                            "https://media.giphy.com/media/3ornkf4SAQutQCpLgc/giphy.gif")
                                        : AssetImage("assets/$index.jpeg"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                // bottom: 20,
                                // right: 10,
                                child: Container(
                                  // margin: EdgeInsets.all(15),
                                  // width: 250,

                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 25,
                                left: 20,
                                child: Container(
                                  child: Icon(Icons.ac_unit),
                                ),
                              ),
                              Positioned(
                                  bottom: 20,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text("hello"),
                                        Text("hello"),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: (index == 12)
                                  ? NetworkImage(
                                      "https://media.giphy.com/media/3ornkf4SAQutQCpLgc/giphy.gif")
                                  : AssetImage(
                                      "assets/${DummyPhoto[index].imgtitle}.jpeg"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
          }),
    );
  }
}