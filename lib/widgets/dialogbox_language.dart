import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

// This is the State class that manages the selected language.
class _LanguageDialogState extends State<LanguageDialog> {
  // A variable to hold the currently selected language.
  // Initialize with a default value.
  String? _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.r),
      ),
      title:  Text('Select Language', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'Poppins',),),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            RadioListTile<String>(
              activeColor: AppColors.green350,
              title: Text('English', style: TextStyle(fontSize: 15.sp),),
              value: 'English',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                // Update the state when a new language is selected
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),

            RadioListTile<String>(
              activeColor: AppColors.green350,
              title: Text('Tagalog', style: TextStyle(fontSize: 15.sp),),
              value: 'Tagalog',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),

            RadioListTile<String>(
              activeColor: AppColors.green350,
              title:  Text('Bisaya', style: TextStyle(fontSize: 15.sp),),
              value: 'Bisaya',
              groupValue: _selectedLanguage,
              onChanged: (String? value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        // The "Cancel" button to close the dialog
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: TextStyle(fontSize: 14.sp,color: Colors.black),),
        ),
       SizedBox(width: 8.w,),
        ElevatedButton(
          onPressed: () {
            // Pop the dialog and return the selected language
            Navigator.of(context).pop(_selectedLanguage);
          }, style: ElevatedButton.styleFrom(backgroundColor: AppColors.green350,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.r),)
        ),
          child:  Text('Save',  style: TextStyle(fontSize: 14.sp,color: Colors.white),
          ),

        ),
    ]
        ),
      ],
    );
  }
}
