import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';

// A reusable dropdown widget for filtering announcements.
class DropDownAnnouncementWidget extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  const DropDownAnnouncementWidget({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<DropDownAnnouncementWidget> createState() => _DropDownAnnouncementWidgetState();
}

class _DropDownAnnouncementWidgetState extends State<DropDownAnnouncementWidget> {
  late String _dropdownValue;
  // Updated filter options to include 'all' and remove 'active' from the list
  final List<String> _filterOptions = ['all', 'today', 'week', 'month'];

  // function to capitalize the first letter in string
  String _capitalize(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.initialValue ?? _filterOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color(0xFFEFE8E5),
        splashColor: AppColors.primaryGreen.withOpacity(0.1),
      ),
      child: DropdownButton<String>(
        value: _dropdownValue,
        icon: const Icon(Icons.more_vert_rounded, size: 42,),
        borderRadius: BorderRadius.circular(16.r),
        // Use selectedItemBuilder to hide the text on the button.
        selectedItemBuilder: (BuildContext context) {
          return _filterOptions.map((String value) {
            // Use a padded Container instead of SizedBox.shrink() to maintain spacing.
            return Container(

              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              child: const SizedBox.shrink(),
            );
          }).toList();
        },
        items: _filterOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              _capitalize(value),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _dropdownValue = newValue;
            });
            widget.onChanged(newValue);
          }
        },
      ),
    );
  }
}
