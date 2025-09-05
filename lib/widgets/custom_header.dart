import 'package:capstone/widgets/dialogbox_language.dart';
import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/profile/profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/widgets/diaglogbox_changepass.dart';
import 'package:capstone/screens/menu_dropdown/menu_faq.dart';
import 'package:capstone/screens/menu_dropdown/contact_us.dart';
import 'package:capstone/screens/announcement/announcement.dart';
import 'package:capstone/screens/messages/messages_screen.dart'; // <-- Import the new screen

// 1. Add 'messages' to the enum
enum MenuItem {
  profile,
  language,
  changePassword,
  faq,
  contactUs,
  announcements,
  messages, // <-- New item
  logout,
}

class CustomHeader extends StatelessWidget {
  final bool isProfileButtonActive;

  const CustomHeader({
    super.key,
    this.isProfileButtonActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/swisa-agap4.png',
          height: 40,
        ),
        const Spacer(),
        const SizedBox(width: 8),
        PopupMenuButton<MenuItem>(
          color: Colors.white,
          onSelected: (MenuItem item) {
            switch (item) {
              case MenuItem.profile:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
                break;
              case MenuItem.language:
                _openLanguageDialog(context);
                break;
              case MenuItem.changePassword:
                _openChangePassDialog(context);
                break;
              case MenuItem.faq:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MenuFAQPage()),
                );
                break;
              case MenuItem.contactUs:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContactUsPage()),
                );
                break;
              case MenuItem.announcements:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AnnouncementPage()),
                );
                break;
            // --- ADDED NAVIGATION FOR MESSAGES ---
              case MenuItem.messages:
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MessagesScreen()),
                );
                break;
              case MenuItem.logout:
              // Handle logout
                break;
            }
          },
          child: Icon(Icons.menu_rounded, color: AppColors.primaryGreen, size: 32),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
            PopupMenuItem<MenuItem>(
              value: MenuItem.profile,
              child: Row( children: [ Icon(Icons.person_outline,  color: AppColors.primaryGreen,size: 25.sp,), SizedBox(width: 8.w,), Expanded(child:  Text('View Profile', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black, overflow: TextOverflow.ellipsis,),))]),
            ),
            PopupMenuItem<MenuItem>(
              value: MenuItem.language,
              child: Row( children: [ Icon(Icons.language_outlined,  color: AppColors.primaryGreen,size: 25.sp,), SizedBox(width: 8.w,), Text('Language', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black,),)]),
            ),
            // --- NEW MENU ITEM FOR MESSAGES ---
            PopupMenuItem<MenuItem>(
              value: MenuItem.messages,
              child: Row( children: [ Icon(Icons.message_outlined,  color: AppColors.primaryGreen,size: 25.sp,), SizedBox(width: 8.w,), Text('Messages', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black,),)]),
            ),
            PopupMenuItem<MenuItem>(
              value: MenuItem.changePassword,
              child: Row( children: [ Icon(Icons.lock_outline,  color: AppColors.primaryGreen, size: 25.sp,), SizedBox(width: 8.w,), Expanded(child:  Text('Change Password', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black, overflow: TextOverflow.ellipsis,),))]),
            ),
            PopupMenuItem<MenuItem>(
              value: MenuItem.faq,
              child: Row( children: [ Icon(Icons.contact_support_outlined,  color: AppColors.primaryGreen,size: 25.sp,), SizedBox(width: 8.w,), Text('FAQ', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black,),)]),
            ),
            PopupMenuItem<MenuItem>(
              value: MenuItem.contactUs,
              child: Row( children: [ Icon(Icons.perm_phone_msg_outlined,  color: AppColors.primaryGreen,size: 25.sp,), SizedBox(width: 8.w,), Text('Contact Us', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black,),)]),
            ),
            PopupMenuItem<MenuItem>(
              value: MenuItem.announcements,
              child: Row( children: [ Icon(Icons.notifications_outlined,  color: AppColors.primaryGreen,size: 25.sp,), SizedBox(width: 8.w,), Text('Announcements', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.black,),)]),
            ),
            const PopupMenuDivider(), // Optional: Adds a line to separate logout
            PopupMenuItem<MenuItem>(
              value: MenuItem.logout,
              child: Row( children: [ Icon(Icons.logout,  color: Colors.redAccent,size: 25.sp,), SizedBox(width: 8.w,), Text('Logout', style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600, color: Colors.redAccent,),)]),
            ),
          ],
        ),
      ],
    );
  }

  void _openLanguageDialog(BuildContext context) {
    showDialog(context: context,
        builder:(BuildContext context) {
          return const LanguageDialog();
        }
    );
  }

  void _openChangePassDialog(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context){
      return const ChangePassDialog();
    }
    );
  }
}