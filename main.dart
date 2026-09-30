
import 'package:flutter/material.dart';

void main() => runApp(const UthmanSchoolApp());

class UthmanSchoolApp extends StatelessWidget {
  const UthmanSchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مدرسة عثمان بن عفان',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1769AA),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        fontFamily: 'Arial',
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: WelcomePage(),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const roles = [
    ('طالب', Icons.school_outlined),
    ('ولي أمر', Icons.family_restroom),
    ('معلم', Icons.menu_book_outlined),
    ('إدارة المدرسة', Icons.admin_panel_settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const SizedBox(height: 35),
                const CircleAvatar(
                  radius: 48,
                  backgroundColor: Color(0xFFE2EFFB),
                  child: Icon(
                    Icons.account_balance,
                    size: 50,
                    color: Color(0xFF1769AA),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'مدرسة عثمان بن عفان الثانوية الشاملة للبنين',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'بوابتك المدرسية الرقمية',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 35),
                const Text(
                  'اختر نوع الحساب',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                for (final role in roles)
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFEAF3FC),
                        child: Icon(
                          role.$2,
                          color: const Color(0xFF1769AA),
                        ),
                      ),
                      title: Text(
                        role.$1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_left),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignInPage(role: role.$1),
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 20),
                const Text(
                  'نسخة تجريبية. تسجيل الدخول وحفظ البيانات غير مفعّلين بعد.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول — $role')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.lock_outline,
                  size: 55,
                  color: Color(0xFF1769AA),
                ),
                const SizedBox(height: 20),
                Text(
                  'مرحبًا بك في حساب $role',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'اسم المستخدم أو البريد الإلكتروني',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 15),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DashboardPage(role: role),
                        ),
                      );
                    },
                    child: const Text('دخول تجريبي'),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'الدخول هنا تجريبي فقط ولا يتحقق من بيانات الحساب.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.role});

  final String role;

  List<Map<String, dynamic>> get services {
    if (role == 'طالب') {
      return [
        {'title': 'علاماتي', 'icon': Icons.grade, 'desc': 'عرض العلامات المدرسية'},
        {'title': 'الحضور والغياب', 'icon': Icons.fact_check, 'desc': 'متابعة سجل الحضور'},
        {'title': 'الجدول المدرسي', 'icon': Icons.calendar_month, 'desc': 'الحصص وأوقاتها'},
        {'title': 'الواجبات', 'icon': Icons.assignment, 'desc': 'الواجبات المطلوبة'},
        {'title': 'الإعلانات', 'icon': Icons.campaign, 'desc': 'إعلانات المدرسة'},
      ];
    }
    if (role == 'ولي أمر') {
      return [
        {'title': 'أبنائي', 'icon': Icons.family_restroom, 'desc': 'متابعة الأبناء'},
        {'title': 'العلامات', 'icon': Icons.grade, 'desc': 'التحصيل الدراسي'},
        {'title': 'الحضور والغياب', 'icon': Icons.fact_check, 'desc': 'متابعة الغياب'},
        {'title': 'الواجبات', 'icon': Icons.assignment, 'desc': 'واجبات الأبناء'},
        {'title': 'الإعلانات', 'icon': Icons.campaign, 'desc': 'أخبار المدرسة'},
      ];
    }
    if (role == 'معلم') {
      return [
        {'title': 'صفوفي', 'icon': Icons.groups, 'desc': 'الصفوف والشعب'},
        {'title': 'رصد العلامات', 'icon': Icons.edit_note, 'desc': 'إدخال العلامات'},
        {'title': 'الحضور والغياب', 'icon': Icons.fact_check, 'desc': 'تسجيل الحضور'},
        {'title': 'الواجبات', 'icon': Icons.assignment, 'desc': 'إضافة الواجبات'},
        {'title': 'الإعلانات', 'icon': Icons.campaign, 'desc': 'إعلانات الصفوف'},
      ];
    }
    return [
      {'title': 'إدارة الطلبة', 'icon': Icons.school, 'desc': 'ملفات الطلبة'},
      {'title': 'إدارة المعلمين', 'icon': Icons.co_present, 'desc': 'بيانات المعلمين'},
      {'title': 'الصفوف والشعب', 'icon': Icons.meeting_room, 'desc': 'إعداد الصفوف'},
      {'title': 'التقارير', 'icon': Icons.bar_chart, 'desc': 'التقارير المدرسية'},
      {'title': 'الإعلانات', 'icon': Icons.campaign, 'desc': 'نشر الإعلانات'},
      {'title': 'إعدادات المدرسة', 'icon': Icons.settings, 'desc': 'إعدادات التطبيق'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = services;

    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة المدرسة'),
        actions: [
          IconButton(
            tooltip: 'تسجيل الخروج',
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const WelcomePage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1769AA),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_balance,
                    color: Colors.white,
                    size: 38,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'مدرسة عثمان بن عفان الثانوية الشاملة للبنين',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'لوحة تحكم $role',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'الخدمات المدرسية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FeaturePage(
                            role: role,
                            title: item['title'] as String,
                            description: item['desc'] as String,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            size: 38,
                            color: const Color(0xFF1769AA),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item['title'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['desc'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
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

class FeaturePage extends StatelessWidget {
  const FeaturePage({
    super.key,
    required this.role,
    required this.title,
    required this.description,
  });

  final String role;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.construction,
                    size: 55,
                    color: Color(0xFF1769AA),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'سيتم تفعيل هذه الخدمة وربطها بقاعدة البيانات في المرحلة التالية.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('رجوع'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
