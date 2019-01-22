import 'package:flutter/material.dart';

import '../model/post.dart';

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}


class PostDataSource extends DataTableSource {

  final List<Post> _posts = posts;
  int _selectedRowCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;


  @override
  int get selectedRowCount => _selectedRowCount;

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(posts[index].title),
        ),
        DataCell(
          Text(posts[index].author),
        ),
        DataCell(
          Image.network(posts[index].imageUrl),
        ),
      ],
    );
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}


class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;
  final PostDataSource _postDataSource = PostDataSource();

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
            PaginatedDataTable(
              header: Center(
                child: Text('文章列表'),
              ),
              source: _postDataSource,
              sortAscending: _sortAscending,
              sortColumnIndex: _sortColumnIndex,
              columns: [
                DataColumn(
                    label: Text('标题'),
                    onSort: (int columnIndex, bool ascending) {
                      _postDataSource._sort((post) => post.title.length,
                          ascending);

                      setState(() {
                        _sortAscending = ascending;
                        _sortColumnIndex = columnIndex;
                      });

//                      posts.sort((a, b) {
//                        if (!ascending) {
//                          final c = a;
//                          a = b;
//                          b = c;
//                        }
//                        return a.title.length.compareTo(b.title.length);
//                      });


                    }),
                DataColumn(
                  label: Text('作者'),
                ),
                DataColumn(
                  label: Text('图片'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
