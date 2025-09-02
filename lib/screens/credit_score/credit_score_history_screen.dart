import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class CreditScoreHistoryScreen extends StatelessWidget {
  const CreditScoreHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive AppBar elements
    double appBarUsernameFontSize = screenWidth * 0.035;
    if (appBarUsernameFontSize > 14) appBarUsernameFontSize = 14;
    if (appBarUsernameFontSize < 10) appBarUsernameFontSize = 10;

    double appBarAvatarRadius = screenWidth * 0.045;
    if (appBarAvatarRadius > 20) appBarAvatarRadius = 20;
    if (appBarAvatarRadius < 16) appBarAvatarRadius = 16;

    double appBarIconSize = appBarAvatarRadius * 0.9;
    double appBarSpacing = screenWidth * 0.02;

    // Responsive body padding
    double horizontalPadding = screenWidth * 0.04; // 4% of screen width

    // Responsive title font size
    double titleFontSize = screenWidth * 0.06;
    if (titleFontSize > 26) titleFontSize = 26; // Max size
    if (titleFontSize < 20) titleFontSize = 20; // Min size

    // Responsive vertical spacing
    double spacingSmall = screenHeight * 0.02; // ~16
    double spacingMedium = screenHeight * 0.03; // ~24

    // Responsive Credit Score Card elements
    double cardBorderRadius = screenWidth * 0.03; // ~12
    double cardPadding = screenWidth * 0.04; // ~16
    double scoreLabelFontSize = screenWidth * 0.04; // ~16
    if (scoreLabelFontSize > 18) scoreLabelFontSize = 18;
    if (scoreLabelFontSize < 14) scoreLabelFontSize = 14;

    double scoreValueFontSize = screenWidth * 0.05; // ~20
    if (scoreValueFontSize > 22) scoreValueFontSize = 22;
    if (scoreValueFontSize < 18) scoreValueFontSize = 18;

    double scoreUnitFontSize = screenWidth * 0.035; // ~14
    if (scoreUnitFontSize > 16) scoreUnitFontSize = 16;
    if (scoreUnitFontSize < 12) scoreUnitFontSize = 12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SwisaAGAP'), // Consider making this responsive if needed
        actions: [
          Row(
            children: [
              Text('Username', style: TextStyle(color: AppColors.textColor, fontSize: appBarUsernameFontSize)),
              SizedBox(width: appBarSpacing),
              IconButton(
                icon: CircleAvatar(
                  radius: appBarAvatarRadius,
                  backgroundColor: AppColors.primaryGreen,
                  child: Icon(Icons.person, color: Colors.white, size: appBarIconSize),
                ),
                onPressed: () {
                  // TODO: Navigate to profile or handle action
                },
              ),
              SizedBox(width: screenWidth * 0.02), // Right padding for the action items
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: spacingSmall),
            Text('Credit Score History', style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold)),
            SizedBox(height: spacingSmall),
            Card(
                color: AppColors.lightGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardBorderRadius),
                    side: BorderSide(color: AppColors.primaryGreen.withOpacity(0.5))
                ),
                child: Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Credit Score', style: TextStyle(fontSize: scoreLabelFontSize, fontWeight: FontWeight.bold)),
                      Text.rich(
                          TextSpan(
                              text: '70',
                              style: TextStyle(fontSize: scoreValueFontSize, fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                              children: [
                                TextSpan(
                                  text: '/100',
                                  style: TextStyle(fontSize: scoreUnitFontSize, color: AppColors.hintColor),
                                ),
                              ]
                          )
                      )
                    ],
                  ),
                )
            ),
            SizedBox(height: spacingMedium),
            Expanded(
                child: ListView(
                  children: [
                    _buildHistoryItem(context, 'General Assembly', '17 Sep 2025 - 11:20 AM', '-10 credits', Colors.red),
                    _buildHistoryItem(context, 'General Assembly', '17 Sep 2025 - 11:20 AM', '-10 credits', Colors.red),
                    _buildHistoryItem(context, 'General Assembly', '17 Sep 2025 - 11:20 AM', '-10 credits', Colors.red),
                    // Add more history items here
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, String title, String subtitle, String amount, Color amountColor) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive history item elements
    double itemCardMarginBottom = screenWidth * 0.03; // ~12
    double itemCardBorderRadius = screenWidth * 0.02; // ~8
    double itemIconSize = screenWidth * 0.06; // ~24
    if (itemIconSize > 28) itemIconSize = 28;
    if (itemIconSize < 20) itemIconSize = 20;

    double itemTitleFontSize = screenWidth * 0.038; // ~15-16
    if (itemTitleFontSize > 16) itemTitleFontSize = 16;
    if (itemTitleFontSize < 13) itemTitleFontSize = 13;

    double itemSubtitleFontSize = screenWidth * 0.033; // ~13-14
    if (itemSubtitleFontSize > 14) itemSubtitleFontSize = 14;
    if (itemSubtitleFontSize < 11) itemSubtitleFontSize = 11;
    
    double itemAmountFontSize = screenWidth * 0.035; // ~14
    if (itemAmountFontSize > 15) itemAmountFontSize = 15;
    if (itemAmountFontSize < 12) itemAmountFontSize = 12;


    return Card(
      margin: EdgeInsets.only(bottom: itemCardMarginBottom),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(itemCardBorderRadius)),
      elevation: 1,
      child: ListTile(
        leading: Icon(Icons.groups, color: AppColors.primaryGreen, size: itemIconSize),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: itemTitleFontSize)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: itemSubtitleFontSize)),
        trailing: Text(amount, style: TextStyle(color: amountColor, fontWeight: FontWeight.bold, fontSize: itemAmountFontSize)),
      ),
    );
  }
}
