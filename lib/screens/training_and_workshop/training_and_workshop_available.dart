import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/widgets/custom_button1.dart';
import 'package:capstone/screens/training_and_workshop/training_and_workshop_details.dart';


class TrainingAndWorkshopAvailable extends StatelessWidget {
  const TrainingAndWorkshopAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: ListView.builder(
        itemCount: 3, // For Demo, showing 3 cards
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 4,
              child: Column(
                children: [
                  // Image Section
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.r),
                      ),
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
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Workshop',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Wed, Jan 21 2025',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '06:16 PM',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[800],
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 30.h),

                        // the icon for number of attendees and the buttons decline and view.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  color: AppColors.green350,
                                  size: 24.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.grantCardBorder,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 8.w),
                                CustomButton1(
                                  backgroundColor: AppColors.green350,
                                  borderRadius: BorderRadius.circular(5.r),
                                  text: 'View',
                                  width: 115.w,
                                  height: 40.h,
                                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TrainingAndWorkshopDetails(),
                                  ),
                                  );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
