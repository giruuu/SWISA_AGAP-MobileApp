import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Correctly import the widget from its separate file.
import 'package:capstone/screens/announcement/announcement_filter.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/widgets/expandable_details_card.dart';


// A data model for Announcement items.
class AnnouncementItem {
  final String announcementsTitle;
  final String announcementsDetails;
  final DateTime date; // Added a date property for filtering

  AnnouncementItem({
    required this.announcementsTitle,
    required this.announcementsDetails,
    required this.date,
  });
}

class AnnouncementCard extends StatelessWidget {
  final AnnouncementItem item;

  const AnnouncementCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      leadingWidget: Icon(
        Icons.circle_notifications,
        color: AppColors.primaryGreen,
        size: 34.w,
      ),
      title: Text(
        item.announcementsTitle,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
      content: SizedBox(
        width: double.infinity,
        child: Text(
          item.announcementsDetails,
          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

// The page widget, now a StatefulWidget to manage the filter state.
class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  // Set the default filter to 'all' to align with the DropDownAnnouncementWidget.
  String _currentFilter = 'all';

  // function to capitalize the first letter in string
  String _capitalize(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  // Sample announcement data with dates for filtering.
  final List<AnnouncementItem> allAnnouncements = [
    AnnouncementItem(
      announcementsTitle: 'Announcement Title',
      announcementsDetails: 'WHAT: Meeting sa office',
      date: DateTime.now(),
    ),
    AnnouncementItem(
      announcementsTitle: 'Pwede na mag claim',
      announcementsDetails: 'yes ito ay announcement aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      date: DateTime.now().subtract(const Duration(days: 10)),
    ),
    AnnouncementItem(
      announcementsTitle: 'Old News',
      announcementsDetails: 'This announcement is from last month.',
      date: DateTime.now().subtract(const Duration(days: 40)),
    ),
  ];

  // A getter to return the filtered list of announcements.
  List<AnnouncementItem> get _filteredAnnouncements {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastWeek = today.subtract(const Duration(days: 7));
    final lastMonth = today.subtract(const Duration(days: 30));

    switch (_currentFilter) {
    // New case for 'all' that returns the entire list
      case 'all':
        return allAnnouncements;
      case 'today':
        return allAnnouncements.where((item) => item.date.isAfter(today)).toList();
      case 'week':
        return allAnnouncements.where((item) => item.date.isAfter(lastWeek)).toList();
      case 'month':
        return allAnnouncements.where((item) => item.date.isAfter(lastMonth)).toList();
      case 'active':
      // This is a placeholder for your 'active' logic.
      // You would likely pass an ID here from another page to find the specific item.
        return allAnnouncements.where((item) => item.announcementsTitle == 'Announcement Title').toList();
      default:
        return allAnnouncements;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.green350, fontFamily: 'Poppins')),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        centerTitle: true,
        actions: [

          DropDownAnnouncementWidget(
            initialValue: _currentFilter,
            onChanged: (newFilter) {
              setState(() {
                _currentFilter = newFilter!;
              });
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                _capitalize(_currentFilter),
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey, fontFamily: 'Poppins'
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Display the filtered list of announcements
            ..._filteredAnnouncements.map((item) => AnnouncementCard(item: item)).toList(),
          ],
        ),
      ),
    );
  }
}
