import 'package:flutter/material.dart';
import 'slider_drawer.dart';
import 'DisplayPage.dart'; // تأكد من استيراد هذه الصفحة

class SectionsPage extends StatefulWidget {
  const SectionsPage({super.key});

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 205, 182, 101),
        title: const Text('  Anatomy System'),
      ),
      drawer: SliderDrawer(
        setLocale: (Locale) {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildImageRow(context, [
                {
                  'path': 'images/a.jpg',
                  'title': '  integumentary system',
                  'description':
                      'The skeletal system includes all of the bones and joints in the body.'
                },
                {
                  'path': 'images/b.jpg',
                  'title': ' Muscular System  ',
                  'description':
                      'The muscular system is responsible for the movement of the human body.'
                },
              ]),
              const SizedBox(height: 30),
              buildImageRow(context, [
                {
                  'path': 'images/c.jpg',
                  'title': ' Cardiovascular System  ',
                  'description':
                      'The cardiovascular system consists of the heart, blood vessels, and the approximately 5 liters of blood that the blood vessels transport.'
                },
                {
                  'path': 'images/d.jpg',
                  'title': ' Digestive System  ',
                  'description':
                      'The digestive system is a group of organs working together to convert food into energy and basic nutrients to feed the entire body.'
                },
              ]),
              const SizedBox(height: 30),
              buildImageRow(context, [
                {
                  'path': 'images/f.jpg',
                  'title': ' Endocrine System  ',
                  'description':
                      'The endocrine system includes all of the glands of the body and the hormones produced by those glands. '
                },
                {
                  'path': 'images/ff.jpg',
                  'title': ' Nervous System  ',
                  'description':
                      'the nervous system consists of the brain, spinal cord, sensory organs, and all of the nerves that connect these organs with the rest of the body.'
                },
              ]),
              const SizedBox(height: 30),
              buildImageRow(context, [
                {
                  'path': 'images/fff.jpg',
                  'title': ' Respiratory System  ',
                  'description':
                      'The cells of the human body require a constant stream of oxygen to stay alive.'
                },
                {
                  'path': 'images/ffff.jpg',
                  'title': ' Immune/Lymphatic System  ',
                  'description':
                      'The immune and lymphatic systems are two closely related organ systems that share several organs and physiological functions. '
                },
              ]),
              const SizedBox(height: 30),
              buildImageRow(context, [
                {
                  'path': 'images/fffff.jpg',
                  'title': ' Urinary System  ',
                  'description':
                      'The urinary system consists of the kidneys, ureters, urinary bladder, and urethra. '
                },
                {
                  'path': 'images/ffffff.jpg',
                  'title': ' Female Reproductive System  ',
                  'description':
                      'The female reproductive system includes the ovaries, fallopian tubes, uterus, vagina, vulva, mammary glands and breasts.'
                },
              ]),
              const SizedBox(height: 30),
              buildImageRow(context, [
                {
                  'path': 'images/fffffff.jpg',
                  'title': 'Male Reproductive System  ',
                  'description':
                      'The male reproductive system includes the scrotum, testes, spermatic ducts, and penis. '
                },
                {
                  'path': 'images/ffffffff.jpg',
                  'title': ' Integumentary System  ',
                  'description':
                      'The integumentary system is an organ system consisting of the skin, hair, nails, and exocrine glands. The skin is only a few millimeters thick yet is by far the largest organ in the body.'
                },
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageRow(BuildContext context, List<Map<String, String>> images) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: images.map((image) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayPage(
                    imagePath: image['path']!,
                    title: image['title']!,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 130, 130, 130)
                        .withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // الصورة في اليسار
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image['path']!,
                      width: 130,
                      height: 130,
                    ),
                  ),
                  const SizedBox(width: 15), // مساحة بين الصورة والنص
                  // العنوان والوصف في الجهة اليمنى
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // العنوان
                        Text(
                          image['title']!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 84, 202, 157),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // الوصف
                        Text(
                          image['description']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
