import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:random_qoutes/constants.dart';
class HomeItemWidget extends StatelessWidget {
  final String title;
  final String picture;
  final VoidCallback onPressed;
  const HomeItemWidget({
    required this. title,
    required this.picture,
    required this. onPressed,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,
      child: Container(
        height: 200,
        width: 200,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),

          ),
          color: Colors.amber.shade400,
        ),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[
            SvgPicture.asset(
              picture,
              height: 60,
              width: 60,
            ),
            Text(
              title,
              style: kTextStyleLarge,
            )
          ],
        ),
      ),
    );
  }
}