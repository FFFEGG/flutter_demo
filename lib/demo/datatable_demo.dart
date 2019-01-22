import 'package:flutter/material.dart';

import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable：数据表格 '),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortAscending: _sortAscending,
              sortColumnIndex: _sortColumnIndex,
              columns: [
                DataColumn(
                    label: Text('标题'),
                    onSort: (int columnIndex, bool ascending) {
                      setState(() {
                        _sortAscending = ascending;
                        _sortColumnIndex = columnIndex;
                      });

                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    }),
                DataColumn(
                  label: Text('作者'),
                ),
                DataColumn(
                  label: Text('图片'),
                ),
              ],
              rows: posts.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool is_selected){
                    setState(() {
                      if (post.selected != is_selected) {
                        post.selected = is_selected;
                      }
                    });
                  },
                  cells: [
                    DataCell(
                      Text(post.title),
                    ),
                    DataCell(
                      Text(post.author),
                    ),
                    DataCell(
                      Image.network(post.imageUrl),
                    ),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
