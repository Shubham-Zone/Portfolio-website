import 'package:flutter/material.dart';

class SkillsCard extends StatefulWidget {

  final String title;
  final String skills;

  const SkillsCard({super.key, required this.title, required this.skills});

  @override
  _SkillsCardState createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: isHovered
            ? MediaQuery.of(context).size.width > 800
            ? 420
            : 320
            : MediaQuery.of(context).size.width > 800
            ? 400
            : 300,
        height: isHovered ? 300 : 250,
        transform: Matrix4.rotationZ(isHovered ? 0.02 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: isHovered ? 20 : 16,
            ),
          ],
          color: isHovered ? Colors.teal[100] : Colors.yellow[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.skills,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Other Skills...',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: const Text('Dynamic Skills Card')),
//       body: const Center(
//         child: SkillsCard(
//           title: 'Flutter Developer',
//           skills: 'Flutter, Dart, UI/UX Design',
//         ),
//       ),
//     ),
//   ));
// }
