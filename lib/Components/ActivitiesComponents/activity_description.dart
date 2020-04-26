import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';

class ActivityDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityBloc>(
      builder: (_, _bloc, __) => SafeArea(
        child: Container(
          child: TextField(
            onChanged: (String description) => _bloc.description = description,
            minLines: 20,
            maxLines: 100,
            maxLength: 60,
            buildCounter: counter,
            decoration: InputDecoration(
              hintText: 'Your Activity today...',
              hintStyle: TextStyle(color: Colors.amber[100], fontSize: 20),
              border: OutlineInputBorder(gapPadding: 20),
            ),
          ),
        ),
      ),
    );
  }

  Text counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Text(
      '$currentLength / $maxLength',
      style: TextStyle(color: isFocused ? Colors.purple[100] : Colors.grey),
      semanticsLabel: 'character count',
    );
  }
}
