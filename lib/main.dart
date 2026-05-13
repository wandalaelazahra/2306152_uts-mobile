import 'package:flutter/material.dart';

import './pages/login_page.dart';
import './widgets/chips.widget.dart';
import './widgets/quest_widget.dart';
import './widgets/header.widget.dart';
// Wanda Laela Zahra - 2306152
void main() {
  runApp(const MyApp());
}

class QuestData {
  final String title;
  final String rank;
  final String reward;
  final int rewardGold;
  final String desc;
  final String imageUrl;
  bool isTaken;

  QuestData({
    required this.title,
    required this.rank,
    required this.reward,
    required this.rewardGold,
    required this.desc,
    required this.imageUrl,
    this.isTaken = false,
  });
}

const Color primaryPink = Color(0xFFFF1493);
const Color accentPink = Color(0xFFFF69B4);
const Color bgBlack = Color(0xFF000000);
const Color surfaceGray = Color(0xFF1A1A1A);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guild Petualang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, 
        scaffoldBackgroundColor: bgBlack, 
        fontFamily: 'Georgia', 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: primaryPink, 
          elevation: 0,
          centerTitle: true,
        ),
        colorScheme: const ColorScheme.dark(
          primary: primaryPink,
          secondary: accentPink,
          surface: surfaceGray,
          onSurface: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: (datas) {
        if (datas.name == "/") {
          if (datas.arguments == null || datas.arguments is! Map) {
            return MaterialPageRoute(builder: (context) => const LoginPage());
          }
          final args = Map<String, dynamic>.from(datas.arguments as Map);
          return MaterialPageRoute(builder: (context) => HomePage(userData: args));
        }
        return null;
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;
  const HomePage({super.key, required this.userData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<QuestData> quests = [
    QuestData(
      title: "Mata Air Kecantikan Abadi", rank: "A", 
      reward: "500 Gold", rewardGold: 500,
      desc: "Temukan mata air tersembunyi yang konon memberikan kecantikan abadi kepada siapa pun yang meminumnya.",
      imageUrl: "assets/air.jpg", 
    ),
    QuestData(
      title: "Rawat Pegasus Sang Ratu", rank: "C", 
      reward: "200 Gold", rewardGold: 200,
      desc: "Bantu merawat Pegasus putih milik Sang Ratu di taman istana yang indah.",
      imageUrl: "assets/pegasus.jpg", 
    ),
    QuestData(
      title: "Sutra Surgawi", rank: "SSS", 
      reward: "10.000 Gold", rewardGold: 10000,
      desc: "Kumpulkan benang sutra surgawi dari laba-laba kristal untuk gaun pernikahan sang putri.",
      imageUrl: "assets/sutra.jpg", 
    ),
    QuestData(
      title: "Akademi Kecantikan", rank: "F", 
      reward: "10 Gold", rewardGold: 10,
      desc: "Bantu membersihkan taman Akademi Kecantikan dari gangguan kelinci liar yang nakal.",
      imageUrl: "assets/akademi.jpg", 
    ),
    QuestData(
      title: "Berlian Merah Muda", rank: "B", 
      reward: "350 Gold", rewardGold: 350,
      desc: "Cari berlian merah muda langka di dalam Goa Kristal yang mempesona.",
      imageUrl: "assets/berlian.jpg", 
    ),
    QuestData(
      title: "Kelopak Mawar Langka", rank: "D", 
      reward: "100 Gold", rewardGold: 100,
      desc: "Kumpulkan kelopak mawar hitam langka yang hanya mekar saat bulan purnama di taman rahasia.",
      imageUrl: "assets/mawar.jpg", 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final String name = widget.userData['name'] ?? 'Petualang';
    final int level = int.tryParse(widget.userData['level']?.toString() ?? '1') ?? 1;
    final String rank = widget.userData['rank'] ?? 'F';
    final String job = widget.userData['job'] ?? 'Novice';

    return Scaffold(
      appBar: AppBar(title: const Text("ADVENTURE GUILD", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2))),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: bgBlack,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(name: name, level: level, role: job, rank: rank),
                const SizedBox(height: 16),
                
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ChipsWidget(color: Color(0xFFFF1493), icon: Icons.favorite, label: "HP", value: "80", iconSize: 24),
                    ChipsWidget(color: Color(0xFF9C27B0), icon: Icons.auto_fix_high, label: "Mana", value: "120", iconSize: 18),
                    ChipsWidget(color: Color(0xFFFF69B4), icon: Icons.star, label: "Charm", value: "200", iconSize: 20),
                  ],
                ),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
          
          Divider(thickness: 1, color: Colors.grey.shade800),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [primaryPink, Colors.purpleAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "QUEST LOG", 
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w900, 
                    color: Colors.white, 
                    letterSpacing: 3,
                    shadows: [Shadow(color: primaryPink, blurRadius: 10)]
                  )
                ),
                const Spacer(),
                const Icon(Icons.filter_list, color: primaryPink, size: 20),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: quests.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final quest = quests[index];
                return QuestWidget(
                  title: quest.title,
                  rank: quest.rank,
                  isTaken: quest.isTaken,
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailQuestPage(quest: quest)),
                    );

                    if (result == true && !quest.isTaken) {
                      setState(() {
                        quest.isTaken = true;
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailQuestPage extends StatelessWidget {
  final QuestData quest;
  const DetailQuestPage({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DATA QUEST', style: TextStyle(letterSpacing: 2))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primaryPink.withValues(alpha: 0.5), width: 3),
                boxShadow: [BoxShadow(color: primaryPink.withValues(alpha: 0.2), blurRadius: 20)],
                image: DecorationImage(
                  image: AssetImage(quest.imageUrl), 
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken),
                  onError: (exception, stackTrace) => debugPrint('Gambar tidak ditemukan'),
                ),
              ),
              child: quest.imageUrl.isEmpty ? const Icon(Icons.auto_awesome_motion, size: 60, color: primaryPink) : null,
            ),
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceGray,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quest.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  Text("Rank: ${quest.rank}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryPink)),
                  const SizedBox(height: 16),
                  Text(quest.desc, style: const TextStyle(fontSize: 15, color: Colors.white70, height: 1.5)),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: quest.isTaken ? [Colors.grey.shade900, Colors.grey.shade800] : [primaryPink, accentPink],
                ),
                boxShadow: quest.isTaken ? [] : [BoxShadow(color: primaryPink.withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 5))],
              ),
              child: ElevatedButton(
                onPressed: quest.isTaken ? null : () => Navigator.pop(context, true), 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  quest.isTaken ? 'QUEST SELESAI' : 'ACCEPT QUEST',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}