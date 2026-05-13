import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;
  final String rank;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.role,
    required this.level,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFFF1493);
    const Color surfaceGray = Color(0xFF1A1A1A);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [surfaceGray, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryPink.withValues(alpha: 0.2), width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 15, offset: const Offset(0, 8))
        ]
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: primaryPink.withValues(alpha: 0.3), blurRadius: 15, spreadRadius: 2)],
                ),
                child: const CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage("assets/wanda.png"), 
                ),
              ),
              Positioned(
                bottom: -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [primaryPink, Colors.purpleAccent]),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: primaryPink.withValues(alpha: 0.3), blurRadius: 5)]
                  ),
                  child: Text("LVL $level", style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900)),
                ),
              )
            ],
          ),
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(role, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryPink.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: primaryPink),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(colors: [primaryPink, Colors.purpleAccent]).createShader(bounds),
              child: Text(
                rank.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900),
              ),
            ),
          )
        ],
      ),
    );
  }
}