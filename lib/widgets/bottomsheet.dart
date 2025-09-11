import 'package:capstone/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/widgets/custom_button1.dart'; // Ensure this path is correct

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, //Wraps the content in column
        children: [

          SizedBox(height: 12.h),
          Center(
            child: Container(
              height: 4.0.h,
              width: 110.0.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Grants Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Container for "Category" and GridView
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 'Category' title
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),

                // Grid of buttons using GridView
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 25.0.w,
                  mainAxisSpacing: 20.0.h,
                  childAspectRatio: 4.0,
                  children: [
                    _buildOutlinedButton('Cash Grant'),
                    _buildOutlinedButton('Supply Grant'),
                    _buildOutlinedButton('Karabaw Grant'),
                    _buildOutlinedButton('Fertilizer Grant'),
                    _buildOutlinedButton('Equipment Grant'),
                    _buildOutlinedButton('Fertilizer Grant'), // Note: Duplicate text
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // Apply and Cancel Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                CustomButton1(
                  backgroundColor: AppColors.green350,
                  borderRadius: BorderRadius.circular(10.r),
                  width: 300.w,
                  height: 50.h,
                  text: 'Apply',
                  onPressed: () {},
                ),
                SizedBox(height: 5.h),
                CustomButton1(
                  hasBorder: true,
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildOutlinedButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.green350,
        side: BorderSide(color: AppColors.green350, width: 2.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}