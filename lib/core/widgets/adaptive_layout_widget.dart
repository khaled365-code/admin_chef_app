

import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class AdaptiveLayoutWidget extends StatelessWidget
{
   const AdaptiveLayoutWidget({super.key, required this.mobileLayout, required this.tabletLayout, required this.desktopLayout});


   final WidgetBuilder  mobileLayout,tabletLayout,desktopLayout;
   @override
   Widget build(BuildContext context)
   {
     return LayoutBuilder(builder: (context, constraints)
     {
       if(constraints.maxWidth < SizeConfig.tabletSize)
         {
            return mobileLayout(context);
         }
         else if(constraints.maxWidth < SizeConfig.desktopSize)
         {
            return tabletLayout(context);
         }
         else
         {
            return desktopLayout(context);
         }


     });
   }
 }
