import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List _tags = ['Apple', 'Bnana', 'Lemon'];
  String _action = 'Nothing';
  List<String> _seleted = [];
  String _choice = 'Apple';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0,right: 10.0),
        child: Wrap(
          spacing: 18.0,
          runSpacing: 20.0,
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Chip(
              label: Text('Chip'),
            ),
            Chip(
              label: Text('Orange'),
              backgroundColor: Colors.orange,
            ),
            Chip(
              label: Text('FiveEggs'),
              backgroundColor: Colors.orange,
              avatar: CircleAvatar(
                child: Text('蛋'),
                backgroundColor: Colors.pinkAccent,
              ),
            ),
            Chip(
              label: Text('FiveEggs'),
//              backgroundColor: Colors.orange,
              avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                  'http://b387.photo.store.qq.com/psb?/f6bff9ce-0df3-4d44-a09d-3e50db4e9be2/gUjyUFyLdOldS0AYhpa3V9xF9ot4QbRxA7XTApnfvi8!/b/dBKyruYMMAAA&bo=wAOAAgAAAAABB2E!&rf=viewer_4',
                ),
              ),
            ),
            Chip(
              label: Text('点击删除'),
              onDeleted: () {},
              deleteIcon: Icon(Icons.delete_forever),
              deleteIconColor: Colors.redAccent,
              deleteButtonTooltipMessage: 'delete',
            ),
            Divider(
              color: Colors.black38,
              height: 20.0,
//              indent: 10.0,
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              color: Colors.black38,
              height: 20.0,
//              indent: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ActionChip:$_action'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return ActionChip(
                  label: Text(tag),
                  onPressed: () {
                    setState(() {
                      _action = tag;
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              color: Colors.black38,
              height: 20.0,
//              indent: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Text('FilterChip:${_seleted.toString()}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return FilterChip(
                  label: Text(tag),
//                  onPressed: () {
//                    setState(() {
//                      _action = tag;
//                    });
//                  },
                  selected: _seleted.contains(tag),
                  onSelected: (value){
                    if(_seleted.contains(tag)){
                      setState(() {
                        _seleted.remove(tag);
                      });
                    } else {
                      setState(() {
                        _seleted.add(tag);
                      });
                    }
                  },
                );
              }).toList(),
            ),
            Divider(
              color: Colors.black38,
              height: 20.0,
//              indent: 10.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ChoiceChip:${_choice}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return ChoiceChip(
                  label: Text(tag),
//                  onPressed: () {
//                    setState(() {
//                      _action = tag;
//                    });
//                  },
                  selected: _choice == tag,
                  onSelected: (value){
                    setState(() {
                      _choice = tag;
                    });
                  },
                );
              }).toList(),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tags = [
              'Apple', 'Bnana', 'Lemon'
            ];
            _seleted = [];
            _choice = 'Apple';
          });
        },
        child: Icon(Icons.restore),
      ),
    );
  }
}
