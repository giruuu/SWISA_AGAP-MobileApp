import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/widgets/expandable_details_card.dart';
import 'package:capstone/services/announcement_service.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  final AnnouncementService _service = AnnouncementService();
  late Future<List<Announcement>> _futureAnnouncements;

  @override
  void initState() {
    super.initState();
    _futureAnnouncements = _service.fetchAnnouncements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Announcements',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.green350,
              fontFamily: 'Poppins'),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: FutureBuilder<List<Announcement>>(
        future: _futureAnnouncements,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No announcements found"));
          }

          final announcements = snapshot.data!;
          return ListView.builder(
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              final item = announcements[index];
              return ExpandableCard(
                leadingWidget: Icon(
                  Icons.circle_notifications,
                  color: AppColors.primaryGreen,
                  size: 34.w,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                content: SizedBox(
                  width: double.infinity,
                  child: Text(
                    item.message,
                    style: TextStyle(fontSize: 14.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
