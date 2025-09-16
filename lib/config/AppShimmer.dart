import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer {
  static Widget profileInfo() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 80, height: 20, color: Colors.white),
          const SizedBox(height: 8),
          Container(width: 50, height: 16, color: Colors.white),
          const SizedBox(height: 16),
          Container(height: 16, color: Colors.white),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(width: 60, height: 16, color: Colors.white),
              const SizedBox(width: 16),
              Container(width: 40, height: 16, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  static Widget lessonComplete() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 60, height: 16, color: Colors.white),
                const SizedBox(height: 4),
                Container(width: 80, height: 14, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
