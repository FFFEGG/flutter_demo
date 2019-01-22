import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('步骤'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 2;
                  });
                },
                steps: [
                  Step(
                    title: Text('注册'),
                    subtitle: Text('手机号注册'),
                    content: Text('获取验证码注册手机'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('登录'),
                    subtitle: Text('账号密码登录'),
                    content: Text('账号密码登录'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('跳转首页'),
                    subtitle: Text('显示首页内容'),
                    content: Text('显示首页内容'),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
