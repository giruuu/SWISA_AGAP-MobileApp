import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/widgets/expandable_details_card.dart';

// A data model for FAQ items.
class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQCard extends StatelessWidget {
  final FAQItem item;

  const FAQCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Pass the question and answer to the ExpandableCard widget.
    return ExpandableCard(
      leadingWidget: Icon(
        Icons.help_sharp,
        color: AppColors.primaryGreen,
        size: 34.w,
      ),
      title: Text(
        item.question,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
      content: Text(
        item.answer,
        style: TextStyle(fontSize: 14.sp),
      ),
    );
  }
}

// The main FAQ page widget.
class MenuFAQPage extends StatelessWidget {
  const MenuFAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample FAQ data using the new FAQItem data model.
    final List<FAQItem> faqs = [
      FAQItem(
        question: 'How do I Roam in Mobile Legends?',
        answer: 'This is a sample answer for roaming in Mobile Legends. The answer can be a single paragraph or a list of steps.',
      ),
      FAQItem(
        question: 'How do I apply for grants?',
        answer: '1. Identify yourself to make sure you are not a threat to our business.\n2. Submit the requirements (Valid-ID, Med cert).\n3. Are you a terrorist?',
      ),
      FAQItem(
        question: 'Lorem Ipsum paano mag center ng div',
        answer: 'This is a sample answer for a generic question.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: AppColors.green350, fontFamily: 'Poppins')),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            // Correctly map the list of FAQItem objects to FAQCard widgets.
            ...faqs.map((faqItem) => FAQCard(item: faqItem)).toList()
          ],
        ),
      ),
    );
  }
}
