import 'package:flutter/material.dart';

import '../../../../Core/constants/app_strings.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.privacyPolicy),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.privacyPolicy,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "نحن نقدر خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمع "
                  "واستخدام وحماية معلوماتك عند استخدامك لتطبيقنا.\n\n"
                  "1. المعلومات التي نجمعها:\n"
                  "قد نقوم بجمع بعض المعلومات الشخصية مثل الاسم، البريد الإلكتروني، "
                  "وبيانات الاستخدام.\n\n"
                  "2. كيفية استخدام المعلومات:\n"
                  "نستخدم البيانات لتحسين خدماتنا، تخصيص تجربتك، والتواصل معك.\n\n"
                  "3. حماية البيانات:\n"
                  "نطبق إجراءات أمان صارمة لحماية بياناتك من الوصول غير المصرح به.\n\n"
                  "4. التعديلات على السياسة:\n"
                  "قد نقوم بتحديث هذه السياسة من وقت لآخر. نرجو مراجعتها بشكل دوري.\n\n"
                  "5. للتواصل معنا:\n"
                  "إذا كان لديك أي استفسار، يمكنك مراسلتنا عبر البريد: george.nabil.bulis@gmail.com",
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
