import 'package:flutter/material.dart';

void main() {
  runApp(const ContactListApp());
}

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ContactListScreen(),
    );
  }
}

class Contact {
  final String name;
  final String email;
  final int phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact( name: 'John Doe', email: 'doe@example.com', phoneNumber: 1234567890 ),
    Contact( name: 'Jane Smith', email: 'smith@example.com', phoneNumber: 2345678901 ),
    Contact( name: 'David Beckham', email: 'beckham@example.com', phoneNumber: 3456789012 ),
    Contact( name: 'Alice Johnson', email: 'alice@example.com', phoneNumber: 4567890123 ),
  ];

  ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contact List')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Contact Details', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text('Name: ${contact.name}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Email: ${contact.email}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Phone: ${contact.phoneNumber}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Dismiss the bottom sheet
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
