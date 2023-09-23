import 'package:flutter/material.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;
  Color backgroundColor;
  UnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
    required this.backgroundColor,
  });
}

// Created By Flutter Baba
List<UnbordingContent> contentsList = [
  UnbordingContent(
    backgroundColor: Color.fromARGB(255, 70, 164, 129),
    title: "Meditation",
    image: 'assets/images/p1.jpg',
    discription: "Meditation is not just a mind control. It's a joyful thing to do that's suitable for all ages and fitness levels, making it a fantastic way to groove your way to a healthier lifestyle. Happy life with Zumba",
  ),
  UnbordingContent(
    backgroundColor: const Color(0xffB7ABFD),
    title: 'Yoga',
    image: 'assets/images/p2.jpg',
    discription: "Yoga is a centuries-old practice that combines physical postures, breathing techniques, and meditation to enhance flexibility, strength, and mental well-being. It promotes relaxation, inner peace.",
  ),
  UnbordingContent(
    backgroundColor: const Color(0xffEFB491),
    title: 'Runnig',
    image: 'assets/images/p3.jpg',
    discription:
        "Running is a simple yet effective exercise that involves moving on swiftly foot. It boosts cardiovascular fitness, burns calories, and leg muscles. Running 45 minues per day help you to maintain good health.",
  ),
  UnbordingContent(
    backgroundColor: Color.fromARGB(255, 226, 195, 103),
    title: 'Illustration',
    image: 'assets/images/p4.jpg',
    discription:
        "Illustrations with dumbbells as exercise involve using these weights in various movements to target specific muscle groups. Whether it's lifting, curling, or pressing, dumbbells allow for wide range exercises",
  ),
  UnbordingContent(
    backgroundColor: const Color(0xff95B6FF),
    title: 'Walking',
    image: 'assets/images/p5.jpg',
    discription:
        "Walking is a simple and accessible exercise that involves moving at a moderate pace by putting one foot in front of the other. It promotes cardiovascular health a health and enhances overall fitness.",
  ),
];
