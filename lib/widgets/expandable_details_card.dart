import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';

// A generic, reusable, expandable card widget.
class ExpandableCard extends StatefulWidget {
  final Widget title;
  final Widget content;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.content,
    this.leadingWidget,
    this.trailingWidget,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          ListTile(
            leading: widget.leadingWidget,
            title: widget.title,
            trailing: IconButton(
              icon: Icon(
                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: AppColors.primaryGreen, size: 28.w,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            Divider(
              height: 1.5.h,
              thickness: 1.h,
              color: Colors.grey.shade300,
              indent: 16.w,
              endIndent: 16.w,
            ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: widget.content,
            ),
        ],
      ),
    );
  }
}
