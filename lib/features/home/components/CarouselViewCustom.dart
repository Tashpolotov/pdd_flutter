import 'package:flutter/material.dart';

class CarouselViewCustom extends StatelessWidget {
  final List<Widget> items;

  const CarouselViewCustom({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Высота контейнера для карусели
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85), // Оставляем часть соседних элементов видимой
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: PageController(viewportFraction: 0.85),
            builder: (context, child) {
              return Transform.scale(
                scale: 0.85, // Начальный масштаб
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Аналог MarginItemDecoration
                  child: child,
                ),
              );
            },
            child: items[index],
          );
        },
      ),
    );
  }
}
