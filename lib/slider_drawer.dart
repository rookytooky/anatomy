import 'package:flutter/material.dart';

// مكون قائمة الهامبرغر الجانبية
class SliderDrawer extends StatelessWidget {
  final Function(Locale)? setLocale;

  const SliderDrawer({super.key, this.setLocale});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              'القائمة الرئيسية',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.teal),
            title: const Text('الصفحة الرئيسية'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.teal),
            title: const Text('تسجيل الخروج'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.teal),
            title: const Text('حول التطبيق'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'تطبيق تعليم جسم الإنسان',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.info, color: Colors.teal),
                children: [
                  const Text(
                      'هذا التطبيق يساعد الأطفال في التعرف على جسم الإنسان وأعضائه بطريقة تفاعلية وممتعة.'),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_new, color: Colors.teal),
            title: const Text('أقسام جسم الإنسان'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Sectionspage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.teal),
            title: const Text('تغيير اللغة'),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),
          // إضافة خيار الفيديو
          ListTile(
            leading: const Icon(Icons.video_library, color: Colors.teal),
            title: const Text('مشاهدة الفيديوهات'),
            onTap: () {
              Navigator.pushNamed(
                  context, '/videoPage'); // اذهب إلى صفحة الفيديو
            },
          ),

          // إضافة خيار الاختبار
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('اختر اللغة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('العربية'),
                onTap: () {
                  if (setLocale != null) {
                    setLocale!(const Locale('ar')); // تغيير اللغة إلى العربية
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  if (setLocale != null) {
                    setLocale!(const Locale('en')); // تغيير اللغة إلى الإنجليزية
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
