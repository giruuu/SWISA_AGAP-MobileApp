import 'package:flutter/material.dart';

void main() => runApp(SwisaApp());

class SwisaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final Color primaryGreen = Color(0xFF3E7E3B);
  final Color background = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerSection(),
              SizedBox(height: 20),
              _creditScoreCard(),
              SizedBox(height: 20),
              _featuresSection(),
              SizedBox(height: 20),
              _announcementSection(),
              SizedBox(height: 20),
              _externalLinksSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(child: Icon(Icons.agriculture)), // Placeholder logo
            SizedBox(width: 8),
            Text(
              'SwisaAGAP',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E7E3B),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text("Username"),
            SizedBox(width: 8),
            CircleAvatar(child: Icon(Icons.person)),
          ],
        )
      ],
    );
  }

  Widget _creditScoreCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CREDIT SCORE\nFor this year', style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Text('100/100', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: 1.0,
              color: Colors.green,
              backgroundColor: Colors.green[100],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text("VIEW LOGS", style: TextStyle(color: Colors.green)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _featuresSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("FEATURES", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _featureButton(Icons.note_add, "APPLY GRANT"),
            _featureButton(Icons.school, "TRAINING &\nWORKSHOP"),
            _featureButton(Icons.sync_alt, "VIEW STATUS"),
          ],
        )
      ],
    );
  }

  Widget _featureButton(IconData icon, String label) {
    return Expanded(
      child: Card(
        color: Color(0xFF3E7E3B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 30),
              SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _announcementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("ANNOUNCEMENTS", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 6),
            CircleAvatar(radius: 8, backgroundColor: Colors.green, child: Text("2", style: TextStyle(fontSize: 10, color: Colors.white))),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            _announcementCard(),
            SizedBox(width: 10),
            _announcementCard(),
          ],
        )
      ],
    );
  }

  Widget _announcementCard() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(Icons.event_note, color: Colors.green),
              SizedBox(height: 8),
              Text("MEETING", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("03/22/2025"),
              Text("OFFICE OF SWISA", textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _externalLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("EXTERNAL LINKS", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          children: [
            _externalLinkCard(),
            SizedBox(width: 10),
            _externalLinkCard(),
            SizedBox(width: 10),
            _externalLinkCard(),
          ],
        )
      ],
    );
  }

  Widget _externalLinkCard() {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Placeholder(fallbackHeight: 50), // Replace with actual logo
              SizedBox(height: 8),
              Text("DEPARTMENT OF AGRICULTURE", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
              Text("WEBSITE", style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
