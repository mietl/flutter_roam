import 'dart:async';

import 'package:flutter/material.dart';

const double kHorizontalPadding = 24;
const double kDefaultRadius = 11;
const Duration k400MS = Duration(milliseconds: 400);

class Toast {
  static OverlayEntry? _entry;
  static Timer? _timer;
  static late BuildContext _context;

  static Future<void> show(BuildContext context, String message) async {
    _context = context;

    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;

    final toast = _ToastWidget(message: message);
    _entry = OverlayEntry(builder: (context) => toast);

    OverlayState overlay = Navigator.of(
      _context,
      rootNavigator: true,
    ).overlay!;

    overlay.insert(_entry!);

    _timer = Timer(const Duration(milliseconds: 2800), () {
      _entry?.remove();
      _entry = null;
    });
  }
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({required this.message});

  final String message;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: k400MS,
    vsync: this,
  );

  late final Animation<double> _animationAlignmentY = Tween<double>(
    begin: -1,
    end: -.8,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCirc,
  ));

  late final Animation<double> _opacityAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutCirc,
  ));

  @override
  void initState() {
    super.initState();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // hide();
      }
    });
    _controller.forward();
  }

  void hide() {
    Future.delayed(
      const Duration(seconds: 2),
          () => _controller.reverse().then((value) {
        Toast._entry?.remove();
        Toast._entry = null;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Align(
          alignment: Alignment(0, _animationAlignmentY.value),
          child: FadeTransition(opacity: _opacityAnimation, child: child!),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEC5C57).withOpacity(.6), // 修改为您想要的背景颜色
          borderRadius: BorderRadius.circular(kDefaultRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(.2),
              offset: const Offset(0, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Text(
          widget.message,
          style: const TextStyle(
            fontSize: 16,
            decoration: TextDecoration.none, // toast被直接添加到overlay中因此需要取消下划线
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}