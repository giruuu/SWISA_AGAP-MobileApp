import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/training_and_workshop/training_and_workshop_myevents.dart';
import 'package:flutter/material.dart';
import 'package:capstone/screens/grant_status/button_status.dart'; // The GrantTabBar widget
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/screens/training_and_workshop/training_and_workshop_available.dart';


class TrainingAndWorkshop extends StatefulWidget {
  const TrainingAndWorkshop({super.key});

  @override
  _TrainingAndWorkshopState createState() => _TrainingAndWorkshopState();
}

class _TrainingAndWorkshopState extends State<TrainingAndWorkshop> {
  String _currentStatus = 'Available';

  Widget _buildContent() {
    switch(_currentStatus) {
      case 'Available' :
        return const TrainingAndWorkshopAvailable(); // calls the Available content
      case 'My Events' :
        return const TrainingAndWorkshopMyevents();
      default:
        return const Center(child: Text('No content to display.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the tabs for this specific screen
    final trainingTabs = ['Available', 'My Events'];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // The main app bar that will be pinned to the top.
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              title: Text(

                'Training and Workshop',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryGreen,
                  fontFamily: 'Poppins',
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFFF5F5F5),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: GrantTabBar(
                  tabs: trainingTabs,
                  onTabSelected: (status) {
                    setState(() {
                      _currentStatus = status;
                    });
                  },
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(child: _buildContent()),
            ],
          ),
        ),
      ),
    );
  }
}
