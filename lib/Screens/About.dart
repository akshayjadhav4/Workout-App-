import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                    color: Colors.black,

                      shape: BoxShape.rectangle,
                      image:DecorationImage(fit:BoxFit.fill,image: AssetImage('assets/akshay.png'))
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Text(
                    'AKSHAY JADHAV',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Application & Web Dev.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    'Maharashtra',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                  RaisedButton(onPressed: (){
                    _launchUniversalLinkIos('https://youtu.be/VFrKjhcTAzE');
                  },child: Text('Client Requirement Video.'),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
