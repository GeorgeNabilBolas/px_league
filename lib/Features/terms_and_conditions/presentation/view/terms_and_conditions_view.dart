import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الشروط والأحكام"),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الشروط والأحكام",
                  style: TextStyle(
                    fontSize: 26, // عنوان كبير
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "مرحباً بك في تطبيقنا. باستخدامك لهذا التطبيق فإنك توافق على "
                  "الشروط والأحكام التالية:\n\n"
                  "1. الاستخدام المسموح:\n"
                  "يُسمح لك باستخدام التطبيق للأغراض الشخصية فقط، ولا يجوز "
                  "استخدامه لأي أغراض غير قانونية أو مخالفة.\n\n"
                  "2. الحساب والمسؤولية:\n"
                  "أنت مسؤول عن الحفاظ على سرية بيانات الدخول الخاصة بك، وعن "
                  "جميع الأنشطة التي تتم من خلال حسابك.\n\n"
                  "3. الملكية الفكرية:\n"
                  "جميع الحقوق الفكرية المتعلقة بالمحتوى والتصاميم داخل التطبيق "
                  "مملوكة لنا ولا يجوز نسخها أو إعادة استخدامها بدون إذن مسبق.\n\n"
                  "4. التعديلات على الشروط:\n"
                  "نحتفظ بحق تعديل أو تحديث هذه الشروط في أي وقت، وسيتم إعلامك "
                  "بذلك من خلال التطبيق.\n\n"
                  "5. إنهاء الاستخدام:\n"
                  "يحق لنا تعليق أو إنهاء وصولك للتطبيق إذا قمت بخرق أي من هذه الشروط.\n\n"
                  "6. التواصل معنا:\n"
                  "لأي استفسار بخصوص هذه الشروط، يمكنك مراسلتنا عبر البريد: george.nabil.bulis@gmail.com",
                  style: TextStyle(
                    fontSize: 20, // النص كبير
                    height: 1.8, // تباعد مريح بين الأسطر
                  ),
                  textAlign: TextAlign.right, // محاذاة عربية
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
