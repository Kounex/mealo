import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

import 'utils/router.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: _index,
            children: List.from(
              TabMeta.values.map(
                (tab) => Beamer(
                  key: ValueKey(tab),
                  routerDelegate: RouterUtils.tabRouter[tab],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: kBottomNavigationBarHeight +
                      MediaQuery.of(context).viewPadding.bottom,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: StylingUtils.kSigmaBlur,
                        sigmaY: StylingUtils.kSigmaBlur,
                      ),
                      child: Container(),
                    ),
                  ),
                ),
                CupertinoTabBar(
                  currentIndex: _index,
                  height: kBottomNavigationBarHeight +
                      MediaQuery.of(context).viewPadding.bottom,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor!
                      .withOpacity(StylingUtils.kOpacityForBlur),
                  items: List.from(
                    TabMeta.values.map(
                      (tab) => BottomNavigationBarItem(
                        icon: tab.icon,
                        label: tab.title,
                      ),
                    ),
                  ),
                  onTap: (index) {
                    setState(() {
                      _index = index;
                      Beamer.of(context).update(rebuild: false);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
