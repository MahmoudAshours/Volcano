import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:volcano/Provider/ActivitiesBloc/activity_bloc.dart';
import 'package:volcano/Utils/spiner.dart';

class ActivityImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityBloc>(
      builder: (_, _bloc, __) => GestureDetector(
        onTap: () => _bloc.executeAll(context),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                child: _bloc.imageUploaded == UploadImage.notUploading
                    ? FaIcon(
                        FontAwesomeIcons.camera,
                        color: Colors.amber[100],
                      )
                    : Spinner(
                        firstColor: Colors.amber, secondColor: Colors.purple),
              ),
              Text(
                'Upload your image',
                style: TextStyle(color: Colors.purple[100]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
