import 'package:flutter/material.dart';

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
