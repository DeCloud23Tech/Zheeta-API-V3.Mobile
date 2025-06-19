import 'package:flutter/material.dart';

class VerificationGuidelines extends StatelessWidget {
  const VerificationGuidelines({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGuidelineSection(
          backgroundColor: Colors.green.shade50,
          title: "Good lighting",
          items: [
            "Whole face visible",
            "Stable camera position",
            "Follow instructions",
          ],
          icon: Icons.check_circle,
          iconColor: Colors.green,
        ),
        SizedBox(height: 8),
        _buildGuidelineSection(
          backgroundColor: Colors.red.shade50,
          title: "No face covered",
          items: [
            "No dark lighting",
            "No multiple people",
            "No face filters",
          ],
          icon: Icons.cancel,
          iconColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildGuidelineSection({
    required Color backgroundColor,
    required String title,
    required List<String> items,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildListTile(title, icon, iconColor),
          for (String item in items) _buildListTile(item, icon, iconColor),
        ],
      ),
    );
  }

  Widget _buildListTile(String text, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
