import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.green350, fontFamily: 'Poppins')),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/map_sample.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),] // If you want sharp corners, or adjust as needed
                ),
                child: const Center(
                  child: Text(
                    'MAP PLACEHOLDER', // You might want to remove this text as it's now an image
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Adjust text style if keeping
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2, blurRadius: 4, offset: const Offset(0, 4),
                    ),
                    ]
                ),
                child: Padding( padding:  EdgeInsets.all(20.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      _buildInfoRow(
                        Icons.location_on_outlined,
                        'Location',
                        'Sorsogon, Swisa Branch Office Building,',
                        onPressed: () {
                          // must link to map
                        },
                      ),
                      SizedBox(height: 25.h,),
                      _buildInfoRow(
                        Icons.email_outlined,
                        'Email',
                        'SwisaSorgon@yahooo.com',
                        onPressed: () {
                         // must link to gmail or something
                        },
                      ),
                      SizedBox(height: 20.h,),
                      _buildInfoRow(
                        Icons.local_phone_outlined,
                        'Phone',
                        '0912345678',
                        onPressed: () {
                          // must link to phone
                        },
                      ),
                      SizedBox(height: 20.h,),
                      _buildInfoRow(
                        Icons.thumb_up_alt_outlined,
                        'Social Media Accounts',
                        'SWISA FB, SWISA Twitter,       Reddit/SWISSA',
                        onPressed: () {
                          // must link to a social page
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String subtitle, { VoidCallback? onPressed }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
      ),
      child: Row(

        children: [
          Icon(icon, color: AppColors.green350, size: 32,),
          SizedBox(width: 15.w),
          Expanded (child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,

                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
