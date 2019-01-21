import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black38),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[RegisterState()],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'hi~';
    textEditingController.addListener(() {
      debugPrint(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
//      onChanged: (val) {
//        debugPrint('input: $val');
//      },
      controller: textEditingController,
      onSubmitted: (data) {
        debugPrint('onSubmitted: $data');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: '姓名',
        hintText: 'dsa',
//          border: InputBorder.none
        border: OutlineInputBorder(),
        filled: true,
//        fillColor: Colors.yellow
      ),
    );
  }
}

class RegisterState extends StatefulWidget {
  @override
  _RegisterStateState createState() => _RegisterStateState();
}

class _RegisterStateState extends State<RegisterState> {
  final formKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint('username: $username');
      debugPrint('password: $password');
      
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('正在注册中...'),)
      );

      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('注册成功...'))
      );
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatorUsername(data) {
    if (data.isEmpty) {
      return '用户名不能为空.';
    }

    return null;
  }

  String validatorPassword(data) {
    if (data.toString().length < 6) {
      return '密码最短6位.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'UserName', helperText: ''),
            onSaved: (data) {
              username = data;
            },
            validator: validatorUsername,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'PassWord', helperText: ''),
            onSaved: (data) {
              password = data;
            },
            validator: validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                submit();
              },
              elevation: 0.0,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
