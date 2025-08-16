import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class ViewFileScreen extends StatefulWidget {
  final String requirementTitle;

  const ViewFileScreen({super.key, required this.requirementTitle});

  @override
  State<ViewFileScreen> createState() => _ViewFileScreenState();
}

class _ViewFileScreenState extends State<ViewFileScreen> {
  bool _isEditing = false;

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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: _buildTwoImageDisplay(),
              ),
            ),
            _buildBottomButtons(),
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

  Widget _buildTwoImageDisplay() {
    return Column(
      children: [
        Text(
          '${_isEditing ? 'EDIT' : 'VIEW'} ${widget.requirementTitle.toUpperCase()}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildImagePlaceholder('FRONT'),
        const SizedBox(height: 16),
        _buildImagePlaceholder('BACK'),
      ],
    );
  }

  Widget _buildImagePlaceholder(String label) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Text('IMAGE')),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  Widget _buildBottomButtons() {
    // This widget dynamically builds the correct buttons based on the mode
    Widget buttons = _isEditing
    // Show CANCEL and SAVE buttons if in edit mode
        ? Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() { _isEditing = false; });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade600, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('CANCEL'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // TODO: Add save logic here
              setState(() { _isEditing = false; });
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('SAVE'),
          ),
        ),
      ],
    )
    // Show CLOSE and EDIT buttons if in view mode
        : Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade600, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('CLOSE'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() { _isEditing = true; });
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('EDIT'),
          ),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
      ),
      child: buttons,
    );
  }
}