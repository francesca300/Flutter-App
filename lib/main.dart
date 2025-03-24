import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

class UserService {
  static const String baseUrl = "http://10.0.2.2:5000"; // Change to your API URL

  Future<Map<String, dynamic>?> getUserById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/$id'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _idController = TextEditingController();
  Map<String, dynamic>? userData;
  bool isLoading = false;
  final UserService _userService = UserService();

  void fetchUser() async {
    String id = _idController.text.trim();

    // Input validation
    if (id.isEmpty || !RegExp(r'^\d+$').hasMatch(id)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid user ID')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      Map<String, dynamic>? data = await _userService.getUserById(id);
      setState(() {
        userData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user: $e')),
      );
    }
  }

  void navigateToQRScreen() {
    if (userData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRCodeScreen(userData: userData!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: 'Enter User ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: fetchUser,
              child: const Text('Fetch User'),
            ),
            const SizedBox(height: 20),
            userData != null
                ? Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Username: ${userData!["username"]}',
                            style: const TextStyle(fontSize: 18)),
                        Text('Major: ${userData!["major"]}',
                            style: const TextStyle(fontSize: 18)),
                        Text('Email: ${userData!["email"]}',
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: navigateToQRScreen,
                  child: const Text('Generate QR Code'),
                ),
              ],
            )
                : const Text('No user data available',
                style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

class QRCodeScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  const QRCodeScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    String qrData = jsonEncode(userData); // Convert the user data to a JSON string

    return Scaffold(
      appBar: AppBar(title: const Text("User QR Code")),
      body: Center(
        child: Container(
          width: 200.0, // Set the width for the QR code
          height: 200.0, // Set the height for the QR code
          child: QrImageView(
            data: qrData,         // Provide the 'data' argument
            version: QrVersions.auto,  // Automatically determine the QR version
            size: 200.0,           // Specify the size of the QR code
          ),
        ),
      ),
    );
  }
}
