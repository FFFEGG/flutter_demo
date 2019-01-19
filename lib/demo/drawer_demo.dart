import 'package:flutter/material.dart';


class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
//                DrawerHeader(
//                  child: Text('header'.toUpperCase()),
//                  decoration: BoxDecoration(
//                    color: Colors.grey[100]
//                  ),
//                ),
          UserAccountsDrawerHeader(
            accountName: Text('FiveEggs'),
            accountEmail: Text('406811064@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('http://b387.photo.store.qq.com/psb?/f6bff9ce-0df3-4d44-a09d-3e50db4e9be2/gUjyUFyLdOldS0AYhpa3V9xF9ot4QbRxA7XTApnfvi8!/b/dBKyruYMMAAA&bo=wAOAAgAAAAABB2E!&rf=viewer_4'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[300],
                image: DecorationImage(
                    image: NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.pink[300].withOpacity(0.5),
                        BlendMode.hardLight
                    )
                )
            ),
          ),
          ListTile(
            title: Text('了解会员特权',textAlign: TextAlign.left),
            leading: Icon(Icons.insert_emoticon,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的钱包',textAlign: TextAlign.left),
            leading: Icon(Icons.account_balance_wallet,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('个性装扮',textAlign: TextAlign.left),
            leading: Icon(Icons.blur_circular,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的收藏',textAlign: TextAlign.left),
            leading: Icon(Icons.collections,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的相册',textAlign: TextAlign.left),
            leading: Icon(Icons.image,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('我的文件',textAlign: TextAlign.left),
            leading: Icon(Icons.assignment_ind,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('免流量特权',textAlign: TextAlign.left),
            leading: Icon(Icons.cloud_done,size: 22.0,color: Colors.black87,),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
