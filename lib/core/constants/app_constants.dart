class AppConstants {
  AppConstants._();

  static const String companyName = 'CodersThink Software Ltd.';
  static const String companyTagline = 'Engineering Tomorrow\'s Digital World';
  static const String companySubtitle =
      'Premium software solutions that transform businesses and communities across Bangladesh and Canada.';
  static const String companyEmail = 'codersthinksoftwareltd@gmail.com';
  static const String companyPhone = '+8801672593932'; // Default
  static const String companyPhoneBD = '+8801672593932';
  static const String companyPhoneCA = '+1 (613) 797-8696';
  static const String companyWhatsAppBD = '+8801672593932';
  static const String companyWhatsAppCA = '+1 (613) 797-8696';
  static const String companyAddress = 'Dhaka, Bangladesh';
  static const String companyWebsite = 'https://codersthink.com';

  static const String linkedIn = 'https://linkedin.com/company/codersthink';
  static const String github = 'https://github.com/codersthink';
  static const String twitter = 'https://twitter.com/codersthink';
  static const String facebook = 'https://www.facebook.com/profile.php?id=61589728901086';

  static const String homeRoute = '/';
  static const String aboutRoute = '/about';
  static const String servicesRoute = '/services';
  static const String portfolioRoute = '/portfolio';
  static const String careersRoute = '/careers';
  static const String contactRoute = '/contact';

  static const List<Map<String, dynamic>> services = [
    {
      'id': 'attendance',
      'title': 'Smart Attendance',
      'subtitle': 'AI-powered biometric & RFID attendance management',
      'description':
          'A comprehensive digital attendance solution combining facial recognition, fingerprint scanning, and RFID technology. Real-time dashboards, automated reports, and seamless HR integration make attendance tracking effortless for organizations of any size.',
      'icon': '🎯',
      'color': 0xFF6C63FF,
      'features': ['Facial Recognition', 'RFID Integration', 'Real-time Reports', 'HR System Sync', 'Mobile App', 'Cloud Storage'],
    },
    {
      'id': 'cooperative',
      'title': 'Smart Co-Operative Management',
      'subtitle': 'Full-stack cooperative banking & member management',
      'description':
          'An end-to-end digital platform for cooperative societies to manage member accounts, deposits, loans, dividends, and governance. Built with security and transparency at its core.',
      'icon': '🏦',
      'color': 0xFF00D4FF,
      'features': ['Member Management', 'Loan Processing', 'Deposit Tracking', 'Dividend Calculation', 'Financial Reports', 'Digital Passbook'],
    },
    {
      'id': 'school',
      'title': 'Smart School Management',
      'subtitle': 'Comprehensive ERP for modern educational institutions',
      'description':
          'A powerful school management system covering admissions, attendance, examination management, fee collection, library, transport, and parent communication — all in one seamless platform.',
      'icon': '🎓',
      'color': 0xFF10B981,
      'features': ['Student ERP', 'Exam Management', 'Fee Collection', 'Parent Portal', 'Library Module', 'Transport Tracking'],
    },
    {
      'id': 'madrasa',
      'title': 'Smart Madrasa Management',
      'subtitle': 'Specialized management for Islamic educational institutions',
      'description':
          'Designed specifically for Madrasas, this system handles Quran progress tracking, Islamic curriculum management, hifz monitoring, student profiles, and Arabic-language support with RTL layout.',
      'icon': '☪️',
      'color': 0xFFF59E0B,
      'features': ['Quran Progress Tracking', 'Hifz Monitoring', 'Arabic RTL Support', 'Islamic Calendar', 'Hostel Management', 'Scholarship Module'],
    },
    {
      'id': 'prescription',
      'title': 'Smart Doctors Prescription',
      'subtitle': 'Digital prescription & clinic management for healthcare professionals',
      'description':
          'A modern clinical management platform enabling doctors to issue digital prescriptions, manage patient records, schedule appointments, and access a comprehensive drug database — improving healthcare delivery.',
      'icon': '💊',
      'color': 0xFFFF6584,
      'features': ['Digital Prescriptions', 'Patient Records', 'Drug Database', 'Appointment Booking', 'Lab Integration', 'Telemedicine'],
    },
  ];

  static const List<Map<String, dynamic>> portfolioItems = [
    {
      'title': 'Dhaka Cooperative Bank Portal',
      'category': 'Cooperative',
      'description': 'Full digital transformation for a 10,000+ member cooperative society',
      'tech': ['Flutter', 'Firebase', 'Node.js'],
      'color': 0xFF00D4FF,
    },
    {
      'title': 'EduTrack School ERP',
      'category': 'School',
      'description': 'Comprehensive school management for 15 institutions across Dhaka',
      'tech': ['Flutter Web', 'PostgreSQL', 'REST API'],
      'color': 0xFF10B981,
    },
    {
      'title': 'Al-Amin Madrasa System',
      'category': 'Madrasa',
      'description': 'Islamic educational management with Quran tracking for 2000+ students',
      'tech': ['Flutter', 'Firebase', 'Arabic NLP'],
      'color': 0xFFF59E0B,
    },
    {
      'title': 'HealthDesk Prescription App',
      'category': 'Healthcare',
      'description': 'Digital prescription platform serving 200+ doctors in Sylhet',
      'tech': ['Flutter', 'Node.js', 'MongoDB'],
      'color': 0xFFFF6584,
    },
    {
      'title': 'AttendSmart Enterprise',
      'category': 'Attendance',
      'description': 'Biometric attendance for 5000+ employees across 20 factories',
      'tech': ['Flutter', 'OpenCV', 'Firebase'],
      'color': 0xFF6C63FF,
    },
    {
      'title': 'UniverERP Campus System',
      'category': 'Education',
      'description': 'University-level ERP covering all administrative functions',
      'tech': ['Flutter Web', 'Django', 'PostgreSQL'],
      'color': 0xFF9B94FF,
    },
  ];

  static const List<Map<String, String>> teamMembers = [
    {'name': 'Arif Rahman', 'role': 'CEO & Co-Founder', 'bio': '10+ years in enterprise software development', 'emoji': '👨‍💼'},
    {'name': 'Nadia Islam', 'role': 'CTO & Lead Architect', 'bio': 'Flutter expert & cloud infrastructure specialist', 'emoji': '👩‍💻'},
    {'name': 'Karim Hossain', 'role': 'Head of Design', 'bio': 'UI/UX designer with a passion for pixel-perfect interfaces', 'emoji': '🎨'},
    {'name': 'Sarah Khan', 'role': 'Head of Sales', 'bio': 'Building partnerships across South Asia', 'emoji': '🤝'},
  ];

  static const List<Map<String, String>> jobs = [
    {'title': 'Senior Flutter Developer', 'type': 'Full-time', 'location': 'Dhaka / Remote', 'department': 'Engineering', 'description': 'Build premium mobile and web apps with Flutter & Dart.'},
    {'title': 'UI/UX Designer', 'type': 'Full-time', 'location': 'Dhaka', 'department': 'Design', 'description': 'Craft beautiful, user-centered digital experiences.'},
    {'title': 'Backend Developer', 'type': 'Full-time', 'location': 'Remote', 'department': 'Engineering', 'description': 'Design scalable APIs and cloud infrastructure with Node.js & Firebase.'},
    {'title': 'Business Development Executive', 'type': 'Full-time', 'location': 'Dhaka', 'department': 'Sales', 'description': 'Drive growth by identifying new business opportunities across sectors.'},
  ];
}
