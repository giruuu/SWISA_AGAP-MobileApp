import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContributionsScreen extends StatefulWidget {
  const ContributionsScreen({super.key});

  @override
  State<ContributionsScreen> createState() => _ContributionsScreenState();
}

class _ContributionsScreenState extends State<ContributionsScreen> {
  bool _isHistoryExpanded = true;

  // Consistent shadow style from Contributions screen
  List<BoxShadow> get cardShadow {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 20,
        offset: const Offset(0, 5),
      ),
    ];
  }

  // Consistent border style from Contributions screen
  Border get cardBorder {
    return Border.all(color: AppColors.primaryGreen.withOpacity(0.7), width: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    _buildContributionRatingCard(),
                    SizedBox(height: 20.h),
                    _buildContributionHistory(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 16.h, 20.w, 8.h),
      child: Row(
        children: [
          // --- BACK BUTTON UPDATED ---
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen, size: 24.sp),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Contributions',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(width: 48), // Balances the IconButton
        ],
      ),
    );
  }

  Widget _buildContributionRatingCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: cardBorder,
        boxShadow: cardShadow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CONTRIBUTION RATING', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: AppColors.textColor)),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text('GREAT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.sp)),
                  )
                ],
              ),
              SizedBox(
                width: 75.w,
                height: 75.w,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/swisa-logo-circle.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('10', style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold, color: AppColors.primaryGreen, height: 1.0)),
                  Text('TIMES CONTRIBUTED', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('AJ. MARQUEZ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  Text('2025', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                  SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text('MEMBER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContributionHistory() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: cardBorder,
        boxShadow: cardShadow,
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isHistoryExpanded = !_isHistoryExpanded;
                });
              },
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Contribution History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
                    Row(
                      children: [
                        Text('Jan - March, 2025', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                        Icon(_isHistoryExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildHistoryTable(),
            crossFadeState: _isHistoryExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }

  Widget _buildHistoryTable() {
    // Dummy data
    final List<Map<String, String>> contributions = [
      {'type': 'Cash', 'quantity': '₱100', 'date': '08/10/2025'},
      {'type': 'Crop', 'quantity': '10kg', 'date': '08/05/2025'},
      {'type': 'Cash', 'quantity': '₱50', 'date': '07/28/2025'},
      {'type': 'Cash', 'quantity': '₱150', 'date': '07/15/2025'},
      {'type': 'Crop', 'quantity': '25kg', 'date': '07/11/2025'},
      {'type': 'Crop', 'quantity': '5kg', 'date': '06/20/2025'},
      {'type': 'Cash', 'quantity': '₱200', 'date': '06/18/2025'},
      {'type': 'Crop', 'quantity': '12kg', 'date': '06/02/2025'},
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: Column(
        children: [
          _buildHeaderRow(),
          const Divider(height: 1),
          for (var item in contributions) ...[
            _buildDataRow(item),
            if (contributions.last != item) const Divider(height: 1, indent: 8, endIndent: 8),
          ],
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    final headerStyle = TextStyle(color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.bold);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Type', style: headerStyle)),
          Expanded(flex: 2, child: Text('Quantity', style: headerStyle)),
          Expanded(flex: 3, child: Text('Date', style: headerStyle)),
          Expanded(flex: 2, child: Text('Receipt', style: headerStyle, textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget _buildDataRow(Map<String, String> data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(data['type']!)),
          Expanded(flex: 2, child: Text(data['quantity']!)),
          Expanded(flex: 3, child: Text(data['date']!)),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () { /* TODO: View Receipt Logic */ },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.visibility, color: AppColors.primaryGreen, size: 16.sp),
                  SizedBox(width: 4.w),
                  Flexible(
                    child: Text(
                      'View',
                      style: TextStyle(color: AppColors.primaryGreen, fontSize: 12.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}