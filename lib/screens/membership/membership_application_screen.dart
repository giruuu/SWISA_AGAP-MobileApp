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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- CHANGE IS HERE ---
                // We are now passing the new property to disable the profile button
                const CustomHeader(isProfileButtonActive: false),

                const SizedBox(height: 24),
                const Text(
                  'Membership Application',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                _buildTextFieldWithLabel('FULL NAME', _fullNameController),
                const SizedBox(height: 20),
                _buildTextFieldWithLabel('EMAIL', _emailController),
                const SizedBox(height: 20),
                _buildTextFieldWithLabel('PHONE NUMBER', _phoneController),
                const SizedBox(height: 20),
                _buildTextFieldWithLabel('AUTHENTICATION CODE', _authCodeController),
                const SizedBox(height: 20),
                _buildDropdownField(),
                const SizedBox(height: 30),

                const Text('ATTACH REQUIRED DOCUMENT', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAttachmentBox(),
                    _buildAttachmentBox(),
                    _buildAttachmentBox(),
                  ],
                ),
                const SizedBox(height: 30),
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

  Widget _buildTextFieldWithLabel(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        CustomTextField(
          hintText: '',
          controller: controller,
          hasBorder: true,
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('PRIMARY CROPS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedCrop,
          hint: const Text('Select a crop'),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
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
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAttachmentBox() {
    return Expanded(
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400, width: 1.5),
        ),
        child: InkWell(
          onTap: () { /* TODO: Implement file picking */ },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_library_outlined, color: Colors.grey.shade600, size: 40),
              const SizedBox(height: 8),
              Text(
                'ATTACH FILE OR PHOTO HERE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}