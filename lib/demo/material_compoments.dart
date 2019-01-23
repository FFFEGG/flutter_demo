import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/alterdialog_demo.dart';
import 'package:flutter_demo/demo/bottom_sheet_demo.dart';
import 'package:flutter_demo/demo/card_demo.dart';
import 'package:flutter_demo/demo/check_box_demo.dart';
import 'package:flutter_demo/demo/chip_demo.dart';
import 'package:flutter_demo/demo/datatable_demo.dart';
import 'package:flutter_demo/demo/datetime_demo.dart';
import 'package:flutter_demo/demo/expansionpanel_demo.dart';
import 'package:flutter_demo/demo/form_demo.dart';
import 'package:flutter_demo/demo/paginated_datatable_demo.dart';
import 'package:flutter_demo/demo/popup_menu_button_demo.dart';
import 'package:flutter_demo/demo/radio_demo.dart';
import 'package:flutter_demo/demo/simple_dialog_demo.dart';
import 'package:flutter_demo/demo/slider_demo.dart';
import 'package:flutter_demo/demo/snackbar_demo.dart';
import 'package:flutter_demo/demo/state/scoped_model_demo.dart';
import 'package:flutter_demo/demo/state/state_management_demo.dart';
import 'package:flutter_demo/demo/stepper_demo.dart';
import 'package:flutter_demo/demo/stream/stream_demo.dart';
import 'package:flutter_demo/demo/switch_demo.dart';

class MaterialCompomentsDmoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialCompomentsDmoe'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListItem(
              title: 'ExpansionpanelDemo',
              page: ExpansionpanelDemo(),
            ),
            ListItem(
              title: 'SnackBarDemo',
              page: SnackBarDemo(),
            ),
            ListItem(
              title: 'BottomSheetDemo',
              page: BottomSheetDemo(),
            ),
            ListItem(
              title: 'AlertDialogDemo',
              page: AlertDialogDemo(),
            ),
            ListItem(
              title: 'SimpleDialogDemo',
              page: SimpleDialogDemo(),
            ),
            ListItem(
              title: 'button',
              page: PageDemo(),
            ),
            ListItem(
              title: 'ButtomDemo',
              page: ButtomDemo(),
            ),
            ListItem(
              title: 'PopupMenuButtonDemo',
              page: PopupMenuButtonDemo(),
            ),
            ListItem(
              title: 'FormDemo',
              page: FormDemo(),
            ),
            ListItem(
              title: 'CheckBoxDemo',
              page: CheckBoxDemo(),
            ),
            ListItem(
              title: 'RadioDemo',
              page: RadioDemo(),
            ),
            ListItem(
              title: 'SwitchDemo',
              page: SwitchDemo(),
            ),
            ListItem(
              title: 'SliderDemo',
              page: SliderDemo(),
            ),
            ListItem(
              title: 'DateTimeDemo',
              page: DateTimeDemo(),
            ),
            Divider(),
            ListItem(
              title: 'ChipDemo',
              page: ChipDemo(),
            ),
            ListItem(
              title: 'DataTableDemo',
              page: DataTableDemo(),
            ),
            ListItem(
              title: 'PaginatedDataTableDemo',
              page: PaginatedDataTableDemo(),
            ),
            ListItem(
              title: 'CardDemo',
              page: CardDemo(),
            ),
            ListItem(
              title: 'StepperDemo',
              page: StepperDemo(),
            ),
            Divider(),
            Center(
              child: Text('状态管理'),
            ),
            ListItem(
              title: 'StateManagementDemo',
              page: StateManagementDemo(),
            ),
            ListItem(
              title: 'ScopedModelDemo',
              page: ScopedModelDemo(),
            ),
            Divider(),
            Center(
              child: Text('Stream'),
            ),
            ListItem(
              title: 'StreamDemo',
              page: StreamDemo(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtomDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtomDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  child: Text('文字按钮'),
                  onPressed: () {},
                  splashColor: Colors.grey,
                  textColor: Colors.black38,
                  borderSide: BorderSide(
                    color: Colors.black38
                  ),
                  highlightedBorderColor: Colors.grey,
                ),
                SizedBox(
                  height: 10.0,
                  width: 10.0,
                ),
                FlatButton.icon(
                  label: Text('带图标'),
                  icon: Icon(Icons.dashboard),
                  onPressed: () {},
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class PageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageDemo'),
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: (){
//          Navigator.pop(context);
//        },
//        label: Text('17677153715'),
//        icon: Icon(Icons.dialer_sip),
//        backgroundColor: Colors.orange,
//      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
//        label: Text('17677153715'),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}


class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ],
            )
          ],
        ),
      ),
    );
  }
}