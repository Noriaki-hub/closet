import 'package:closet_app_xxx/ui/libs/app_colors.dart';
import 'package:closet_app_xxx/ui/libs/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitPouringHourGlass(
      color: AppColors.theme,
      size: 50.0,
    );
    return GlassScaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}

class ImageLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitFadingGrid(
      color: AppColors.theme,
      size: 50.0,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: spinkit,
      ),
    );
  }
}
