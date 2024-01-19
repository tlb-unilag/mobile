import 'package:taro_leaf_blight/packages/packages.dart';

class CustomTab {
  final String text;
  final String? icon;
  CustomTab({
    required this.text,
    this.icon,
  });
}

class CustomTabBar extends StatelessWidget {
  final TabController? controller;
  final List<CustomTab> tabs;
  final void Function(int)? onTap;
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: AppColors.bordersLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: TabBar(
            controller: controller,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            unselectedLabelColor: AppColors.greyQuatinary,
            splashFactory: NoSplash.splashFactory,
            unselectedLabelStyle: CustomTextStyle.paragraphSmall
                .withColor(AppColors.greyQuatinary),
            labelStyle:
                CustomTextStyle.paragraphSmall.withColor(AppColors.baseBlack),
            onTap: onTap,
            tabs: tabs.map(
              (e) {
                if (e.icon == null) {
                  return Tab(
                    text: e.text,
                  );
                } else {
                  return Tab(
                    child: Row(
                      children: [
                        Text(e.text),
                        4.gap,
                        SvgPicture.asset(
                          e.icon!,
                        ),
                      ],
                    ),
                  );
                }
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
