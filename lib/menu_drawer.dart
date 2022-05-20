import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';

class Menu extends StatefulWidget {
  final void Function(int) callback;
  const Menu({Key? key, required this.callback}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var txtStyle = const TextStyle(
      fontSize: 22, fontFamily: 'Sora', fontWeight: FontWeight.normal);

  var selectedIndex = 0;

  void setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    ZoomDrawer.of(context)?.toggle();
    widget.callback(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFA4A0C),
        body: Padding(
          padding: EdgeInsets.only(
              left: 25, top: height * 0.13, bottom: height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Lottie.asset(
                      'assets/avatar.json',
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(
                            selectedIndex == 0 ? 0.15 : 0,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(
                        CupertinoIcons.profile_circled,
                        size: 22,
                      ),
                      title: Text('Profile'.toUpperCase(), style: txtStyle),
                      minLeadingWidth: 20,
                      onTap: () => setIndex(0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Divider(
                  //   color: Colors.white.withOpacity(0.4),
                  //   height: 1,
                  // ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(
                            selectedIndex == 1 ? 0.15 : 0,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading:
                          const Icon(CupertinoIcons.shopping_cart, size: 22),
                      title: Text(
                        'Orders'.toUpperCase(),
                        style: txtStyle,
                      ),
                      minLeadingWidth: 20,
                      onTap: () => setIndex(1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Divider(
                  //   color: Colors.white.withOpacity(0.4),
                  //   height: 1,
                  // ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(
                            selectedIndex == 2 ? 0.15 : 0,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(CupertinoIcons.shield, size: 22),
                      title: Text('Security'.toUpperCase(), style: txtStyle),
                      minLeadingWidth: 20,
                      onTap: () => setIndex(2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Divider(
                  //   color: Colors.white.withOpacity(0.4),
                  //   height: 1,
                  // ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(
                            selectedIndex == 3 ? 0.15 : 0,
                          ),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(CupertinoIcons.settings, size: 22),
                      title: Text(
                        'Settings'.toUpperCase(),
                        style: txtStyle,
                      ),
                      minLeadingWidth: 20,
                      onTap: () => setIndex(3),
                    ),
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
