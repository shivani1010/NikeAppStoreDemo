
import 'package:assignements/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../screens/home.dart';
import '../screens/search.dart';
import 'package:animate_do/animate_do.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final int _index = 0;
  bool isSearchActive = false;

  List<Widget> screens = [
    const Home(),
    const Search(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            "Search",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        )
            : FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            "",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon:  Image.asset('assets/images/nike_logo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: isSearchActive
                ? const Icon(
              LineIcons.searchMinus,
              color: Colors.black,
              size: 30,
            )
                : const Icon(
              LineIcons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child:
            SizedBox(
              width: 80.0,
              child: OutlinedButton(
                child: const Text('Sign In',style: TextStyle(color: Colors.black),),
                onPressed: () {
                  showLoginScreen(context,size);
                },
              ),
            )
          ),
        ],
      ),
      body: isSearchActive ? const Search() : const Home(),

    );
  }

  void showLoginScreen(BuildContext context,var size) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Login",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child:
              Container(
                margin: const EdgeInsets.all(8),
                width: size.width,
                height: size.height,
                child: SizedBox.expand(child: Login()),

                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
              ),

        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}