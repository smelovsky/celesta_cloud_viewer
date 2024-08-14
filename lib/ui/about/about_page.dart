import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();

    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      print("initPackageInfo:" + info.toString());
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      return _landscapeView();
    } else {
      return _portraitView();
    }
    /*
    return Padding(
        padding: EdgeInsets.only(top: 40, bottom: 0, left: 10, right: 10),
        child: Column(
          children: [
            Flexible(
              child: Image.asset("assets/images/rhonda.png"),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                    'App version: ${_packageInfo.version} (build ${_packageInfo.buildNumber})')),
            Align(
                alignment: Alignment.center,
                child: Text('Created by Michael Smelovsky')),
            Align(
                alignment: Alignment.center,
                child: Text('(msmelovs@rhonda.ru)')),
          ],
        ));
    */
  }

  Widget _portraitView() {
    return Padding(
        padding: EdgeInsets.only(top: 40, bottom: 0, left: 10, right: 10),
        child: Column(
          children: [
            Flexible(
              child: Image.asset("assets/images/rhonda.png"),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                    'App version: ${_packageInfo.version} (build ${_packageInfo.buildNumber})')),
            Align(
                alignment: Alignment.center,
                child: Text('Created by Michael Smelovsky')),
            Align(
                alignment: Alignment.center,
                child: Text('(msmelovs@rhonda.ru)')),
          ],
        ));
  }

  Widget _landscapeView() {
    return Padding(
        padding: EdgeInsets.only(top: 40, bottom: 0, left: 10, right: 10),
        child: Row(
          children: [
            Flexible(
              child: Image.asset("assets/images/rhonda.png"),
            ),
            Flexible(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                          'App version: ${_packageInfo.version} (build ${_packageInfo.buildNumber})')),
                  Align(
                      alignment: Alignment.center,
                      child: Text('Created by Michael Smelovsky')),
                  Align(
                      alignment: Alignment.center,
                      child: Text('(msmelovs@rhonda.ru)')),
                ],
              ),
            ),
          ],
        ));
  }
}
