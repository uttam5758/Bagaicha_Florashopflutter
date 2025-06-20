import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> stats = [
    {
      'title': 'Sales',
      'value': '₨ 12,345',
      'icon': Icons.attach_money,
      'color': Colors.green,
    },
    {
      'title': 'Orders',
      'value': '150',
      'icon': Icons.shopping_cart,
      'color': Colors.orange,
    },
    {
      'title': 'Inventory',
      'value': '320',
      'icon': Icons.local_florist,
      'color': Colors.purple,
    },
  ];

  final List<Map<String, String>> featuredPlants = [
    {
      'name': 'Rose',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Damask_rose_pink.jpg/500px-Damask_rose_pink.jpg',
      'price': '₨ 300',
    },
    {
      'name': 'Succulent',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/sempervivum-succulents-also-known-as-houseleeks-royalty-free-image-1734100258.pjpeg?crop=1.00xw:0.755xh;0,0.0889xh&resize=1200:*',
      'price': '₨ 450',
    },
    {
      'name': 'Tulip',
      'image':
          'https://images.unsplash.com/photo-1461342249744-29a57e9bd1cb?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'price': '₨ 350',
    },
    {
      'name': 'Orchid',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/8c914e30-7b32-459a-a5bb-b16d44ed55c0.jpeg?crop=0.667xw:1xh;0.167xw,0xh&resize=1120:*',
      'price': '₨ 500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                Text(
                  'Hello, Uttam!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Welcome back to your Flora Shop',
                  style: TextStyle(fontSize: 16, color: Colors.green[600]),
                ),

                // Stats Cards
                const SizedBox(height: 24),

                // Featured Plants header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Plants',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Grid of Plants
                GridView.builder(
                  itemCount: featuredPlants.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final plant = featuredPlants[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.15),
                            blurRadius: 8,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(22),
                              ),
                              child: Image.network(
                                plant['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  plant['name']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green[900],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  plant['price']!,
                                  style: TextStyle(
                                    color: Colors.green[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
