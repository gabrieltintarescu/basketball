import 'package:basketball/models/menu_item.dart';
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
  var selectedIndex = 0;

  void setIndex(int index) {
    if (index == selectedIndex) return;
    setState(() {
      selectedIndex = index;
    });
    ZoomDrawer.of(context)?.toggle();
    widget.callback(selectedIndex);
  }

  var menuItems = [
    DrawerMenuItem(icon: CupertinoIcons.home, title: 'Acasă'),
    DrawerMenuItem(icon: CupertinoIcons.person, title: 'Profil'),
    DrawerMenuItem(icon: CupertinoIcons.chat_bubble, title: 'Mesaje'),
    DrawerMenuItem(icon: CupertinoIcons.settings, title: 'Setări'),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: const Color(0xFFDC5D1D),
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFDC5D1D).withOpacity(1),
                            blurRadius: 10,
                            offset: const Offset(5, 5),
                          ),
                        ]),
                    child: Lottie.asset(
                      'assets/avatar.json',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                      itemCount: menuItems.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MenuItemNeumorphism(
                          icon: Icon(
                            menuItems[index].icon,
                            size: 22,
                            color: Colors.white,
                          ),
                          index: index,
                          title: menuItems[index].title,
                          callback: setIndex,
                          isSelected: selectedIndex == index ? true : false,
                        );
                      }),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Deconectare',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Icon(CupertinoIcons.arrow_right),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemNeumorphism extends StatelessWidget {
  final bool isSelected;
  final void Function(int x) callback;
  final int index;
  final Widget icon;
  final String title;
  MenuItemNeumorphism(
      {Key? key,
      required this.isSelected,
      required this.callback,
      required this.index,
      required this.icon,
      required this.title})
      : super(key: key);

  var txtStyle = const TextStyle(
      fontSize: 17,
      fontFamily: 'Sora',
      fontWeight: FontWeight.normal,
      color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFFDC5D1D),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color(0xFFb05417).withOpacity(isSelected ? 1 : 0),
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
                BoxShadow(
                  color:
                      const Color(0xFFe3874a).withOpacity(isSelected ? 1 : 0),
                  blurRadius: 10,
                  offset: const Offset(-5, -5),
                ),
              ],
            ),
            child: Row(children: [
              icon,
              const SizedBox(width: 7),
              Text(
                title,
                style: txtStyle,
              )
            ]),
          ),
          onPressed: () => callback(index),
        ),
      ],
    );
  }
}



// ListTile(
//             leading: icon,
//             title: Text(
//               title,
//               style: txtStyle,
//             ),
//             minLeadingWidth: 20,
//             onTap: callback(index),
//           ),
