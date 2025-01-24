import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const GradientAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          height: 80.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff5F6F65),
                Color(0xff021526),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Gradient AppBar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.search, color: Colors.white)),
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
