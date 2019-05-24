import 'package:flutter/material.dart';

class ChangePage{

  //解决了官方demo里路由跳转效果卡顿的问题
  void ToNextPage(BuildContext context, StatelessWidget page){
    Navigator.of(context)
        .push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context,_,__){
          return page;
        },
        transitionsBuilder: (_,Animation<double> animation,__,Widget child){
          return new FadeTransition(opacity: animation,
            child: new SlideTransition(position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),child: child,),);
        }
    ));
  }

  ChangePage();
}