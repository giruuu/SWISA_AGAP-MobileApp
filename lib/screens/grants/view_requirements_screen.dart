import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grants/view_file_screen.dart';
import 'package:image_picker/image_picker.dart';

// Enum to represent the status of a requirement
enum RequirementStatus { approved, missing }

class ViewRequirementsScreen extends StatefulWidget {
  const ViewRequirementsScreen({super.key});

  @override
  State<ViewRequirementsScreen> createState() => _ViewRequirementsScreenState();
}

class _ViewRequirementsScreenState extends State<ViewRequirementsScreen> {

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    Navigator.of(context).pop();
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        print('Image picked: ${pickedFile.path}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image Selected: ${pickedFile.name}')),
        );
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showUploadRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.priority_high_rounded, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 20),
                const Text('Upload Required Documents First', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text('Please upload all required documents before you can apply.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Complete Requirements'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showUploadFileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('UPLOAD FILE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildUploadOption(context, icon: Icons.camera_alt_outlined, label: 'OPEN CAMERA', source: ImageSource.camera),
                      const VerticalDivider(thickness: 1),
                      _buildUploadOption(context, icon: Icons.folder_open_outlined, label: 'OPEN LOCAL FILES', source: ImageSource.gallery),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUploadOption(BuildContext context, {required IconData icon, required String label, required ImageSource source}) {
    return Expanded(
      child: InkWell(
        onTap: () => _pickImage(source),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primaryGreen, size: 40),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGrantSummary(),
                    const SizedBox(height: 16),
                    _buildDescription(),
                    const SizedBox(height: 24),
                    _buildRequirementsSection(context),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryGreen, size: 28),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Text(
              'Requirements',
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
    );
  }

  Widget _buildGrantSummary() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 90,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.check_box_outlined, color: AppColors.primaryGreen, size: 30),
                ),
                SizedBox(height: 8),
                Text('CASH GRANT', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('GRANT NAME', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GRANT TYPE:', style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.8)),
                        Text('DATE:', style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.8)),
                        Text('AMOUNT:', style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.8)),
                        Text('APPLICANT LIMIT:', style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.8)),
                      ],
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CASH', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                        Text('08/20/2025', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                        Text('PHP 10,000.00', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                        Text('100', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, height: 1.8, color: AppColors.primaryGreen)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.chat_bubble_outline, color: AppColors.primaryGreen, size: 18),
            const SizedBox(width: 4),
            const Text('50', style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 12),
        const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.',
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildRequirementsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Requirements', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 16),
        _buildRequirementRow(context, name: 'VALID ID / GOVERMENT ID', status: RequirementStatus.approved),
        _buildRequirementRow(context, name: 'REQUIREMENT NO. 2', status: RequirementStatus.approved),
        _buildRequirementRow(context, name: 'REQUIREMENT NO. 3', status: RequirementStatus.missing),
        _buildRequirementRow(context, name: 'REQUIREMENT NO. 4', status: RequirementStatus.missing),
      ],
    );
  }

  Widget _buildRequirementRow(BuildContext context, {required String name, required RequirementStatus status}) {
    bool isApproved = status == RequirementStatus.approved;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 16),
          Icon(isApproved ? Icons.check_circle : Icons.cancel, color: isApproved ? Colors.green : Colors.red, size: 24),
          const SizedBox(width: 16),
          const Icon(Icons.file_present_rounded, color: Colors.deepPurple, size: 24),
          const SizedBox(width: 16),
          SizedBox(
            width: 85,
            child: isApproved
                ? _buildFileActionButton('VIEW FILE', Colors.blue.shade700, onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewFileScreen(requirementTitle: name)),
              );
            })
                : _buildFileActionButton('UPLOAD FILE', Colors.orange.shade700, onTap: () => _showUploadFileDialog(context)),
          ),
          const SizedBox(width: 8),
          SizedBox(width: 85, child: _buildFileActionButton('DOWNLOAD', Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _buildFileActionButton(String text, Color color, {VoidCallback? onTap}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        minimumSize: const Size(85, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  // --- FINAL, DEFINITIVE VERSION OF THE BOTTOM BUTTONS ---
  // This layout makes both buttons have the exact same width and aligns them perfectly.
  Widget _buildBottomButtons(BuildContext context) {
    // This is the style for the warning text, used for both the real one and the invisible spacer
    const warningTextStyle = TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.w500);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), spreadRadius: -5, blurRadius: 10, offset: const Offset(0,-5) )],
      ),
      child: Row(
        children: [
          // Both button sections are wrapped in Expanded to ensure equal width.
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Invisible warning text to balance the height
                const Opacity(
                  opacity: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info, color: Colors.red, size: 12),
                      SizedBox(width: 4),
                      Text('Placeholder', style: warningTextStyle),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade600,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('CLOSE'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // The actual, visible warning text
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info, color: Colors.red, size: 12),
                    SizedBox(width: 4),
                    Text('Upload Required Documents First', style: warningTextStyle),
                  ],
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () => _showUploadRequiredDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50), // A lighter green
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('APPLY'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}