import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/membership/application_submitted_screen.dart';

class MembershipApplicationScreen extends StatefulWidget {
  const MembershipApplicationScreen({super.key});

  @override
  State<MembershipApplicationScreen> createState() => _MembershipApplicationScreenState();
}

class _MembershipApplicationScreenState extends State<MembershipApplicationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) { // 4 pages total (0, 1, 2, 3)
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  int _getCurrentMainStep() {
    if (_currentPage <= 1) return 1;
    if (_currentPage == 2) return 2;
    if (_currentPage == 3) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, currentMainStep: _getCurrentMainStep(), totalMainSteps: 3),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) => setState(() => _currentPage = page),
                children: [
                  _Page1PersonalInfo(onNext: _nextPage),
                  _Page2SecondaryContact(onNext: _nextPage),
                  _Page3AgricultureInfo(onNext: _nextPage),
                  _Page4RequirementsChecking(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SHARED WIDGETS ---

Widget _buildAppBar(BuildContext context, {required int currentMainStep, required int totalMainSteps}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            // --- BACK BUTTON UPDATED ---
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen, size: 24),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          children: List.generate(totalMainSteps, (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 4,
              decoration: BoxDecoration(
                color: (index < currentMainStep) ? AppColors.primaryGreen : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )),
        ),
      ),
    ],
  );
}

Widget _buildSectionTitle(String title, {bool isSubSection = false}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: isSubSection ? 16 : 18,
      fontWeight: FontWeight.bold,
      color: isSubSection ? Colors.grey[800] : Colors.black,
    ),
  );
}

// --- TEXTFIELD WIDGET UPDATED ---
Widget _buildTextField({required String labelText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      cursorColor: AppColors.primaryGreen, // Sets the cursor color
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: const TextStyle(color: AppColors.primaryGreen), // Sets the label color on focus
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.textFieldBorder)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.textFieldBorder)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2.0)),
      ),
    ),
  );
}

Widget _buildDropdown({required String labelText, required List<String> items}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: DropdownButtonFormField<String>(
      hint: Text(labelText),
      items: items.map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.textFieldBorder)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.textFieldBorder)),
      ),
    ),
  );
}

// --- PAGE 1: PERSONAL INFORMATION ---
class _Page1PersonalInfo extends StatelessWidget {
  final VoidCallback onNext;
  const _Page1PersonalInfo({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildSectionTitle('Membership Application'),
          const SizedBox(height: 20),
          _buildSectionTitle('Personal Information', isSubSection: true),
          const SizedBox(height: 13),
          Row(children: [Expanded(child: _buildTextField(labelText: 'First Name')), const SizedBox(width: 16), SizedBox(width: 100, child: _buildDropdown(labelText: 'Suffix', items: const ['N/A', 'Jr.', 'Sr.']))]),
          _buildTextField(labelText: 'Middle Name'),
          Row(children: [const Checkbox(value: false, onChanged: null), const Text('I have no middle name', style: TextStyle(color: Colors.grey, fontSize: 13))]),
          _buildTextField(labelText: 'Last Name'),
          // --- UPDATED: Changed to TextFields ---
          Row(children: [Expanded(child: _buildTextField(labelText: 'Civil Status')), const SizedBox(width: 16), Expanded(child: _buildTextField(labelText: 'Sex'))]),
          _buildTextField(labelText: 'Date of Birth'),
          _buildTextField(labelText: 'Place of Birth'),
          const SizedBox(height: 20),
          _buildSectionTitle('Address', isSubSection: true),
          const SizedBox(height: 16),
          _buildTextField(labelText: 'Purok/Zone'),
          _buildTextField(labelText: 'Street/Barangay'),
          _buildTextField(labelText: 'City/Municipality'),
          _buildTextField(labelText: 'Province'),
          const SizedBox(height: 20),
          _buildSectionTitle('Contact Information', isSubSection: true),
          const SizedBox(height: 16),
          _buildTextField(labelText: 'Phone Number'),
          _buildTextField(labelText: 'Email Address'),
          const SizedBox(height: 40),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onNext, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next'))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// --- PAGE 2: SECONDARY CONTACT ---
class _Page2SecondaryContact extends StatelessWidget {
  final VoidCallback onNext;
  const _Page2SecondaryContact({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildSectionTitle('Membership Application'),
          const SizedBox(height: 20),
          _buildSectionTitle('Secondary Contact', isSubSection: true),
          const SizedBox(height: 16),
          Row(children: [Expanded(child: _buildTextField(labelText: 'First Name')), const SizedBox(width: 16), SizedBox(width: 100, child: _buildDropdown(labelText: 'Suffix', items: const ['N/A', 'Jr.', 'Sr.']))]),
          _buildTextField(labelText: 'Middle Name'),
          Row(children: [const Checkbox(value: false, onChanged: null), const Text('I have no middle name', style: TextStyle(color: Colors.grey, fontSize: 13))]),
          _buildTextField(labelText: 'Last Name'),
          // --- UPDATED: Changed to TextFields ---
          Row(children: [Expanded(child: _buildTextField(labelText: 'Relationship')), const SizedBox(width: 16), Expanded(child: _buildTextField(labelText: 'Sex'))]),
          _buildTextField(labelText: 'Date of Birth'),
          const SizedBox(height: 20),
          // --- ADDRESS SECTION ADDED ---
          _buildSectionTitle('Address', isSubSection: true),
          const SizedBox(height: 16),
          _buildTextField(labelText: 'Purok/Zone'),
          _buildTextField(labelText: 'Street/Barangay'),
          _buildTextField(labelText: 'City/Municipality'),
          _buildTextField(labelText: 'Province'),
          const SizedBox(height: 20),
          _buildSectionTitle('Contact Information', isSubSection: true),
          const SizedBox(height: 16),
          _buildTextField(labelText: 'Phone Number'),
          _buildTextField(labelText: 'Email Address'),
          const SizedBox(height: 40),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onNext, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next'))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// --- PAGE 3: AGRICULTURE INFO ---
class _Page3AgricultureInfo extends StatelessWidget {
  final VoidCallback onNext;
  const _Page3AgricultureInfo({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildSectionTitle('Agriculture/Livelihood Information'),
          const SizedBox(height: 20),
          _buildSectionTitle('Additional Information', isSubSection: true),
          const SizedBox(height: 16),
          _buildDropdown(labelText: 'Type of Farmer/Fisher', items: const['Farmer', 'Fisher']),
          _buildTextField(labelText: 'Farm/Lot Location'),
          _buildTextField(labelText: 'Estimated Land Size'),
          _buildTextField(labelText: 'Water Source'),
          _buildTextField(labelText: 'Purpose of Membership'),
          const SizedBox(height: 40),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onNext, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next'))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// --- PAGE 4: REQUIREMENTS CHECKING ---
class _Page4RequirementsChecking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _buildSectionTitle('Requirements Checking'),
          const SizedBox(height: 20),
          _buildSectionTitle('Requirements', isSubSection: true),
          const SizedBox(height: 16),
          _buildRequirementRow(context, 'VALID ID / GOVERMENT ID', isApproved: true),
          _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: true),
          _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: true),
          _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: false),
          _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: false),
          const SizedBox(height: 40),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const ApplicationSubmittedScreen()),
                  (route) => false,
            );
          }, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next'))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRequirementRow(BuildContext context, String name, {required bool isApproved}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
          Icon(isApproved ? Icons.check_circle : Icons.cancel, color: isApproved ? Colors.green : Colors.red, size: 24),
          const SizedBox(width: 16),
          // --- ICON COLOR UPDATED ---
          const Icon(Icons.file_present_rounded, color: AppColors.primaryGreen, size: 24),
          const SizedBox(width: 16),
          _buildFileActionButton('VIEW FILE', isApproved ? Colors.teal : Colors.grey),
          const SizedBox(width: 8),
          _buildFileActionButton('DOWNLOAD', Colors.grey),
        ],
      ),
    );
  }

  Widget _buildFileActionButton(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}