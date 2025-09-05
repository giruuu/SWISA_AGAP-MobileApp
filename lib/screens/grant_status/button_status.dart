import 'package:capstone/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GrantTabBar extends StatefulWidget {
  final void Function(String status) onTabSelected;
  final List<String> tabs;

  const GrantTabBar({Key? key, required this.onTabSelected, required this.tabs})
      : super(key: key);

  @override
  _GrantTabBarState createState() => _GrantTabBarState();
}

class _GrantTabBarState extends State<GrantTabBar> {
  // Use the first item from the list as the initial selected status
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.tabs.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: widget.tabs.map((title) => _buildTabButton(title)).toList(),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title) {
    final isSelected = selectedStatus == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = title;
          });
          widget.onTabSelected(title);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryMaterialColor[350] : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.hintColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}