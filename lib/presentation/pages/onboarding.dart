import 'package:flutter/material.dart';
import 'package:depi/presentation/Registeration/login_page.dart';



class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: <Widget>[
              
                  _buildPage(
                    image: 'assets/icon 1.png', 
                    title: 'Explore Destinations',
                    description:
                        'Discover amazing places around the world with Rahala.',
                    buttonText: 'Next',
                    onNextPressed: () {
                      _pageController.animateToPage(1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                  ),
                  _buildPage(
                    image: 'assets/icon 2.jpg', 
                    title: 'Plan Your Trip',
                    description:
                        'Create a personalized itinerary for your dream vacation.',
                    buttonText: 'Next',
                    onNextPressed: () {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                  ),
                  _buildPage(
                    image: 'assets/icon 3.png', 
                    title: 'Enjoy Your Journey',
                    description:
                        'Travel with ease and make unforgettable memories.',
                    buttonText: 'Get started',
                    onNextPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(title: 'l',)), 
                      );
                    },
                    buttonColor: Colors.blueAccent,
                    buttonTextColor: Colors.white,
                  ),
                ],
              ),
            ),
            _buildDotIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    Color color = Colors.white,
    String? image,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onNextPressed,
    Color buttonColor = Colors.blueAccent,
    Color buttonTextColor = Colors.white,
    bool showDotIndicator = true,
  }) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (image != null)
              Expanded(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            if (title.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNextPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: buttonColor,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 18,
                    color: buttonTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 3),
            width: _currentPage == index ? 12 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.blueAccent : Colors.grey,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }
}


