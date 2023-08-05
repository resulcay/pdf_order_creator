import 'package:flutter/material.dart';
import 'package:pdf_order_creator/components/custom_animate_border.dart';

class AnimatedTextField extends StatefulWidget {
  final String label;
  final TextEditingController textController;
  final int? maxLines;
  final Widget? suffix;
  const AnimatedTextField({
    Key? key,
    required this.label,
    this.suffix,
    this.maxLines,
    required this.textController,
  }) : super(key: key);

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    final Animation<double> curve =
        CurvedAnimation(parent: controller!, curve: Curves.easeInOut);
    alpha = Tween(begin: 0.0, end: 1.0).animate(curve);

    controller?.addListener(() {
      setState(() {});
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller?.forward();
      } else {
        controller?.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Theme(
        data: ThemeData(
            colorScheme:
                Theme.of(context).colorScheme.copyWith(primary: Colors.cyan)),
        child: CustomPaint(
          painter: CustomAnimateBorder(alpha.value),
          child: TextField(
            controller: widget.textController,
            focusNode: focusNode,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              label: Text(widget.label),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: widget.suffix,
            ),
          ),
        ),
      ),
    );
  }
}
