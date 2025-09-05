import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class MenuGrant extends StatelessWidget {
  const MenuGrant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Choose Grant",
          style: TextStyle(
            color: AppColors.primaryMaterialColor[250],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.00, top: 10.00),
        child: _menuFeaturesSection(),
      ),
    );
  }

  /// This is now a helper method, outside the body tree
  Widget _menuFeaturesSection() {
    return GridView.count(
      crossAxisCount: 2, //
      crossAxisSpacing: 20,
      mainAxisSpacing: 30,
      childAspectRatio: 0.75,
      children: [
        _menuFeatureButton(
          iconColor: Colors.white,
          icon: Icons.edit_document,
          label: 'SUPPLY GRANT',
        ),
        _menuFeatureButton(
          iconColor: Colors.white,
          icon: Icons.edit_document,
          label: 'EQUIPMENT GRANT',
        ),
        _menuFeatureButton(
          iconColor: Colors.white,
          icon: Icons.edit_document,
          label: 'FERTILIZER GRANT',
        ),
        _menuFeatureButton(
          iconColor: Colors.white,
          icon: Icons.edit_document,
          label: 'FERTILIZER GRANT',
        ),
        _menuFeatureButton(
          iconColor: Colors.white,
          icon: Icons.edit_document,
          label: 'FERTILIZER GRANT',
        ),
        _menuFeatureButton(
          iconColor: Colors.white,
          icon: Icons.edit_document,
          label: 'FERTILIZER GRANT',
        ),
      ],
    );
  }


  /// Helper widget for each feature button
  Widget _menuFeatureButton({
    required Color iconColor,
    required IconData icon,
    required String label,
  }) {
    return Container(

      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryMaterialColor[350],
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 55),
          const SizedBox(height: 25),
          Text(
            label,
            textAlign: TextAlign.center,
            style:  TextStyle(color: AppColors.primaryMaterialColor[50], fontWeight: FontWeight.bold, fontSize: 13,),
          ),
        ],
      ),
    );
  }
}
