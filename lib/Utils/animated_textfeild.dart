import 'package:flutter/material.dart';

class AnimatedTextFeild extends StatefulWidget {
  final TextField textField;
  final Color borderColor;
  final Widget icon;
  AnimatedTextFeild(
      {@required this.textField,
      @required this.borderColor,
      @required this.icon});
  @override
  _AnimatedTextFeildState createState() => _AnimatedTextFeildState();
}

class _AnimatedTextFeildState extends State<AnimatedTextFeild> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.decelerate,
        width: show ? 50 : 300,
        height: 50,
        child: GestureDetector(
          onTap: () {
            setState(() => show = false);
          },
          child: show
              ? widget.icon
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.textField,
                ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: widget.borderColor,
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  @override
  void dispose() {
    setState(() => show = false);
    super.dispose();
  }
}
