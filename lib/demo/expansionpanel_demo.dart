import 'package:flutter/material.dart';

class Item {
  String heard;
  Widget body;
  bool isExpanded;

  Item({
    this.body,
    this.heard,
    this.isExpanded
  });

}

class ExpansionpanelDemo extends StatefulWidget {
  @override
  _ExpansionpanelDemoState createState() => _ExpansionpanelDemoState();
}

class _ExpansionpanelDemoState extends State<ExpansionpanelDemo> {
  bool _isExpanded = false;
  List<Item> _expandedItems;

  @override
  void initState() {
    super.initState();
    _expandedItems = <Item>[
      Item(
          heard: 'Panlne A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Panlne A............'),
            width: double.infinity,
          ),
          isExpanded: false
      ),
      Item(
          heard: 'Panlne B',
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Panlne B............'),
            width: double.infinity,
          ),
          isExpanded: false
      ),
      Item(
          heard: 'Panlne C',
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Panlne C............'),
            width: double.infinity,
          ),
          isExpanded: false
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionpanelDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionPanelList(
                expansionCallback: (int panelIndex, bool isExpanded) {
                  setState(() {
                    _expandedItems[panelIndex].isExpanded = !isExpanded;
                  });
                },
                children: _expandedItems.map(
                        (Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text(item.heard),
                          );
                        },
                        body: item.body,
                        isExpanded: item.isExpanded,
                      );
                    }
                ).toList()
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
