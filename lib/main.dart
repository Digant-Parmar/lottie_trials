import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// cd AppData\Local\Android\Sdk\platform-tools
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController _animationController1;
  AnimationController _animationController2;
  AnimationController _textAnimationController;
  Animation _animation;
  // ScrollController _scrollController;


  final _focusNode = FocusNode();

  @override
  void initState() {
    _animationController1 = AnimationController(vsync: this);
    _animationController2 = AnimationController(vsync: this);
    // _scrollController = ScrollController();

    // _textAnimationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    // _animation = Tween(begin: 300.0,end: 50.0).animate(_textAnimationController)
    // ..addListener(() {
    //   setState(() {
    //
    //   });
    // });

    setState(() {});

    // _focusNode.addListener(() {
    //   print("in focus");
    //   if(_focusNode.hasFocus){
    //     // _textAnimationController.forward();
    //     _scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom, duration: Duration(milliseconds: 200), curve: Curves.easeOut);
    //   }else{
    //     _scrollController.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeOut);
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    // _textAnimationController.dispose();
    _animationController1.dispose();
    _animationController2.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTED = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     "Petziee",
          //     style: GoogleFonts.getFont('Dancing Script'),
          //   ),
          // ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            // controller: _scrollController,
            child: GestureDetector(
              onTap: (){
                FocusScopeNode currentFocus = FocusScope.of(context);
                if(!currentFocus.hasPrimaryFocus){
                  currentFocus.unfocus();
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 4.693 + 30),
                      child: Container(
                        alignment: Alignment.topCenter,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Container(
                          height: 260,
                          width: 400,
                          alignment: Alignment.center,
                          child: Lottie.network(
                            "https://assets2.lottiefiles.com/packages/lf20_syqnfe7c.json",
                            fit: BoxFit.cover,

                            repeat: true,
                            controller: _animationController2,
                            onLoaded: (animate) {
                              _animationController2.duration = animate.duration;
                              print('${_animationController2.lowerBound}is lowerbound');
                              print('${_animationController2.upperBound}is upper');
                              _animationController2.forward().whenComplete(() {_animationController2.animateBack(0.5);_animationController2.repeat(reverse: true,min: 0.5,max: 0.9,period: Duration(microseconds: (animate.duration.inMicroseconds~/2)));});
                              // _animationController.forward();
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 4.693),
                        child: Form(
                          key: formKey,
                          child: SizedBox(
                            width: 275,
                            height: 60,
                            child: Container(
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextFormField(
                                    validator: (val) {
                                      return val.isEmpty || val.length < 2
                                          ? "Please provide proper Username"
                                          : null;
                                    },
                                    controller: usernameTED,
                                    // focusNode: _focusNode,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Username",
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIconConstraints: BoxConstraints(
                                        maxWidth: 10,
                                      ),
                                      // hintText: hintText,
                                      // hintStyle: TextStyle(
                                      //   color: Colors.white54,
                                      //   fontSize: 12
                                      // ),
                                      // suffixIcon: IconButton(
                                      //   icon: Icon(
                                      //     Icons.arrow_forward_outlined,
                                      //     color: Colors.lightBlueAccent,
                                      //   ),
                                      //   onPressed: () {
                                      //     // _focusNode.unfocus();
                                      //     // _focusNode.canRequestFocus = false;
                                      //     print("Pressed");
                                      //   },
                                      // ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.amber),
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(50))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white54),
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(50))),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    splashRadius: 5,
                                    onPressed: () {
                                      // _focusNode.unfocus();
                                      // _focusNode.canRequestFocus = false;
                                      print("Pressed");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    child: Lottie.asset(
                                      // "https://assets10.lottiefiles.com/private_files/lf30_FPH6Ci.json",
                                      "assets/welcome.json",
                                      repeat: true,
                                      controller: _animationController1,
                                      onLoaded: (animate) {
                                        _animationController1.duration =
                                            animate.duration;
                                        _animationController1.repeat(
                                          reverse: false,
                                        );
                                        // _animationController.forward();
                                      },
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.green.withOpacity(0.3),
                                    height: 125,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("to",
                                          style: GoogleFonts.getFont(
                                            'Dancing Script',
                                            fontSize: 40,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 4),
                                child: Text(
                                  "Petziee",
                                  style: GoogleFonts.getFont('Dancing Script',
                                      fontSize: 60,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SafeArea(
                    //   child: Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 8, top: 8),
                    //       child: Text(
                    //         "Petziee",
                    //         style: GoogleFonts.getFont('Dancing Script',fontSize: 32,color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: Colors.white,
    // hintText: hintText,
    // hintStyle: TextStyle(
    //   color: Colors.white54,
    //   fontSize: 12
    // ),
    suffixIcon: IconButton(
      icon: Icon(
        Icons.arrow_forward_outlined,
        color: Colors.lightBlueAccent,
      ),
      onPressed: () {
        print("Pressed");
      },
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
        borderRadius: BorderRadius.all(Radius.circular(50))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white54),
        borderRadius: BorderRadius.all(Radius.circular(50))),
  );
}
