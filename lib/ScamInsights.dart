import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Material MyItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    heading,
                    style: TextStyle(
                      color: Color(color),
                      fontSize: 20.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children:  [
            StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 150.0, child: MyItems(Icons.graphic_eq, "TotalView", 0xffed622b)),
            StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 150.0, child: MyItems(Icons.graphic_eq, "Bookmark", 0xff26cb3c)),
            StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 150.0, child: MyItems(Icons.graphic_eq, "Notification", 0xffff3266)),
            StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 150.0, child: MyItems(Icons.graphic_eq, "Balance", 0xff3399fe)),
            StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 150.0, child: MyItems(Icons.graphic_eq, "Settings", 0xfff4c83f)),
            StaggeredGridTile.extent(crossAxisCellCount: 2, mainAxisExtent: 240.0, child: MyItems(Icons.graphic_eq, "Group Work", 0xff622F74)),
            StaggeredGridTile.extent(crossAxisCellCount: 2, mainAxisExtent: 240.0, child: MyItems(Icons.graphic_eq, "Messages", 0xff7297ff)),
          ],
        ),
      ),
    );
  }
}
