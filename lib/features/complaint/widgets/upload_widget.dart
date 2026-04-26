import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Upload action will be connected later'),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
          color: AppColors.background,
        ),
        child: const Column(
          children: [
            Icon(Icons.cloud_upload_outlined, size: 32),
            SizedBox(height: 8),
            Text('Attach photo or document'),
          ],
        ),
      ),
    );
  }
}
