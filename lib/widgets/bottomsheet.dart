import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Center(
        child: Column(
          children: [
            // The handle or line at the top
            const SizedBox(height: 12),
            Container(
              height: 5.0.h,
              width: 90.0.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16), // Add space below the handle

            // Your existing content
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Grants Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            const Text('Filter Option 1'),
            const Text('Filter Option 2'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}