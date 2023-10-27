import 'package:flutter/material.dart';

class ReponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ReponsiveLayout({super.key, 
    required this.mobileScreenLayout, required this.webScreenLayout,  
    });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains){
        if(constrains.maxWidth > 900){
          return webScreenLayout;
        }
        return mobileScreenLayout;
      }
      
      );
  }
}