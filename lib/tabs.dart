import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'stores/shared/tabs.dart';
import 'utils/design_system.dart';
import 'utils/router.dart';

class TabsView extends ConsumerWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int tabIndex = ref.watch(currentTabIndexProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: tabIndex,
            children: List.from(
              TabMeta.values.map(
                (tab) => HeroControllerScope(
                  controller: MaterialApp.createMaterialHeroController(),
                  child: Beamer(
                    key: ValueKey(tab),
                    routerDelegate: RouterUtils.tabRouterMap[tab]!,
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
                        sigmaX: DesignSystem.sigmaBlur,
                        sigmaY: DesignSystem.sigmaBlur,
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
                    currentIndex: tabIndex,
                    elevation: 0,
                    items: List.from(
                      TabMeta.values.map(
                        (tab) => BottomNavigationBarItem(
                          icon: tab.icon,
                          label: tab.title,
                        ),
                      ),
                    ),
                    onTap: (index) {
                      if (index != tabIndex) {
                        ref
                            .read(currentTabIndexProvider.notifier)
                            .setTabIndex(index);
                        Beamer.of(context).update(rebuild: false);
                      } else if (RouterUtils
                          .tabRouterMap[TabMeta.values[index]]!.canBeamBack) {
                        RouterUtils.tabRouterMap[TabMeta.values[index]]!
                            .beamBack();
                      } else {
                        RouterUtils
                            .tabScrollControllerMap[TabMeta.values[index]]!
                            .animateTo(
                          0.0,
                          duration: DesignSystem.animation.defaultDurationMS250,
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
