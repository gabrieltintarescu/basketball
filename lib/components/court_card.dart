import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourtCard extends StatelessWidget {
  final String imagePath, name, description;
  final int rating, index;
  final bool isSelected, isDisabled;
  final void Function(int x) selectCourtHandle;

  const CourtCard(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.description,
      required this.rating,
      required this.isSelected,
      required this.selectCourtHandle,
      required this.index,
      required this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isDisabled ? null : (() => selectCourtHandle(index)),
      padding: EdgeInsets.zero,
      child: SizedBox(
        // color: Colors.amber,
        width: 205,
        height: 250,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 0, bottom: 20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.only(left: 15, right: 20, bottom: 20),
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                      border: isSelected
                          ? Border.all(
                              color: const Color(0xFFDC691D), width: 1.5)
                          : null,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10),
                          blurRadius: 12,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 65),
                      FittedBox(
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(child: Container()),
                      isDisabled
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBarIndicator(
                                  rating: rating.toDouble(),
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Color(0xFFDC691D),
                                  ),
                                  itemCount: 5,
                                  itemSize: 15,
                                  direction: Axis.horizontal,
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -30,
              top: 15,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  imagePath,
                  width: 200,
                  height: 100,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
