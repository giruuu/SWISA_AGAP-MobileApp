import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grants/application_form_submitted.dart';
import 'package:capstone/screens/grants/view_file_screen.dart';

class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({super.key});

  @override
  State<ApplicationFormScreen> createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) {
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

  // --- All helper widgets are now part of the main state class ---

  Widget _buildAppBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen, size: 28),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Expanded(
                child: Text(
                  'Grant Application',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: List.generate(
              3,
                  (index) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 4,
                  decoration: BoxDecoration(
                    color: (index < _getCurrentMainStep()) ? AppColors.primaryGreen : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) => setState(() => _currentPage = page),
                children: [
                  _Page1PersonalInfo(onNext: _nextPage),
                  _Page2SecondaryContact(onNext: _nextPage),
                  _Page3AdditionalInfo(onNext: _nextPage),
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

// --- SHARED WIDGETS (Now defined at the top level for simplicity) ---

Widget _buildMainTitle(String title) => Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
Widget _buildSubTitle(String title) => Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]));

Widget _buildTextField({required String label, required String hint}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontWeight: FontWeight.w500)), const SizedBox(height: 8), TextFormField(decoration: InputDecoration(hintText: hint, filled: true, fillColor: AppColors.formFieldFill, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder))))]);
}

Widget _buildDropdown({required String label, required String hint, required List<String> items}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontWeight: FontWeight.w500)), const SizedBox(height: 8), DropdownButtonFormField<String>(hint: Text(hint), items: items.map((String value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(), onChanged: (value) {}, decoration: InputDecoration(filled: true, fillColor: AppColors.formFieldFill, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.formFieldBorder))))]);
}

Widget _buildNextButton({required BuildContext context, required VoidCallback onPressed}) {
  return SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next')));
}

// --- PAGE WIDGETS ---

class _Page1PersonalInfo extends StatelessWidget {
  final VoidCallback onNext;
  const _Page1PersonalInfo({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 24.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SizedBox(height: 24), _buildMainTitle('Grant Application'), const SizedBox(height: 20), _buildSubTitle('Personal Information'), const SizedBox(height: 16), Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _buildTextField(label: 'First Name', hint: 'First Name')), const SizedBox(width: 16), SizedBox(width: 100, child: _buildDropdown(label: 'Suffix', hint: 'Suffix', items: const ['N/A', 'Jr.', 'Sr.']))]), const SizedBox(height: 8), _buildTextField(label: 'Middle Name', hint: 'Middle Name'), Row(children: [const Checkbox(value: false, onChanged: null), const Text('I have no middle name', style: TextStyle(color: Colors.grey, fontSize: 13))]), _buildTextField(label: 'Last Name', hint: 'Last Name'), const SizedBox(height: 8), Row(children: [Expanded(child: _buildDropdown(label: 'Civil Status', hint: 'Civil Status', items: const ['Single', 'Married'])), const SizedBox(width: 16), Expanded(child: _buildDropdown(label: 'Sex', hint: 'Sex', items: const ['Male', 'Female']))]), const SizedBox(height: 8), _buildTextField(label: 'Date of Birth', hint: 'MM/DD/YYYY'), const SizedBox(height: 8), _buildTextField(label: 'Place of Birth', hint: 'Place of Birth'), const SizedBox(height: 20), _buildSubTitle('Address'), const SizedBox(height: 16), _buildTextField(label: 'Province', hint: 'Province'), const SizedBox(height: 8), _buildTextField(label: 'City/Municipality', hint: 'City/Municipality'), const SizedBox(height: 8), Row(children: [Expanded(child: _buildTextField(label: 'House No.', hint: 'House No.')), const SizedBox(width: 16), Expanded(flex: 2, child: _buildTextField(label: 'Street/Barangay', hint: 'Street/Barangay'))]), const SizedBox(height: 20), _buildSubTitle('Contact Information'), const SizedBox(height: 16), _buildTextField(label: 'Phone Number', hint: 'Phone Number'), const SizedBox(height: 8), _buildTextField(label: 'Email Address', hint: 'Email Address'), const SizedBox(height: 40), _buildNextButton(context: context, onPressed: onNext), const SizedBox(height: 20)]));
  }
}

class _Page2SecondaryContact extends StatelessWidget {
  final VoidCallback onNext;
  const _Page2SecondaryContact({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 24.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SizedBox(height: 24), _buildMainTitle('Grant Application'), const SizedBox(height: 20), _buildSubTitle('Secondary Contact'), const SizedBox(height: 16), Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: _buildTextField(label: 'First Name', hint: 'First Name')), const SizedBox(width: 16), SizedBox(width: 100, child: _buildDropdown(label: 'Suffix', hint: 'Suffix', items: const ['N/A', 'Jr.', 'Sr.']))]), const SizedBox(height: 8), _buildTextField(label: 'Middle Name', hint: 'Middle Name'), Row(children: [const Checkbox(value: false, onChanged: null), const Text('I have no middle name', style: TextStyle(color: Colors.grey, fontSize: 13))]), _buildTextField(label: 'Last Name', hint: 'Last Name'), const SizedBox(height: 8), Row(children: [Expanded(child: _buildDropdown(label: 'Relationship', hint: 'Relationship', items: const ['Spouse', 'Parent'])), const SizedBox(width: 16), Expanded(child: _buildDropdown(label: 'Sex', hint: 'Sex', items: const ['Male', 'Female']))]), const SizedBox(height: 8), _buildTextField(label: 'Date of Birth', hint: 'MM/DD/YYYY'), const SizedBox(height: 20), _buildSubTitle('Contact Information'), const SizedBox(height: 16), _buildTextField(label: 'Phone Number', hint: 'Phone Number'), const SizedBox(height: 8), _buildTextField(label: 'Email Address', hint: 'Email Address'), const SizedBox(height: 40), _buildNextButton(context: context, onPressed: onNext), const SizedBox(height: 20)]));
  }
}

class _Page3AdditionalInfo extends StatelessWidget {
  final VoidCallback onNext;
  const _Page3AdditionalInfo({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 24.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SizedBox(height: 24), _buildMainTitle('Grant Application'), const SizedBox(height: 20), _buildSubTitle('Additional Information'), const SizedBox(height: 16), _buildTextField(label: 'Purpose of Grant', hint: 'Purpose of Grant'), const SizedBox(height: 40), _buildNextButton(context: context, onPressed: onNext), const SizedBox(height: 20)]));
  }
}

class _Page4RequirementsChecking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 24.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SizedBox(height: 24), _buildMainTitle('Requirements Checking'), const SizedBox(height: 20), _buildSubTitle('Requirements'), const SizedBox(height: 16), _buildRequirementRow(context, 'VALID ID / GOVERMENT ID', isApproved: true), _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: true), _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: true), _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: false), _buildRequirementRow(context, 'REQUIREMENT NO. 1', isApproved: false), const SizedBox(height: 40), SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const ApplicationFormSubmittedScreen()), (route) => false);}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16), textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), child: const Text('Next'))), const SizedBox(height: 20)]));
  }

  Widget _buildRequirementRow(BuildContext context, String name, {required bool isApproved}) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 6.0), child: Row(children: [Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))), Icon(isApproved ? Icons.check_circle : Icons.cancel, color: isApproved ? Colors.green : Colors.red, size: 24), const SizedBox(width: 16), const Icon(Icons.file_present_rounded, color: Colors.deepPurple, size: 24), const SizedBox(width: 16), _buildFileActionButton(isApproved ? 'VIEW FILE' : 'UPLOAD FILE', isApproved ? Colors.teal : Colors.green), const SizedBox(width: 8), _buildFileActionButton('DOWNLOAD', Colors.grey)]));
  }

  Widget _buildFileActionButton(String text, Color color) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)), child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)));
  }
}