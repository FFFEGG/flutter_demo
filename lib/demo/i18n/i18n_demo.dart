import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/i18n/i18n_localization_demo.dart';

class i18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('i18nDemo'),
      ),
      body: i18nHome(),
    );
  }
}

class i18nHome extends StatefulWidget {
  @override
  _i18nHomeState createState() => _i18nHomeState();
}

class _i18nHomeState extends State<i18nHome> {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              Localizations.of(context, LocalizationDemo).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
