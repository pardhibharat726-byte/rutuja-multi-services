import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const RutujaApp());
}

class RutujaApp extends StatelessWidget {
  const RutujaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutuja Multi Services',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF5722)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String contactNumber = "919876543210"; 
  final String mapUrl = "https://maps.google.com";

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {'title': 'सरकारी योजना', 'desc': 'लाडकी बहीण, शेतकरी योजना, पिक विमा', 'icon': Icons.account_balance},
      {'title': 'आधार व पॅन कार्ड', 'desc': 'नवीन नोंदणी, दुरुस्ती व पीव्हीसी कार्ड', 'icon': Icons.badge},
      {'title': 'ऑनलाइन नोकरी अर्ज', 'desc': 'सर्व सरकारी व खाजगी भरती अर्ज', 'icon': Icons.assignment},
      {'title': 'दाखले व प्रमाणपत्रे', 'desc': 'उत्पन्न, जात प्रमाणपत्र, डोमासाईल', 'icon': Icons.description},
      {'title': 'बिल भरणा व रिचार्ज', 'desc': 'लाईट बिल, मोबाईल, फास्टॅग रिचार्ज', 'icon': Icons.payment},
      {'title': 'झेरॉक्स व प्रिंटिंग', 'desc': 'कलर प्रिंट, लॅमिनेशन, पासपोर्ट फोटो', 'icon': Icons.print},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ऋतुजा मल्टी सर्व्हिसेस', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFF5722),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.storefront, size: 40, color: Color(0xFFFF5722)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'सर्व शासकीय योजना व ऑनलाइन अर्ज सेवा एकाच ठिकाणी उपलब्ध.',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _openUrl('tel:$contactNumber'),
                    icon: const Icon(Icons.call, color: Colors.white),
                    label: const Text('कॉल करा', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _openUrl('https://wa.me/$contactNumber?text=नमस्कार, मला सेवांची चौकशी करायची आहे.'),
                    icon: const Icon(Icons.chat, color: Colors.white),
                    label: const Text('व्हॉट्सॲप', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF25D366)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _openUrl(mapUrl),
                    icon: const Icon(Icons.location_on, color: Colors.white),
                    label: const Text('पत्ता', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('उपलब्ध सेवा', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final s = services[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: Icon(s['icon'], color: const Color(0xFFFF5722)),
                    ),
                    title: Text(s['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(s['desc']),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {
                      _openUrl('https://wa.me/$contactNumber?text=मला ${s['title']} बद्दल माहिती हवी आहे.');
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
