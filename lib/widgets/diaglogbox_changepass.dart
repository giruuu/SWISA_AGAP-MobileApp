import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';

class ChangePassDialog extends StatefulWidget {
  const ChangePassDialog({super.key});

  @override
  State<ChangePassDialog> createState() => _ChangePassDialogState();
}

class _ChangePassDialogState extends State<ChangePassDialog> {
  // Separate state variables for each password field's visibility
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
      title: Text(
        'Change Password',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'Poppins',),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Current Password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Password',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.hintColor),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    obscureText: !_isCurrentPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isCurrentPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: AppColors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(color: AppColors.grantCardBorder, width: 2.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            // New Password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Password',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.hintColor),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    obscureText: !_isNewPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: AppColors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(color: AppColors.grantCardBorder, width: 2.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),

            // Confirm Password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.hintColor),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: AppColors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(color: AppColors.grantCardBorder, width: 2.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The "Cancel" button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              ),
            ),
            SizedBox(width: 8.w),
            // The "Save" button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green350,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Text(
                'Save',
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
