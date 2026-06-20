// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'WhatsApp Redirect',
//       home: const WhatsAppForm(),
//     );
//   }
// }

// class WhatsAppForm extends StatefulWidget {
//   const WhatsAppForm({super.key});

//   @override
//   State<WhatsAppForm> createState() => _WhatsAppFormState();
// }

// class _WhatsAppFormState extends State<WhatsAppForm> {
//   final nameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();

//   /// 👉 Replace with YOUR WhatsApp number (country code mandatory)
//   final String ownerWhatsAppNumber = "918381835445";

//   void sendToWhatsApp() async {
//     final name = nameController.text.trim();
//     final phone = phoneController.text.trim();
//     final email = emailController.text.trim();

//     if (name.isEmpty || phone.isEmpty || email.isEmpty) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
//       return;
//     }

//     final message =
//         """
// Hello 👋
// I want to connect with you.

// 👤 Name: $name
// 📞 Phone: $phone
// 📧 Email: $email
// """;

//     final encodedMessage = Uri.encodeComponent(message);

//     final url = Uri.parse(
//       "https://wa.me/$ownerWhatsAppNumber?text=$encodedMessage",
//     );

//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("WhatsApp not available")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: Center(
//         child: Container(
//           width: 420,
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Contact via WhatsApp",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),

//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: "Full Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               TextField(
//                 controller: phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   labelText: "Phone Number",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 12),

//               TextField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                   labelText: "Email Address",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: sendToWhatsApp,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text(
//                     "Send on WhatsApp",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'location_search_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelFormPage(),
    );
  }
}

class TravelFormPage extends StatefulWidget {
  const TravelFormPage({super.key});

  @override
  State<TravelFormPage> createState() => _TravelFormPageState();
}

class _TravelFormPageState extends State<TravelFormPage> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  /// 🔴 Replace with your WhatsApp number (country code required)
  final String ownerWhatsApp = "919999999999";

  void sendToWhatsApp() async {
    final from = fromController.text.trim();
    final to = toController.text.trim();

    if (from.isEmpty || to.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both locations")),
      );
      return;
    }

    final message =\
        """
Hello 👋
Travel enquiry:

📍 From: $from
📍 To: $to
""";

    final encoded = Uri.encodeComponent(message);
    final url = Uri.parse("https://wa.me/$ownerWhatsApp?text=$encoded");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Travel Location",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              LocationSearchField(
                label: "From Location",
                controller: fromController,
              ),
              const SizedBox(height: 16),

              LocationSearchField(
                label: "To Location",
                controller: toController,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: sendToWhatsApp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Send on WhatsApp",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
