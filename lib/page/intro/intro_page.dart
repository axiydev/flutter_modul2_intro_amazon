import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  late int? _currentIndex;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            onPageChanged: (newIndex) {
              _currentIndex = newIndex;
              setState(() {});
            },
            children: const [
              SizedBox(
                width: double.infinity,
                child: IntroCardWidget(
                  image: 'assets/image_1/image_1.png',
                  title: 'Learn from experts',
                  subtitle: 'Select from top instructros around the world',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: IntroCardWidget(
                  image: 'assets/image_1/image_2.png',
                  title: 'Learn from experts',
                  subtitle: 'Select from top instructros around the world',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: IntroCardWidget(
                  image: 'assets/image_1/image_3.png',
                  title: 'Learn from experts',
                  subtitle: 'Select from top instructros around the world',
                ),
              ),
            ],
          ),
          if (_currentIndex == 2)
            Positioned(
                top: 30,
                right: 10,
                child: TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print('pressed');
                    }
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                )),
          Positioned(
              bottom: 20, child: IndicatorWidget(currentIndex: _currentIndex)),
        ],
      ),
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
    required int? currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 5,
            width: _currentIndex == 0 ? 20 : 5,
            curve: Curves.ease,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(2.5)),
          ),
          const SizedBox(
            width: 5,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 5,
            width: _currentIndex == 1 ? 20 : 5,
            curve: Curves.ease,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(2.5)),
          ),
          const SizedBox(
            width: 5,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            height: 5,
            width: _currentIndex == 2 ? 20 : 5,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(2.5)),
          ),
        ],
      ),
    );
  }
}

class IntroCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const IntroCardWidget(
      {Key? key,
      required this.image,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 300,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.2),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
