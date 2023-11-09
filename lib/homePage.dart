import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black, // Set the title bar to black
  scaffoldBackgroundColor: Colors.lightGreen,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black, // Set the title bar to black
  scaffoldBackgroundColor: Colors.lightGreen,
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeTabPage(title: 'Home'),
    const HealthStatusPage(title: 'Health Status'),
    const PetsPage(title: 'Pets'),
    const ProfilePage(title: 'Profile'),
  ];

  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: _isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pet Care'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      size: 96,
                      color: Colors.white,
                    ),
                    Text('User Profile', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const ListTile(
                title: Text('Name: SK IMRAN'),
              ),
              const ListTile(
                title: Text('Age: 21'),
              ),
              const ListTile(
                title: Text('Sex: Male'),
              ),
              const ListTile(
                title: Text('Contact: +91 7978065426'),
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Health Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: 'Pets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTabPage extends StatelessWidget {
  final String title;

  const HomeTabPage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0), // Adjusted padding
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child:const TextField(
              decoration: InputDecoration(
                hintText: 'Search Location',
                prefixIcon: Icon(Icons.location_on),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0), // Adjusted padding
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child:const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryCard(
                  categoryName: 'Dog',
                  imageAsset: 'assets/images/dog.jpg',
                ),
                CategoryCard(
                  categoryName: 'Cat',
                  imageAsset: 'assets/images/cat.jpg',
                ),
                CategoryCard(
                  categoryName: 'Bird',
                  imageAsset: 'assets/images/cat1.jpg',
                ),
                CategoryCard(
                  categoryName: 'Rabbit',
                  imageAsset: 'assets/images/rabbit.jpg',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final List<String> randomPetImages = [
                'assets/images/dog.jpg',
                'assets/images/cat.jpg',
                'assets/images/cat1.jpg',
                'assets/images/dog.jpg',
                'assets/images/rabbit.jpg',
              ];
              final randomImage = randomPetImages[index % randomPetImages.length];

              String petImage = randomImage;

              if (index == 0) {
                petImage = 'assets/images/cat1.jpg';
              } else if (index == 1) {
                petImage = 'assets/images/dog.jpg';
              } else if (index == 2) {
                petImage = 'assets/images/cat.jpg';
              } else if (index == 3) {
                petImage = 'assets/images/dog.jpg';
              } else if (index == 4) {
                petImage = 'assets/images/cat.jpg';
              } else if (index == 5) {
                petImage = 'assets/images/dog.jpg';
              } else if (index == 6) {
                petImage = 'assets/images/cat1.jpg';
              } else if (index == 7) {
                petImage = 'assets/images/dog.jpg';
              } else if (index == 8) {
                petImage = 'assets/images/cat1.jpg';
              } else {
                petImage = 'assets/images/cat.jpg';
              }

              String petName = 'Pet $index';

              if (index == 0) {
                petName = 'Lucy'; 
              }
              if (index == 1) {
                petName = 'Rocky'; 
              }
              if (index == 2) {
                petName = 'Lucky'; 
              }
              if (index == 3) {
                petName = 'Goldy'; 
              }
              if (index == 4) {
                petName = 'Paro'; 
              }
              if (index == 5) {
                petName = 'Taffy'; 
              }
              if (index == 6) {
                petName = 'Meethu'; 
              }
              if (index == 7) {
                petName = 'Rabbit'; 
              }
              if (index == 8) {
                petName = 'Rega'; 
              }
              if (index == 9) {
                petName = 'Mercy';
              }

              return Padding(
                padding: const EdgeInsets.all(4.0), 
                child: PetCard(
                  petName: petName,
                  imageAsset: petImage,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PetDetailScreen(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageAsset;

  CategoryCard({
    Key? key,
    required this.categoryName,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String petName;
  final String imageAsset;
  final VoidCallback onTap;

  const PetCard({
    Key? key,
    required this.petName,
    required this.imageAsset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias, // Clip the card to create rounded corners
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(petName),
          ],
        ),
      ),
    );
  }
}

class PetDetailScreen extends StatelessWidget {
  const PetDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Details'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              'assets/images/dog.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lucky',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Pets are domesticated animals that people keep for companionship, work, or enjoyment. They play an essential role in many households, providing love, companionship, and often serving practical purposes. There are various types of pets, including dogs, cats, birds, fish, rabbits, and more. Here are some key points about pets:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HealthStatusPage extends StatelessWidget {
  final String title;

  const HealthStatusPage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Health Status Page Content'),
      ),
    );
  }
}

class PetsPage extends StatelessWidget {
  final String title;

  const PetsPage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Pets Page Content'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String title;

  const ProfilePage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: MD SAMA'),
                Text('Age: 21'),
                Text('Sex: Male'),
                Text('Contact: +91 7978065426'),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            onTap: () {
              // Navigate to the language settings page or perform related action here
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Perform logout action here
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to the settings page or perform settings action here
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Feedback'),
            onTap: () {
              // Navigate to the help and feedback page or perform related action here
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Center(
        child: Text('About Us Page Content'),
      ),
    );
  }
}


