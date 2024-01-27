import 'package:citefest/constants/colors.dart';
import 'package:flutter/material.dart';

class RouteButton extends StatefulWidget {
  final String routeName;
  final String filePath;
  final VoidCallback routeCallback;
  final int currentIndex;
  final int routeIndex;

  const RouteButton({
    super.key,
    required this.routeName,
    required this.filePath,
    required this.routeCallback,
    required this.currentIndex,
    required this.routeIndex,
  });

  @override
  State<RouteButton> createState() => _RouteButtonState();
}

class _RouteButtonState extends State<RouteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 60),
      child: GestureDetector(
        onTap: widget.routeCallback,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.filePath,
              height: 25,
              width: 25,
              color: widget.currentIndex == widget.routeIndex
                  ? ColorPalette.primary
                  : const Color(0xff585858),
            ),
            const SizedBox(height: 2.5),
            Text(
              widget.routeName,
              style: TextStyle(
                color: widget.currentIndex == widget.routeIndex
                    ? ColorPalette.primary
                    : const Color(0xff585858),
                fontWeight: FontWeight.w300,
                fontFamily: "Montserrat",
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
