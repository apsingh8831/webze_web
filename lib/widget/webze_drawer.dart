import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webze_web/view/blog/mobile_blog_detail.dart';
import 'package:webze_web/view/blog/mobile_blog_screen.dart';
import 'package:webze_web/view/homepage/mobile_home.dart';
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

  /// ⭐ Scroll-to-section if Homepage is already open
  bool _scrollIfHomepageExists(String section) {
    final homeState = MobileHomeState.instance; // <-- GLOBAL ACCESS

    if (homeState != null && homeState.mounted) {
      Navigator.of(homeState.context).pop(); // close drawer
      homeState.scrollToSection(section);
      return true;
    }
    return false;
  }

  /// ⭐ Navigation helper
  void _navigate(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final drawer = Provider.of<DrawerProvider>(context);

    return Drawer(
      backgroundColor: const Color(0xFF1A1A1A),
      child: Column(
        children: [
          // HEADER ------------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('asset/image/webze.png', height: 30),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFFFFB800)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // SEARCH BAR -----------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                  border: InputBorder.none,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(height: 1, color: const Color(0xFF2A2A2A)),

          // MENU --------------------------
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ...menuItems.asMap().entries.map((entry) {
                  String item = entry.value;

                  return _menuItem(
                    context: context,
                    title: item,
                    isActive: drawer.selectedIndex == entry.key &&
                        drawer.selectedBlogSubIndex == null,
                    onTap: () {
                      drawer.selectMain(entry.key);

                      if (item == "HOME") {
                        if (_scrollIfHomepageExists("top")) return;
                        _navigate(context, const MobileHome());
                      }

                      else if (item == "FEATURES") {
                        if (_scrollIfHomepageExists("features")) return;
                        _navigate(context,
                            const MobileHome(scrollTo: "features"));
                      }

                      else if (item == "TOKEN") {
                        if (_scrollIfHomepageExists("token")) return;
                        _navigate(
                            context, const MobileHome(scrollTo: "token"));
                      }

                      else if (item == "HOW IT WORKS") {
                        if (_scrollIfHomepageExists("how")) return;
                        _navigate(
                            context, const MobileHome(scrollTo: "how"));
                      }

                      else if (item == "ROADMAP") {
                        if (_scrollIfHomepageExists("roadmap")) return;
                        _navigate(
                            context, const MobileHome(scrollTo: "roadmap"));
                      }
                    },
                  );
                }),

                // BLOG SECTION -----------------------
                _blogMainItem(context, drawer),

                if (drawer.isBlogExpanded)
                  ...blogSubItems.asMap().entries.map((entry) {
                    return _blogSubItem(
                      context,
                      entry.value,
                      drawer.selectedBlogSubIndex == entry.key,
                          () {
                        drawer.selectBlogSub(entry.key);

                        if (entry.key == 0) {
                          _navigate(context, MobileBlogScreen());
                        } else {
                          _navigate(context, MobileBlogDetail());
                        }
                      },
                    );
                  }),
              ],
            ),
          ),

          // SOCIAL ICONS --------------------
          Padding(
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

  // MENU TILE -------------------------
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
          border: Border(bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
        ),
        child: CustomText(
          text: title,
          color: isActive ? const Color(0xFFFFB800) : Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // BLOG MAIN TILE ------------------
  Widget _blogMainItem(BuildContext context, DrawerProvider drawer) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color:
        drawer.isBlogExpanded ? const Color(0xFF2A2A2A) : Colors.transparent,
        border: const Border(
            bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => _navigate(context, MobileBlogScreen()),
              child: CustomText(
                text: 'BLOG',
                color: drawer.selectedBlogSubIndex != null
                    ? const Color(0xFFFFB800)
                    : Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          InkWell(
            onTap: drawer.toggleBlogExpand,
            child: Icon(
              drawer.isBlogExpanded ? Icons.remove : Icons.add,
              color: drawer.isBlogExpanded
                  ? const Color(0xFFFFB800)
                  : Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  // BLOG SUB ITEM ------------------
  Widget _blogSubItem(
      BuildContext context, String title, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
        ),
        child: CustomText(
          text: title,
          color: isSelected ? const Color(0xFFFFB800) : Colors.white,
          fontSize: 14,
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


//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:webze_web/view/blog/mobile_blog_detail.dart';
// import 'package:webze_web/view/blog/mobile_blog_screen.dart';
// import 'package:webze_web/view/homepage/mobile_home.dart';
// import 'package:webze_web/widget/custom_text.dart';
// import '../provider/drawer_provider.dart';
//
// class WebzeDrawer extends StatelessWidget {
//   const WebzeDrawer({Key? key}) : super(key: key);
//
//   final List<String> menuItems = const [
//     'HOME',
//     'FEATURES',
//     'TOKEN',
//     'HOW IT WORKS',
//     'ROADMAP',
//   ];
//
//   final List<String> blogSubItems = const [
//     'OUR BLOG',
//     'BLOG DETAILS',
//   ];
//
//   /// ⭐ Scroll-to-Section inside same Homepage
//   bool _scrollIfHomepageExists(BuildContext context, String section) {
//     final homeState = context.findAncestorStateOfType<HomepageState>();
// // <-- FIXED
//
//     if (homeState != null) {
//       Navigator.pop(context); // close drawer
//       homeState.scrollToSection(section); // call homepage method
//       return true;
//     }
//     return false;
//   }
//
//   /// ⭐ Navigation helper
//   void _navigate(BuildContext context, Widget page) {
//     Navigator.pop(context);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => page),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final drawer = Provider.of<DrawerProvider>(context);
//
//     return Drawer(
//       backgroundColor: const Color(0xFF1A1A1A),
//       child: Column(
//         children: [
//           // HEADER ------------------
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset('asset/image/webze.png', height: 30),
//                 IconButton(
//                   icon: const Icon(Icons.close, color: Color(0xFFFFB800)),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             ),
//           ),
//
//           // SEARCH BAR -----------------
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade900,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: TextField(
//                 style: GoogleFonts.nunito(color: Colors.white, fontSize: 18),
//                 decoration: InputDecoration(
//                   hintText: 'Search here...',
//                   hintStyle: TextStyle(color: Colors.grey[600]),
//                   suffixIcon: const Icon(Icons.search, color: Colors.white),
//                   border: InputBorder.none,
//                   contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                 ),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//           Container(height: 1, color: const Color(0xFF2A2A2A)),
//
//           // MENU --------------------------
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 ...menuItems.asMap().entries.map((entry) {
//                   String item = entry.value;
//
//                   return _menuItem(
//                     context: context,
//                     title: item,
//                     isActive:
//                     drawer.selectedIndex == entry.key && drawer.selectedBlogSubIndex == null,
//                     onTap: () {
//                       drawer.selectMain(entry.key);
//
//                       if (item == "HOME") {
//                         if (_scrollIfHomepageExists(context, "top")) return;
//                         _navigate(context, const Homepage());
//                       }
//
//                       else if (item == "FEATURES") {
//                         if (_scrollIfHomepageExists(context, "features")) return;
//                         _navigate(context, const Homepage(scrollTo: "features"));
//                       }
//
//                       else if (item == "TOKEN") {
//                         if (_scrollIfHomepageExists(context, "token")) return;
//                         _navigate(context, const Homepage(scrollTo: "token"));
//                       }
//
//                       else if (item == "HOW IT WORKS") {
//                         if (_scrollIfHomepageExists(context, "how")) return;
//                         _navigate(context, const Homepage(scrollTo: "how"));
//                       }
//
//                       else if (item == "ROADMAP") {
//                         if (_scrollIfHomepageExists(context, "roadmap")) return;
//                         _navigate(context, const Homepage(scrollTo: "roadmap"));
//                       }
//                     },
//                   );
//                 }),
//
//                 // BLOG SECTION -----------------------
//                 _blogMainItem(context, drawer),
//
//                 if (drawer.isBlogExpanded)
//                   ...blogSubItems.asMap().entries.map((entry) {
//                     return _blogSubItem(
//                       context,
//                       entry.value,
//                       drawer.selectedBlogSubIndex == entry.key,
//                           () {
//                         drawer.selectBlogSub(entry.key);
//
//                         if (entry.key == 0) _navigate(context, BlogScreen());
//                         else _navigate(context, BlogDetail());
//                       },
//                     );
//                   }),
//               ],
//             ),
//           ),
//
//           // SOCIAL ICONS --------------------
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 30),
//             child: Wrap(
//               runSpacing: 20,
//               children: [
//                 _social(FontAwesomeIcons.facebookF),
//                 const SizedBox(width: 20),
//                 _social(FontAwesomeIcons.twitter),
//                 const SizedBox(width: 20),
//                 _social(FontAwesomeIcons.instagram),
//                 const SizedBox(width: 20),
//                 _social(FontAwesomeIcons.linkedin),
//                 const SizedBox(width: 20),
//                 _social(FontAwesomeIcons.youtube),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // MENU TILE -------------------------
//   Widget _menuItem({
//     required BuildContext context,
//     required String title,
//     required bool isActive,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//         decoration: const BoxDecoration(
//           border: Border(bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
//         ),
//         child: CustomText(
//           text: title,
//           color: isActive ? const Color(0xFFFFB800) : Colors.white,
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }
//
//   // BLOG MAIN TILE ------------------
//   Widget _blogMainItem(BuildContext context, DrawerProvider drawer) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//       decoration: BoxDecoration(
//         color: drawer.isBlogExpanded ? const Color(0xFF2A2A2A) : Colors.transparent,
//         border:
//         const Border(bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: InkWell(
//               onTap: () => _navigate(context, BlogScreen()),
//               child: CustomText(
//                 text: 'BLOG',
//                 color: drawer.selectedBlogSubIndex != null
//                     ? const Color(0xFFFFB800)
//                     : Colors.white,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: drawer.toggleBlogExpand,
//             child: Icon(
//               drawer.isBlogExpanded ? Icons.remove : Icons.add,
//               color: drawer.isBlogExpanded ? const Color(0xFFFFB800) : Colors.white,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // BLOG SUB ITEM ------------------
//   Widget _blogSubItem(
//       BuildContext context, String title, bool isSelected, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//         decoration: const BoxDecoration(
//           border: Border(bottom: BorderSide(color: Color(0xFF2A2A2A), width: 1)),
//         ),
//         child: CustomText(
//           text: title,
//           color: isSelected ? const Color(0xFFFFB800) : Colors.white,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }
//
//   Widget _social(IconData icon) {
//     return Container(
//       width: 45,
//       height: 45,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: const Color(0xFF2A2A2A)),
//       ),
//       child: Center(
//         child: FaIcon(icon, color: Colors.orangeAccent, size: 18),
//       ),
//     );
//   }
// }
//
