import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
          transitionDuration: Duration(milliseconds: 800),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Slide animation from right to left
            final slideAnimation = Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            );

            // Fade animation
            final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            );

            // Zoom animation
            final zoomAnimation = Tween<double>(
              begin: 0.9,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            );

            return SlideTransition(
              position: slideAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: zoomAnimation,
                  child: child,
                ),
              ),
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );
}
