import 'package:flutter/material.dart';

void main() => runApp(const UthmanSchoolApp());

class UthmanSchoolApp extends StatelessWidget {
  const UthmanSchoolApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'مدرسة عثمان بن عفان',
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar'), Locale('en')],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1769AA)),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF5F8FC),
          fontFamily: 'Arial',
        ),
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: WelcomePage(),
        ),
      );
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
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: ListView(
                padding: const EdgeInsets.all(24),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 24),
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: const Color(0xFFE2EFFB),
                    child: Icon(Icons.account_balance, size: 44, color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 18),
                  const Text('مدرسة عثمان بن عفان الثانوية الشاملة للبنين',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('بوابتك المدرسية الرقمية', textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15)),
                  const SizedBox(height: 32),
                  const Text('اختر نوع الحساب', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  for (final role in roles)
                    Card(
                      elevation: 0,
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFEAF3FC),
                          child: Icon(role.$2, color: Theme.of(context).colorScheme.primary),
                        ),
                        title: Text(role.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                        trailing: const Icon(Icons.chevron_left),
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => SignInPage(role: role.$1),
                        )),
                      ),
                    ),
                  const SizedBox(height: 18),
                  const Text('نسخة تأسيسية — لا تُدخل بيانات طلاب حقيقية قبل تفعيل المصادقة وقواعد الحماية واعتماد المدرسة.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                ],
              ),
            ),
          ),
        ),
      );
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('تسجيل الدخول — $role')),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.lock_outline, size: 48, color: Color(0xFF1769AA)),
                const SizedBox(height: 16),
                const Text('سيتم ربط تسجيل الدخول بخدمة Firebase بعد إعداد ملفات المنصة.', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                const TextField(decoration: InputDecoration(labelText: 'البريد الإلكتروني', border: OutlineInputBorder()), keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 12),
                const TextField(decoration: InputDecoration(labelText: 'كلمة المرور', border: OutlineInputBorder()), obscureText: true),
                const SizedBox(height: 16),
                const Text('تسجيل الدخول غير مفعّل في هذه النسخة التأسيسية.', style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
              ]),
            ),
          ),
        ),
      );
}
