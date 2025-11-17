// import 'package:flutter/material.dart';
//
// class FloatingWidget extends StatelessWidget {
//   final ScrollController controller;
//
//   const FloatingWidget({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       decoration: BoxDecoration(
//         color: const Color(0xFFFDB927),
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFFDB927).withOpacity(0.4),
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: FloatingActionButton(
//         onPressed: () {
//           controller.animateTo(
//             0,
//             duration: const Duration(milliseconds: 500),
//             curve: Curves.easeOut,
//           );
//         },
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         child: const Icon(
//           Icons.arrow_upward_rounded,
//           color: Colors.black,
//           size: 20,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FloatingWidget extends StatefulWidget {
  final ScrollController controller;

  const FloatingWidget({super.key, required this.controller});

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {

  @override
  void initState() {
    super.initState();

    /// listen to scrolling
    widget.controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    bool isAtTop = widget.controller.hasClients && widget.controller.offset <= 0;

    Color bgColor = isAtTop ? Colors.grey : const Color(0xFFFDB927);
    Color shadowColor = bgColor.withOpacity(0.4);

    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          widget.controller.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.arrow_upward_rounded,
          color: isAtTop ? Colors.white : Colors.black,
          size: 20,
        ),
      ),
    );
  }
}

