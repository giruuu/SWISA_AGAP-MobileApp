import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Converted to a StatefulWidget to manage the expand/collapse state
class CreditScoreHistoryScreen extends StatefulWidget {
  const CreditScoreHistoryScreen({super.key});

  @override
  State<CreditScoreHistoryScreen> createState() => _CreditScoreHistoryScreenState();
}

class _CreditScoreHistoryScreenState extends State<CreditScoreHistoryScreen> {
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
                    _buildCreditScoreCard(),
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
          IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.primaryGreen, size: 28.sp),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Credit Score',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48), // Balances the IconButton
        ],
      ),
    );
  }

  Widget _buildCreditScoreCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: cardBorder,
        boxShadow: cardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Current Credit Score', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Text.rich(
              TextSpan(
                  text: '70',
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                  children: [
                    TextSpan(
                      text: '/100',
                      style: TextStyle(fontSize: 16.sp, color: AppColors.hintColor, fontWeight: FontWeight.normal),
                    ),
                  ]
              )
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
                    Text('History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    Icon(_isHistoryExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: Colors.grey),
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
    final List<Map<String, dynamic>> history = [
      {'title': 'General Assembly', 'subtitle': '17 Sep 2025 - 11:20 AM', 'amount': '+10 credits', 'color': AppColors.primaryGreen},
      {'title': 'Contribution', 'subtitle': '15 Sep 2025 - 02:45 PM', 'amount': '+5 credits', 'color': AppColors.primaryGreen},
      {'title': 'Late Payment', 'subtitle': '12 Sep 2025 - 05:00 PM', 'amount': '-10 credits', 'color': Colors.red},
      {'title': 'Contribution', 'subtitle': '10 Sep 2025 - 09:15 AM', 'amount': '+5 credits', 'color': AppColors.primaryGreen},
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: Column(
        children: [
          _buildHeaderRow(),
          const Divider(height: 1),
          for (var item in history) ...[
            _buildDataRow(item['title'], item['subtitle'], item['amount'], item['color']),
            if (history.last != item) const Divider(height: 1, indent: 8, endIndent: 8),
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
          Expanded(flex: 4, child: Text('Activity', style: headerStyle)),
          Expanded(flex: 2, child: Text('Credits', style: headerStyle, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  Widget _buildDataRow(String title, String subtitle, String amount, Color amountColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                SizedBox(height: 2.h),
                Text(subtitle, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              amount,
              style: TextStyle(color: amountColor, fontWeight: FontWeight.bold, fontSize: 14.sp),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}