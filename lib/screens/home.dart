import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../model/base_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  final int _currentIndex = 2;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Text
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Just In",
                        style: const TextStyle(fontSize:18),
                        ),
                      SizedBox(
                        height: 14, // <-- SEE HERE
                      ),
                      Text(
                        "NIKE AIR",
                        style: const TextStyle(fontSize:24 ,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "MAX PULSE",
                        style: const TextStyle(fontSize:24 ,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height:14, // <-- SEE HERE
                      ),
                      Text(
                        "Inspired by the energy of London’s music scene comes the Air Max Pulse. A tough silhouette infused with an unreal sensation of Air.",
                        style: const TextStyle(fontSize:18),
                      ),
                      SizedBox(
                        height:20, // <-- SEE HERE
                      ),
                    ],
                  ),
                ),
              ),

              /// Body Slider
              FadeInUp(
                delay: const Duration(milliseconds: 550),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: size.width,
                  height: size.height * 0.80,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: mainList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {

                          },
                          child: view(index, textTheme, size));
                    },
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  /// Page View
  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0.0;
          if (_pageController.position.haveDimensions) {
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * 0.04).clamp(-1, 0);
          }
          return Transform.rotate(
            angle: 3.14 * value,
            child: card(mainList[index], theme, size),
          );
        });
  }

  /// Page view Cards
  Widget card(BaseModel data, TextTheme theme, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromARGB(61, 0, 0, 0))
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              data.name,
              style:const TextStyle(fontSize: 18),
            ),
          ),
           Text(
              data.category,
              style: const TextStyle(fontSize: 18,color: Colors.black45),
            ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: '₹ ',
                  style: DefaultTextStyle.of(context).style,
                  children:  <TextSpan>[
                    TextSpan(text: data.old_price.toString(), style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: '₹ ',
                  style: DefaultTextStyle.of(context).style,
                  children:  <TextSpan>[
                    TextSpan(text: data.new_price.toString(), style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}