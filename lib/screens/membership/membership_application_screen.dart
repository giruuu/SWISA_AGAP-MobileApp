import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/widgets/custom_button.dart';
import 'package:capstone/widgets/custom_header.dart';
import 'package:capstone/widgets/custom_textfield.dart';

class MembershipApplicationScreen extends StatefulWidget {
  const MembershipApplicationScreen({super.key});

  @override
  State<MembershipApplicationScreen> createState() => _MembershipApplicationScreenState();
}

class _MembershipApplicationScreenState extends State<MembershipApplicationScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _authCodeController = TextEditingController();
  String? _selectedCrop;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding
    double horizontalPadding = screenWidth * 0.05; // 5% of screen width
    double verticalPadding = screenHeight * 0.02;  // 2% of screen height

    // Responsive font sizes
    double titleFontSize = screenWidth * 0.06; // e.g., 6% of screen width
    if (titleFontSize > 28) titleFontSize = 28; // Max size
    if (titleFontSize < 20) titleFontSize = 20; // Min size

    double sectionLabelFontSize = screenWidth * 0.035;
    if (sectionLabelFontSize > 14) sectionLabelFontSize = 14;
    if (sectionLabelFontSize < 10) sectionLabelFontSize = 10;


    // Responsive spacing
    double spacingExtraLarge = screenHeight * 0.035; // ~30
    double spacingLarge = screenHeight * 0.028;    // ~24
    double spacingMedium = screenHeight * 0.023;   // ~20
    double spacingSmall = screenHeight * 0.018;    // ~16


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(isProfileButtonActive: false),
                SizedBox(height: spacingLarge),
                Text(
                  'Membership Application',
                  style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: spacingLarge),
                _buildTextFieldWithLabel(context, 'FULL NAME', _fullNameController),
                SizedBox(height: spacingMedium),
                _buildTextFieldWithLabel(context, 'EMAIL', _emailController),
                SizedBox(height: spacingMedium),
                _buildTextFieldWithLabel(context, 'PHONE NUMBER', _phoneController),
                SizedBox(height: spacingMedium),
                _buildTextFieldWithLabel(context, 'AUTHENTICATION CODE', _authCodeController),
                SizedBox(height: spacingMedium),
                _buildDropdownField(context),
                SizedBox(height: spacingExtraLarge),
                Text('ATTACH REQUIRED DOCUMENT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: sectionLabelFontSize)),
                SizedBox(height: spacingSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAttachmentBox(context),
                    _buildAttachmentBox(context),
                    _buildAttachmentBox(context),
                  ],
                ),
                SizedBox(height: spacingExtraLarge),
                CustomButton(
                  text: 'SUBMIT APPLICATION',
                  onPressed: () { /* TODO: Implement submit logic */ },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(BuildContext context, String label, TextEditingController controller) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double labelFontSize = screenWidth * 0.03; // 3% of screen width
     if (labelFontSize > 13) labelFontSize = 13;
     if (labelFontSize < 10) labelFontSize = 10;

    double internalSpacing = screenHeight * 0.009; // ~8

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: labelFontSize)),
        SizedBox(height: internalSpacing),
        CustomTextField( // Assuming CustomTextField is already responsive
          hintText: '',
          controller: controller,
          hasBorder: true,
        ),
      ],
    );
  }

  Widget _buildDropdownField(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double labelFontSize = screenWidth * 0.03;
    if (labelFontSize > 13) labelFontSize = 13;
    if (labelFontSize < 10) labelFontSize = 10;

    double internalSpacing = screenHeight * 0.009; // ~8
    double dropdownItemFontSize = screenWidth * 0.035;
    if (dropdownItemFontSize > 15) dropdownItemFontSize = 15;
    if (dropdownItemFontSize < 12) dropdownItemFontSize = 12;

    double verticalPadding = screenHeight * 0.021; // ~18
    double horizontalPadding = screenWidth * 0.045; // ~20
    double borderRadiusVal = screenWidth * 0.03; // ~12

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PRIMARY CROPS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: labelFontSize)),
        SizedBox(height: internalSpacing),
        DropdownButtonFormField<String>(
          value: _selectedCrop,
          hint: Text('Select a crop', style: TextStyle(fontSize: dropdownItemFontSize)),
          style: TextStyle(fontSize: dropdownItemFontSize, color: Colors.black), // For selected item
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusVal),
              borderSide: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusVal),
              borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2.5),
            ),
          ),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCrop = newValue;
            });
          },
          items: <String>['Corn', 'Rice', 'Sugarcane', 'Vegetables']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(fontSize: dropdownItemFontSize)),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAttachmentBox(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // The box is in a Row with 3 items, so width is roughly screenWidth / 3
    // Let's make height proportional to this effective width.
    double boxEffectiveWidth = screenWidth / 3.3; // Account for spacing
    double boxHeight = boxEffectiveWidth * 0.9; // Adjust factor for desired aspect ratio
    if (boxHeight > 130) boxHeight = 130; // Max height
    if (boxHeight < 90) boxHeight = 90;   // Min height

    double horizontalMargin = screenWidth * 0.008; // ~4
    double borderRadiusVal = screenWidth * 0.03;   // ~12

    double iconSize = boxHeight * 0.35; // Icon size proportional to box height
    if (iconSize > 45) iconSize = 45;
    if (iconSize < 30) iconSize = 30;

    double internalSpacing = boxHeight * 0.07; // ~8
    double textFontSize = boxHeight * 0.09;
    if (textFontSize > 11) textFontSize = 11;
    if (textFontSize < 8) textFontSize = 8;


    return Expanded(
      child: Container(
        height: boxHeight,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadiusVal),
          border: Border.all(color: Colors.grey.shade400, width: 1.5),
        ),
        child: InkWell(
          onTap: () { /* TODO: Implement file picking */ },
          borderRadius: BorderRadius.circular(borderRadiusVal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_library_outlined, color: Colors.grey.shade600, size: iconSize),
              SizedBox(height: internalSpacing),
              Text(
                'ATTACH FILE OR PHOTO HERE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: textFontSize, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
