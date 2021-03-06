// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class _DialogRoute<T> extends PopupRoute<T> {
  _DialogRoute({
    @required this.theme,
    bool barrierDismissible: true,
    this.barrierLabel,
    @required this.child,
    RouteSettings settings,
  })  : assert(barrierDismissible != null),
        _barrierDismissible = barrierDismissible,
        super(settings: settings);

  final Widget child;
  final ThemeData theme;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 450);

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  Color get barrierColor => const Color(0x3f000000); // 这里透明处理

  @override
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new SafeArea(
      child: new Builder(builder: (BuildContext context) {
        final Widget annotatedChild = new Semantics(
          child: child,
          scopesRoute: true,
          explicitChildNodes: true,
        );
        return theme != null
            ? new Theme(data: theme, child: annotatedChild)
            : annotatedChild;
      }),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    return new FadeTransition(
//        opacity: new CurvedAnimation(
//            parent: animation,
//            curve: Curves.easeOut
//        ),
//        child: child
//    );

    ///     return new SlideTransition(
    ///       position: new Tween<Offset>(
    ///         begin: const Offset(0.0, 1.0),
    ///         end: Offset.zero,
    ///       ).animate(animation),

    CurvedAnimation _easyInOut = new CurvedAnimation(parent: animation, curve: Curves.easeInOut);
    CurvedAnimation _easyIn = new CurvedAnimation(parent: animation, curve: Curves.easeIn);

    return new SlideTransition(
      child: child,
      position: new Tween<Offset>(
        begin: Offset(0.0, 0.3), // 1.0
        end:  Offset.zero,
      ).animate(_easyIn),
    );

    return new RotationTransition(
      turns: new CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }
}

Future<T> showPopView<T>({
  @required
      BuildContext context,
  bool barrierDismissible: true,
      Widget child,
//  WidgetBuilder builder,
}) {
  assert(child != null);
  WidgetBuilder _builder = (context){ //BuildContext context
    return new GestureDetector(
        onTap: (){
          Navigator.of(context).maybePop();
        },
        child: new Material(
          color: const Color(0x01ffffff),
          child: new Container(
//            color: Colors.red,
              child: new Stack(
                children: <Widget>[
                  new Positioned(
                    child: child,
                    bottom: 0.0,
                  )
                ],
              )
          ),
        )
    );
  };

  return Navigator.of(context, rootNavigator: true).push(new _DialogRoute<T>(
        child: _builder(context),
        theme: Theme.of(context, shadowThemeOnly: true),
        barrierDismissible: barrierDismissible,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
      ));
}
