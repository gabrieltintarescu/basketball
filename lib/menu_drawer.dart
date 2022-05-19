import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  var txtStyle = const TextStyle(
      fontSize: 22, fontFamily: 'Montserrat', fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFA4A0C),
        body: Padding(
          padding: EdgeInsets.only(
              left: 25, top: height * 0.15, bottom: height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ListTile(
                    leading:
                        const Icon(CupertinoIcons.profile_circled, size: 25),
                    title: Text('Profile', style: txtStyle),
                    minLeadingWidth: 20,
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.white.withOpacity(0.4),
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(CupertinoIcons.shopping_cart, size: 25),
                    title: Text(
                      'Orders',
                      style: txtStyle,
                    ),
                    minLeadingWidth: 20,
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.white.withOpacity(0.4),
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(CupertinoIcons.shield, size: 25),
                    title: Text(
                      'Security',
                      style: txtStyle,
                    ),
                    minLeadingWidth: 20,
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.white.withOpacity(0.4),
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(CupertinoIcons.settings, size: 25),
                    title: Text(
                      'Settings',
                      style: txtStyle,
                    ),
                    minLeadingWidth: 20,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Sign-out',
                        style: txtStyle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Icon(CupertinoIcons.arrow_right),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
