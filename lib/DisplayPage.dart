import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final String imagePath;
  final String title;

  const DisplayPage({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // استخدام Stack لتراكب التأشيرات فوق الصورة
            SizedBox(
              width: 300,
              height: 400,
              child: Stack(
                children: [
                  // الصورة داخل InteractiveViewer لتفعيل التكبير والتصغير
                  ClipRect(
                    child: InteractiveViewer(
                      minScale: 0.5, // الحد الأدنى للتكبير
                      maxScale: 4.0, // الحد الأقصى للتكبير
                      child: Image.asset(
                        imagePath,
                        width: 500,
                        height: 600,
                      ),
                    ),
                  ),
                  // التأشيرة الأولى
                  Positioned(
                    top: 80,
                    left: 140,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            content: Text("تفاصيل عن هذا الجزء الأول"),
                          ),
                        );
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 71, 188, 151),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  // التأشيرة الثانية
                  Positioned(
                    top: 200,
                    left: 150,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            content: Text("تفاصيل عن هذا الجزء الثاني"),
                          ),
                        );
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 92, 202, 147),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  // التأشيرة الثالثة
                  Positioned(
                    top: 300,
                    left: 100,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            content: Text("تفاصيل عن هذا الجزء الثالث"),
                          ),
                        );
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 93, 207, 164),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
