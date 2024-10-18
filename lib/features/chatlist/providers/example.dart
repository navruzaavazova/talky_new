import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Store the users in a list
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final currentUser = _auth.currentUser;
      final querySnapshot = await _firestore.collection('users').get();

      // Filter out the current user
      final filteredUsers = querySnapshot.docs
          .where((doc) => doc['uid'] != currentUser?.uid)
          .map((doc) => doc.data())
          .toList();

      setState(() {
        users = filteredUsers;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['image'] ?? ''),
                    child: user['image'] == null
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ChatScreen(user: user),
                    //   ),
                    // );
                  },
                );
              },
            ),
    );
  }
}
