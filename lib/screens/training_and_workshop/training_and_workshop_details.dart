import 'package:capstone/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/widgets/custom_button1.dart';

class TrainingAndWorkshopDetails extends StatelessWidget {
  const TrainingAndWorkshopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        title: Text(
          'Confirm Attendance',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // The image at the top
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'Image Here',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text('Title of Workshop', textAlign: TextAlign.center,
            style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16.sp,
            ),
            ),

            // Details section
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        '006:16 PM',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Wed, Dec 21',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Sample Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.person_rounded, color: AppColors.primaryGreen),
                      SizedBox(width: 6.w),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryGreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Lorem ipsum dolor sit amet, si pay tabi may pa training sa maabot na sabado mag laog tabi para maaukod',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h,),
            Column(
              children: [
                CustomButton1(
                    backgroundColor: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(5.r),
                    width: 300.w,
                    height: 50.h,
                    text: 'Attend', onPressed:(){}),
                SizedBox(height: 5.h,),
                TextButton(onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      )
                    ),
                    child:

                Text('Cancel'))
              ],
            )
          ],

        ),
      ),
    );
  }
}
