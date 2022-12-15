import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  // List of Tiles
  final List myTiles = [
    'A',
    'B',
    'C',
    'D',
  ];

  //reorder method
  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      // this adjusment is needed when moving down the list
      if (oldIndex < newIndex) {
        newIndex--;
      }

      //get the tile we are moving
      final String tile = myTiles.removeAt(oldIndex);
      //place the tile in new position
      myTiles.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drag&Drop")),
      body: ReorderableListView(
        padding: const EdgeInsets.all(8),
        children: [
          for (final tile in myTiles)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepPurple[100],
                child: ListTile(
                  title: Text(tile.toString()),
                ),
              ),
            )
          // ListTile(
          //   key: ValueKey(tile),
          //   title: Text(tile),
          // )
        ],
        onReorder: (oldIndex, newIndex) => updateMyTiles(oldIndex, newIndex),
      ),
    );
  }
}
