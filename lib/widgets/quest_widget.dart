import 'package:flutter/material.dart';

class QuestWidget extends StatelessWidget {
  final String title;
  final String rank;
  final bool isTaken;
  final VoidCallback onTap;

  const QuestWidget({
    super.key,
    required this.title,
    required this.rank,
    required this.isTaken,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFFF1493);
    const Color surfaceGray = Color(0xFF1A1A1A);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isTaken 
              ? [primaryPink.withValues(alpha: 0.15), Colors.purpleAccent.withValues(alpha: 0.05)] 
              : [surfaceGray, surfaceGray.withValues(alpha: 0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isTaken ? primaryPink.withValues(alpha: 0.5) : Colors.white12, 
            width: isTaken ? 2 : 1,
          ),
          boxShadow: isTaken 
            ? [BoxShadow(color: primaryPink.withValues(alpha: 0.1), blurRadius: 10)] 
            : [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 5)],
        ),
        child: Row(
          children: [
            Icon(
              isTaken ? Icons.auto_awesome : Icons.favorite_border,
              color: isTaken ? primaryPink : Colors.white24,
              size: isTaken ? 32 : 24, // Varied size based on status
            ),
            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, 
                    style: TextStyle(
                      color: isTaken ? Colors.white : Colors.white70, 
                      fontWeight: isTaken ? FontWeight.w900 : FontWeight.bold, 
                      fontSize: 17,
                      letterSpacing: 0.5,
                    )
                  ),
                  const SizedBox(height: 4),
                  Text("Rank: $rank", style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}