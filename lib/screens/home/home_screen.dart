import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/credit_score/credit_score_history_screen.dart';
import 'package:capstone/widgets/custom_header.dart';
import 'package:capstone/screens/grants/available_grants_screen.dart';
import 'package:capstone/screens/grant_status/grant_status.dart';
import 'package:capstone/screens/training_and_workshop/training_and_workshop.dart';
import 'package:capstone/screens/contributions/contributions_screen.dart'; // Added import

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: CustomHeader(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  _buildTopCards(context),
                  const SizedBox(height: 24),
                  _buildSectionTitle('FEATURES'),
                  const SizedBox(height: 16),
                  _buildFeaturesSection(context), // Pass context for navigation
                  const SizedBox(height: 24),
                  _buildSectionTitle('ANNOUNCEMENTS', badge: _buildNotificationBadge('2')),
                  const SizedBox(height: 16),
                  _buildAnnouncementsSection(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('EXTERNAL LINKS'),
                  const SizedBox(height: 16),
                  _buildExternalLinksSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // (The rest of the helper methods that are not shown here are unchanged)

  // --- 2. ADD THE NAVIGATION LOGIC ---
  Widget _buildFeaturesSection(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // The onTap property is passed to the "APPLY GRANT" button here
          _buildFeatureButton(
            iconColor: AppColors.primaryGreen,
            icon: Icons.description_outlined,
            label: 'APPLY GRANT\n',
            onTap: () {
              // This command opens the new screen
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AvailableGrantsScreen()),
              );
            },
          ),
          const SizedBox(width: 14),
          // Other buttons can have their own navigation later
          _buildFeatureButton(iconColor: AppColors.primaryGreen, icon: Icons.calendar_today_outlined, label: 'TRAINING &\nWORKSHOP', onTap: () {Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TrainingAndWorkshop()),
          );}),
          const SizedBox(width: 14),
          _buildFeatureButton(iconColor: AppColors.primaryGreen, icon: Icons.checklist_rtl, label: 'VIEW STATUS\n', onTap: () {Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const GrantStatus()),
          );}),
          const SizedBox(width: 14),
          _buildFeatureButton(iconColor: AppColors.primaryGreen, icon: Icons.volunteer_activism_outlined, label: 'CONTRIBUTIONS\n', onTap: () {
            Navigator.of(context).push( // Navigate to ContributionsScreen
              MaterialPageRoute(builder: (context) => const ContributionsScreen()),
            );
          }),
        ],
      ),
    );
  }

  // --- 3. MAKE THE BUTTON TAPPABLE ---
  // The widget is wrapped in an InkWell to handle the onTap action.
  Widget _buildFeatureButton({required Color iconColor, required IconData icon, required String label, required VoidCallback onTap}) {
    return SizedBox(
      width: 110,
      child: InkWell( // This makes the container tappable
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(icon, color: iconColor, size: 32),
              ),
              const SizedBox(height: 12),
              Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, height: 1.2)),
            ],
          ),
        ),
      ),
    );
  }

  // --- The rest of the file remains the same ---
  List<BoxShadow> get cardShadow {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 20,
        offset: const Offset(0, 5),
      ),
    ];
  }

  Widget _buildTopCards(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _buildCreditScoreCard(context)),
          const SizedBox(width: 16),
          Expanded(child: _buildActivityHistoryCard(context)),
        ],
      ),
    );
  }

  Widget _buildCreditScoreCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('CREDIT SCORE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const Text('2025', style: TextStyle(color: Colors.grey, fontSize: 10)),
          const SizedBox(height: 12),
          Center(
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryGreen,
                  height: 1.0,
                ),
                children: <TextSpan>[
                  const TextSpan(text: '70'),
                  TextSpan(
                    text: '/100',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreditScoreHistoryScreen()));
              },
              child: const Text('VIEW MORE', style: TextStyle(color: AppColors.primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActivityHistoryCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ACTIVITY HISTORY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const Text('2025', style: TextStyle(color: Colors.grey, fontSize: 10)),
          const SizedBox(height: 12),
          const Center(
            child: Text('10', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w800, height: 1.0, color: AppColors.primaryGreen)),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text('NO. OF ACTIVITIES\nPARTICIPATED', textAlign: TextAlign.center, style: TextStyle(fontSize: 8, color: Colors.grey, height: 1.2)),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('VIEW MORE', style: TextStyle(color: AppColors.primaryGreen, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {Widget? badge}) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, letterSpacing: 0.5)),
        if (badge != null) ...[const SizedBox(width: 8), badge],
      ],
    );
  }

  Widget _buildNotificationBadge(String count) {
    return CircleAvatar(
      radius: 11,
      backgroundColor: AppColors.primaryGreen,
      child: Text(count, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildAnnouncementsSection() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _buildAnnouncementCard(),
      ),
    );
  }

  Widget _buildAnnouncementCard() {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: cardShadow,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryGreen,
            child: Icon(Icons.campaign_outlined, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('MEETING', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 2),
                const Text('03/22/2025', style: TextStyle(color: Colors.grey, fontSize: 11)),
                const Text('OFFICE OF SWISA', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExternalLinksSection() {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _buildExternalLinkCard(),
      ),
    );
  }

  Widget _buildExternalLinkCard() {
    return Container(
      width: 125,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/department_logo.png', height: 75),
          const SizedBox(height: 8),
          const Text('DEPARTMENT OF AGRICULTURE', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, height: 1.1)),
          const SizedBox(height: 2),
          const Text('WEBSITE', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}