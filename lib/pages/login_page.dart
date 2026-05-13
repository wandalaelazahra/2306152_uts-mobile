import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _rankController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  final Color primaryPink = const Color(0xFFFF1493);
  final Color bgBlack = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      body: Stack(
        children: [
          // Background Glow
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryPink.withValues(alpha: 0.15),
                boxShadow: [BoxShadow(color: primaryPink.withValues(alpha: 0.1), blurRadius: 100, spreadRadius: 50)],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryPink.withValues(alpha: 0.1),
                boxShadow: [BoxShadow(color: primaryPink.withValues(alpha: 0.05), blurRadius: 80, spreadRadius: 40)],
              ),
            ),
          ),
          
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // New Logo Style
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryPink.withValues(alpha: 0.5), width: 2),
                            boxShadow: [
                              BoxShadow(color: primaryPink.withValues(alpha: 0.2), blurRadius: 30, spreadRadius: 5)
                            ],
                          ),
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [primaryPink, Colors.purpleAccent],
                            ).createShader(bounds),
                            child: const Icon(Icons.favorite, size: 80, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "WANDA'S WORLD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32, 
                          fontWeight: FontWeight.w900, 
                          color: Colors.white, 
                          letterSpacing: 6,
                          shadows: [Shadow(color: primaryPink, blurRadius: 15)]
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "ENTER THE BEAUTY REALM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12, 
                          fontWeight: FontWeight.bold, 
                          color: primaryPink.withValues(alpha: 0.8), 
                          letterSpacing: 2
                        ),
                      ),
                      const SizedBox(height: 48),

                      _buildInput(
                        controller: _nameController,
                        label: "Identitas Cantik Anda",
                        icon: Icons.person_outline,
                        validator: (value) => (value == null || value.isEmpty) ? "Siapa namamu, cantik?" : null,
                      ),
                      _buildInput(
                        controller: _passwordController,
                        label: "Kode Rahasia (Min 8 Karakter)",
                        icon: Icons.lock_outline,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Masukkan kode rahasia";
                          if (value.length < 8) return "Kode terlalu pendek";
                          return null;
                        },
                      ),
                      _buildInput(
                        controller: _levelController,
                        label: "Level Pencapaian",
                        icon: Icons.trending_up,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Level harus diisi";
                          if (int.tryParse(value) == null) return "Hanya angka";
                          return null;
                        },
                      ),
                      _buildInput(
                        controller: _rankController,
                        label: "Rank (A-F/S)",
                        icon: Icons.military_tech,
                        validator: (value) => (value == null || value.isEmpty) ? "Rank harus diisi" : null,
                      ),
                      _buildInput(
                        controller: _jobController,
                        label: "Kelas Job",
                        icon: Icons.work_outline,
                        validator: (value) => (value == null || value.isEmpty) ? "Job harus diisi" : null,
                      ),
                      
                      const SizedBox(height: 24),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [primaryPink, Colors.purpleAccent]),
                          boxShadow: [
                            BoxShadow(color: primaryPink.withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 5))
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(context, "/", arguments: {
                                "name": _nameController.text,
                                "level": _levelController.text,
                                "rank": _rankController.text,
                                "job": _jobController.text,
                              });
                            }
                          },
                          child: const Text(
                            "MASUK DUNIA CANTIK", 
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: primaryPink.withValues(alpha: 0.7)),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.03),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: primaryPink, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          ),
        ),
        validator: validator,
      ),
    );
  }
}