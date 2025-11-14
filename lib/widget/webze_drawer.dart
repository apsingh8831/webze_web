import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webze_web/widget/custom_text.dart';
import '../provider/drawer_provider.dart';

class WebzeDrawer extends StatelessWidget {
  const WebzeDrawer({Key? key}) : super(key: key);

  final List<String> menuItems = const [
    'HOME',
    'FEATURES',
    'TOKEN',
    'HOW IT WORKS',
    'ROADMAP',
  ];

  final List<String> blogSubItems = const [
    'OUR BLOG',
    'BLOG DETAILS',
  ];

  @override
  Widget build(BuildContext context) {
    final drawer = Provider.of<DrawerProvider>(context);

    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(0)),
      backgroundColor: const Color(0xFF1A1A1A),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'asset/image/webze.png',
                  height: 30,
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFFFFB800)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style:  GoogleFonts.nunito(color: Colors.white,fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  suffixIcon: Icon(Icons.search,color: Colors.white,),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Divider
          Container(height: 1, color: const Color(0xFF2A2A2A)),

          // Menu
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              ...menuItems.asMap().entries.map((entry) {
                return _menuItem(
                  context: context,
                  title: entry.value,
                  isActive: drawer.selectedIndex == entry.key &&
                      drawer.selectedBlogSubIndex == null,
                  onTap: () {
                    drawer.selectMain(entry.key);
                    Navigator.pop(context);
                  },
                );
              }),

              _blogMainItem(context, drawer),

              if (drawer.isBlogExpanded)
                ...blogSubItems.asMap().entries.map((entry) {
                  return _blogSubItem(
                    context,
                    entry.value,
                    drawer.selectedBlogSubIndex == entry.key,
                        () {
                      Navigator.pop(context);
                      drawer.selectBlogSub(entry.key);
                    },
                  );
                }),
            ],
          ),

          // Social Icons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Wrap(
              runSpacing: 20,
              children: [
                _social(FontAwesomeIcons.facebookF),
                const SizedBox(width: 20),
                _social(FontAwesomeIcons.twitter),
                const SizedBox(width: 20),
                _social(FontAwesomeIcons.instagram),
                const SizedBox(width: 20),
                _social(FontAwesomeIcons.linkedin),
                const SizedBox(width: 20),
                _social(FontAwesomeIcons.youtube),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Menu item widget
  Widget _menuItem({
    required BuildContext context,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1),
          ),
        ),
        child: CustomText(
          text: title,
          color: isActive ? const Color(0xFFFFB800) : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  // Blog Main (BLOG)
  Widget _blogMainItem(BuildContext context, DrawerProvider drawer) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: drawer.isBlogExpanded ? const Color(0xFF2A2A2A) : Colors.transparent,
        border: const Border(
          bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // BLOG text
          Expanded(
            child: InkWell(
              onTap: () {
                drawer.selectBlogMain();
                Navigator.pop(context);
              },
              child: CustomText(
                text: 'BLOG',
                color:  drawer.selectedBlogSubIndex != null
                    ? const Color(0xFFFFB800)
                    : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Expand / Collapse icon
          InkWell(
            onTap: drawer.toggleBlogExpand,
            child: Icon(
              drawer.isBlogExpanded ? Icons.remove : Icons.add,
              color: drawer.isBlogExpanded || drawer.selectedBlogSubIndex != null
                  ? const Color(0xFFFFB800)
                  : Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Blog Sub Item
  Widget _blogSubItem(BuildContext context, String title, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1),
          ),
        ),
        child: CustomText(
          text: title,
          color: isSelected ? const Color(0xFFFFB800) : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _social(IconData icon) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Center(
        child: FaIcon(icon, color: Colors.orangeAccent, size: 18),
      ),
    );
  }
}
