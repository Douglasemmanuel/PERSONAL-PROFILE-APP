import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.latoTextTheme(), // apply globally if desired
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage:
                    AssetImage('assets/images/Douglas.jpeg'), // Add your image here
              ),
              const SizedBox(height: 20),

              // Fixed: removed const + applied GoogleFonts
              Text(
                'Douglas Emmanuel',
                style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                'Flutter Developer | Tech Enthusiast',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const Divider(height: 40, thickness: 1),
              _buildSectionTitle('About Me'),

              Text(
                'I am a passionate Flutter developer with a love for creating beautiful and functional mobile apps.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontSize: 16),
              ),

              const SizedBox(height: 20),
              _buildSectionTitle('Skills'),
              _buildSkillChips(['Flutter', 'Dart', 'Firebase', 'UI/UX', 'Git']),
              const SizedBox(height: 20),
              _buildSectionTitle('Contact'),
              _buildContactCard(Icons.email, 'emmanueldouglas2121@gmail.com'),
              _buildContactCard(Icons.web,
              'https://douglas-portfoilo.vercel.app/',
               url: 'https://douglas-portfoilo.vercel.app/',
              ),
              _buildContactCard(Icons.code,
              'https://github.com/Douglasemmanuel/',
               url: 'https://github.com/Douglasemmanuel/',
               ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal[800],
        ),
      ),
    );
  }

  Widget _buildSkillChips(List<String> skills) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills.map((skill) {
        return Chip(
          label: Text(
            skill,
            style: GoogleFonts.lato(),
          ),
          backgroundColor: Colors.teal[100],
        );
      }).toList(),
    );
  }

  Widget _buildContactCard(IconData icon, String content,{String? url}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          content,
          style: GoogleFonts.lato(fontSize: 16),
        ),
        onTap: url != null ? () => _launchURL(url) : null,

      ),
    );
  }
}

void _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}


