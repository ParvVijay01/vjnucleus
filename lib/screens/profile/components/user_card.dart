import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Banner and Avatar Stack
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Placeholder banner image
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('https://placehold.co/600x200.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Positioned CircleAvatar overlapping banner
              Positioned(
                bottom: -40,
                left: 20,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://placehold.co/150.png',
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 14),
                        onPressed: () {
                          // Handle edit avatar
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Jane Doe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'jane.doe@example.com',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                const SizedBox(height: 12),
                const Text(
                  'A passionate web developer!',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Location: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('San Francisco, CA'),
                  ],
                ),
                const SizedBox(height: 6),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Birth Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('7/12/1995'),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle update
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF308E87),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle delete
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
