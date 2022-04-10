import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: const Center(
              child: Text('Bottom'),
            ),
          ),
          preferredSize: const Size.fromHeight(75.0),
        ),
        shadowColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [ContainerWithDecorationWidget()],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerWithDecorationWidget extends StatelessWidget {
  const ContainerWithDecorationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.lightGreen,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: const Center(
            child: TheText(),
            //child: TheRichText(),
          ),
        ),
      ],
    );
  }
}

class TheRichText extends StatelessWidget {
  const TheRichText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        //* ------------------------------------- Demo on TextSpan
        text: 'TextSpan DEMO',
        style: const TextStyle(
            fontSize: 24.0,
            color: Colors.deepPurple,
            decoration: TextDecoration.underline,
            decorationColor: Colors.deepPurpleAccent,
            decorationStyle: TextDecorationStyle.dotted,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.normal),
        children: [
          TextSpan(
            text: ' for',
            style: const TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTapUp = (_) => debugPrint('onTapUp'),
            mouseCursor: SystemMouseCursors.click,
            onEnter: (_) {
              debugPrint('onEnter....');
            },
            onExit:
                theOnExit, //* theOnExit--------------------------------widget call
            // goto
          ),
          const TextSpan(
            text: ' Mobile',
            style: TextStyle(
              color: Colors.deepOrange,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void theOnExit(_) {
    //* theOnExit--------------------------------widget call
    debugPrint('onEnter....');
  }
}

class TheText extends StatelessWidget {
  const TheText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      //* ------------------------------------- Demo on Text
      'Text DEMO',

      style: TextStyle(
        fontSize: 24.0,
        color: Colors.deepPurple,
        decoration: TextDecoration.combine(
            [TextDecoration.underline, TextDecoration.lineThrough]),
        decorationColor: Colors.deepPurpleAccent,
        decorationStyle: TextDecorationStyle.dashed,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
      strutStyle: const StrutStyle(
        fontFamily: 'Roboto',
        fontSize: 30,
        height: 1.5,
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.rtl,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 2.0,
      maxLines: 4,
      textWidthBasis: TextWidthBasis.parent,
      textHeightBehavior: TextHeightBehavior(
        applyHeightToFirstAscent: true,
        applyHeightToLastDescent: true,
      ),
    );
  }
}
