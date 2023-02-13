import 'dart:ui';

import 'package:beamer/beamer.dart';
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
                (tab) => HeroControllerScope(
                  controller: MaterialApp.createMaterialHeroController(),
                  child: Beamer(
                    key: ValueKey(tab),
                    routerDelegate: RouterUtils.tabRouter[tab]!,
                  ),
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
                      MediaQuery.of(context).viewPadding.bottom +
                      2,
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
                Container(
                  height: kBottomNavigationBarHeight +
                      MediaQuery.of(context).viewPadding.bottom +
                      2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 0,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: _index,
                    items: List.from(
                      TabMeta.values.map(
                        (tab) => BottomNavigationBarItem(
                          icon: tab.icon,
                          label: tab.title,
                        ),
                      ),
                    ),
                    onTap: (index) {
                      if (index != _index) {
                        setState(() {
                          _index = index;
                          Beamer.of(context).update(rebuild: false);
                        });
                      } else if (Beamer.of(context).canBeamBack) {
                        Beamer.of(context).beamBack();
                      } else {
                        RouterUtils.tabScrollController[TabMeta.values[index]]!
                            .animateTo(
                          0.0,
                          duration: StylingUtils.kBaseAnimationDuration,
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
