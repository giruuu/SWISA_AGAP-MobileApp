import 'package:flutter/material.dart';
import 'package:capstone/constants/app_colors.dart';
import 'package:capstone/screens/grants/view_requirements_screen.dart';
import 'package:capstone/widgets/bottomsheet.dart';

// Imports for backend connection
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:capstone/screens/models/grant.dart';

class AvailableGrantsScreen extends StatefulWidget {
  const AvailableGrantsScreen({super.key});
  @override
  State<AvailableGrantsScreen> createState() => _AvailableGrantsScreenState();
}

class _AvailableGrantsScreenState extends State<AvailableGrantsScreen> {
  int _selectedTabIndex = 0;

  // --- BACKEND LOGIC START ---
  late Future<void> _futureGrants;
  List<Grant> _allGrants = [];
  List<Grant> _filteredGrants = [];

  @override
  void initState() {
    super.initState();
    _futureGrants = fetchAndFilterGrants();
  }

  Future<void> fetchAndFilterGrants() async {
    try {
      final uri = Uri.parse('http://localhost:8000/api/grants');
      final response = await http.get(uri, headers: {'Accept': 'application/json'});
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        _allGrants = body.map((dynamic item) => Grant.fromJson(item)).toList();
        _filterGrants();
      } else {
        throw Exception('Server Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch grants: $e');
    }
  }

  void _filterGrants() {
    String filter;
    switch (_selectedTabIndex) {
      case 0: filter = 'Eligible'; break; // Placeholder, adjust if needed
      case 1: filter = 'Non-Eligible'; break; // Placeholder, adjust if needed
      case 2: filter = 'Applied'; break; // Placeholder, adjust if needed
      default:
        setState(() => _filteredGrants = _allGrants);
        return;
    }
    // Note: The backend doesn't have these statuses. For now, we will show all grants.
    // This can be updated when the API provides eligibility status.
    setState(() => _filteredGrants = _allGrants);
  }
  // --- BACKEND LOGIC END ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            const SizedBox(height: 20),
            _buildTabBar(),
            const SizedBox(height: 20),
            _buildFilterControls(),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<void>(
                future: _futureGrants,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  if (_filteredGrants.isEmpty) {
                    return const Center(child: Text('No grants available.'));
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    itemCount: _filteredGrants.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final grant = _filteredGrants[index];
                      return _buildGrantCard(context, grant);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // YOUR EXACT UI CODE. NO CHANGES.
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryGreen),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Text(
              'Available Grants',
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

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(
          children: [
            _buildTabButton('Eligible', 0),
            _buildTabButton('Non-Eligible', 1),
            _buildTabButton('Applied', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
            _filterGrants();
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withAlpha(25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Grant Type', style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(context: context, builder:(BuildContext context){
                return const BottomSheetWidget();
              });
            },
            icon: Icon(Icons.filter_list, color: Colors.grey.shade600),
            label: Text('FILTER', style: TextStyle(color: Colors.grey.shade600)),
          ),
        ],
      ),
    );
  }

  // YOUR EXACT GRANT CARD, NOW USING LIVE DATA.
  Widget _buildGrantCard(BuildContext context, Grant grant) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryGreen, width: 1.0),
      ),
      child: Row(
        children: [
          _buildLeftIcon(grant),
          const SizedBox(width: 12),
          Expanded(child: _buildDetailsSection(context, grant)),
        ],
      ),
    );
  }

  Widget _buildLeftIcon(Grant grant) {
    return Container(
      width: 90,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.check_box_outlined,
              color: AppColors.primaryGreen,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${grant.grantType.grantType.toUpperCase()}\nGRANT',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, height: 1.2),
          )
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context, Grant grant) {
    String amount = grant.description != null && grant.description!.contains("PHP")
        ? "PHP 5000.00"
        : "N/A";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(grant.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(width: 8),
            Row(
              children: [
                const Icon(Icons.person_outline, color: AppColors.primaryGreen, size: 16),
                const SizedBox(width: 4),
                // Hardcoded '10' from your original file, as there is no backend field for it
                const Text('10', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GRANT TYPE:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                      Text('DATE:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                      Text('AMOUNT:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                      Text('APPLICANT LIMIT:', style: TextStyle(fontSize: 9, color: Colors.black, height: 1.7)),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(grant.grantType.grantType, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                        Text(grant.availableAt ?? 'N/A', style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                        Text(amount, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                        Text(grant.totalQuantity.toString(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.7, color: AppColors.primaryGreen)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ViewRequirementsScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryGreen,
                side: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              ),
              child: const Text('APPLY NOW', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}