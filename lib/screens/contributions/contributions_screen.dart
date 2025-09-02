import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';

class ContributionsScreen extends StatefulWidget {
  const ContributionsScreen({super.key});

  @override
  State<ContributionsScreen> createState() => _ContributionsScreenState();
}

class _ContributionsScreenState extends State<ContributionsScreen> {
  bool _isHistoryExpanded = true;

  List<BoxShadow> get cardShadow {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 20,
        offset: const Offset(0, 5),
      ),
    ];
  }

  Border get cardBorder {
    return Border.all(color: AppColors.primaryGreen.withOpacity(0.7), width: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildContributionRatingCard(),
                    const SizedBox(height: 20),
                    _buildContributionHistory(),
                  ],
                ),
              ),
            ),
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
              'Contributions',
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

  Widget _buildContributionRatingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: cardBorder,
        boxShadow: cardShadow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CONTRIBUTION RATING', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textColor)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('GREAT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  )
                ],
              ),
              // --- LOGO UPDATED: Border removed, size increased ---
              SizedBox(
                width: 75,
                height: 75,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/swisa-logo-circle.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('10', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.primaryGreen, height: 1.0)),
                  Text('TIMES CONTRIBUTED', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('AJ. MARQUEZ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const Text('2025', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('MEMBER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContributionHistory() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: cardBorder,
        boxShadow: cardShadow,
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isHistoryExpanded = !_isHistoryExpanded;
                });
              },
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Contribution History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Row(
                      children: [
                        const Text('Jan - March, 2025', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Icon(_isHistoryExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildHistoryTable(),
            crossFadeState: _isHistoryExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }

  Widget _buildHistoryTable() {
    final List<Map<String, String>> contributions = [
      {'type': 'Cash', 'quantity': '₱100', 'date': '08/10/2025'},
      {'type': 'Crop', 'quantity': '10kg', 'date': '08/05/2025'},
      {'type': 'Cash', 'quantity': '₱50', 'date': '07/28/2025'},
      {'type': 'Cash', 'quantity': '₱150', 'date': '07/15/2025'},
      {'type': 'Crop', 'quantity': '25kg', 'date': '07/11/2025'},
      {'type': 'Crop', 'quantity': '5kg', 'date': '06/20/2025'},
      {'type': 'Cash', 'quantity': '₱200', 'date': '06/18/2025'},
      {'type': 'Crop', 'quantity': '12kg', 'date': '06/02/2025'},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          _buildHeaderRow(),
          const Divider(height: 1),
          for (var item in contributions) ...[
            _buildDataRow(item),
            const Divider(height: 1, indent: 8, endIndent: 8),
          ],
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    const headerStyle = TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold);
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Type', style: headerStyle)),
          Expanded(flex: 2, child: Text('Quantity', style: headerStyle)),
          Expanded(flex: 3, child: Text('Date', style: headerStyle)),
          Expanded(flex: 2, child: Text('Receipt', style: headerStyle, textAlign: TextAlign.center,)),
        ],
      ),
    );
  }

  Widget _buildDataRow(Map<String, String> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(data['type']!)),
          Expanded(flex: 2, child: Text(data['quantity']!)),
          Expanded(flex: 3, child: Text(data['date']!)),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () { /* TODO: View Receipt Logic */ },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.visibility, color: Colors.deepPurple, size: 16),
                  SizedBox(width: 4),
                  Text('View File', style: TextStyle(color: Colors.deepPurple, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}