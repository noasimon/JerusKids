import 'package:flutter/material.dart';
import 'playgrounds.dart';
import 'kindergartens.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Expansion List'),
    //     ),
    return new Container(
      padding: new EdgeInsets.all(32.0),
      height: 600.0,
      child: new ListView.builder(
        // body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
          data[index],
        ),
      ),
      // ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry(
    'גני ילדים',
    kindergartens,
  ),
  // Entry(
  // 'גני שעשועים',
  // playgrounds,
  // ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(
          root.title,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        contentPadding: EdgeInsets.only(right: 35.0),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
// class EntryItem extends StatefulWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

// class Category extends StatelessWidget {

//   @override
//   Widget Build(BuildContext context)  {
//     return new Container(
//       padding: new EdgeInsets.all(32.0),
//       child: new Text('category'),
//     );
//   }

// }
