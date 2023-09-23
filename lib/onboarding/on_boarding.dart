import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onbording_screen/data/data.dart';
import 'package:onbording_screen/sign_in/sign_in.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController? _controller;
  int currentIndex = 0;
  double percentage = 0.25;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentsList[currentIndex].backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _controller,
                itemCount: contentsList.length,
                onPageChanged: (int index) {
                  if (index >= currentIndex) {
                    setState(() {
                      currentIndex = index;
                      percentage += 0.25;
                    });
                  } else {
                    setState(() {
                      currentIndex = index;
                      percentage -= 0.25;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: currentIndex == 0 || currentIndex == 3
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Text(
                                contentsList[index].title,
                                style: const TextStyle(
                                  fontFamily: "SF-Pro",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32.0,
                                  letterSpacing: 0.24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 500, // Replace 200 with your desired height
                          child: Image.asset(contentsList[index].image),
                        ),
                      ),

                            const SizedBox(height: 20),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      overflow: TextOverflow.clip,
                                      contentsList[index].discription,
                                      style: const TextStyle(
                                        fontFamily: "SF-Pro",
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17.0,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      
                      
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: List.generate(
                            contentsList.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CupertinoButton(
                          onPressed: () {},
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        )
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (currentIndex == contentsList.length - 1) {
                          // Go to next page...
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => SignInScreen())
                          );
                        }
                        _controller!.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: CircularProgressIndicator(
                              value: percentage,
                              backgroundColor: Colors.white38,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: contentsList[currentIndex].backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 8,
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.white : Colors.white38,
      ),
    );
  }
}
