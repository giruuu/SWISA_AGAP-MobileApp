import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/widgets/custom_button1.dart';
import 'package:capstone/screens/training_and_workshop/event_model.dart';

class TrainingAndWorkshopMyevents extends StatelessWidget {
  const TrainingAndWorkshopMyevents({super.key});

  @override
  Widget build(BuildContext context) {
    // Hard-coded list of events to demonstrate different states.
    final List<Event> myEvents = [
      const Event(
        title: 'Workshop',
        date: 'Wed, Jan 21 2025',
        time: '06:16 PM',
        attendees: 100,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
        status: EventStatus.upcoming, // This event is upcoming
      ),
      const Event(
        title: 'Seminar',
        date: 'Thu, Jan 22 2025',
        time: '02:00 PM',
        attendees: 50,
        description: 'This one is no longer cancellable because the event is near.',
        status: EventStatus.cannotCancel, // This event cannot be cancelled
      ),
      const Event(
        title: 'Canon Event',
        date: 'Tue, Jan 20 2025',
        time: '10:00 AM',
        attendees: 75,
        description: 'This event has already happened.',
        status: EventStatus.attended, // This event has already happened
      ),
    ];

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: ListView.builder(
        itemCount: myEvents.length,
        itemBuilder: (context, index) {
          final event = myEvents[index];

          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 4,
              child: Column(
                children: [
                  // Image Section
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Image Here',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              event.title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  event.date,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  event.time,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          event.description,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[800],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 30.h),
                        // The button logic based on event status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  color: AppColors.green350,
                                  size: 24.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '${event.attendees}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.grantCardBorder,
                                  ),
                                ),
                              ],
                            ),
                            // Conditional rendering based on the event's status
                            if (event.status == EventStatus.upcoming)
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins'
                                      )
                                    ),
                                    child: Text('Cancel'),
                                  ),
                                  SizedBox(width: 8.w),
                                  CustomButton1(
                                    hasBorder: true,
                                    text: 'View',
                                    width: 115.w,
                                    height: 40.h,
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            else if (event.status == EventStatus.attended)
                              CustomButton1(
                                backgroundColor: Colors.grey,

                                text: 'Attended',
                                width: 115.w,
                                height: 40.h,
                                onPressed: () {},
                              )
                            else if (event.status == EventStatus.cannotCancel)
                                CustomButton1(
                                hasBorder: true,
                                  text: 'View',
                                  width: 115.w,
                                  height: 40.h,
                                  onPressed: () {},
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
