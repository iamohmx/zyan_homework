import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250, // Increased height for better spacing
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.pexels.com/photos/162240/bull-calf-heifer-ko-162240.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 60.0,
        ), // Adjust padding for text
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
              Colors.black.withOpacity(0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.6, 1.0], // Adjusted gradient stops
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Align text to the bottom
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'สวัสดีครับ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 2.0, color: Colors.black54)],
              ),
            ),
            SizedBox(height: 4),
            Text(
              'ขอให้วันนี้เป็นวันที่ดีและมีอากาศแจ่มใส',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                shadows: [Shadow(blurRadius: 2.0, color: Colors.black54)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
