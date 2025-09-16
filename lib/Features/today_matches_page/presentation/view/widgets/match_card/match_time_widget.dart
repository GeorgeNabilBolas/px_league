import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/helpers/date_formatter.dart';

class MatchTimeWidget extends StatelessWidget {
  const MatchTimeWidget({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        spacing: 4.w,
        children: [
          Expanded(
            child: Text(
              DateFormatter.formatTimeHhMm(time),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: AppTextStyles.text12MediumGreenW900,
            ),
          ),
          const Icon(Icons.access_time),
        ],
      ),
    );
  }
}
