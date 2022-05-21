import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherCardLoading extends StatelessWidget {
  const WeatherCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 10),
                blurRadius: 12,
              )
            ]),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300] as Color,
          highlightColor: Colors.grey[100] as Color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Container(
                        width: 120,
                        height: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 120,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 200,
                        height: 10,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 50,
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              )
            ],
          ),
        ),
      ),
    );
  }
}
