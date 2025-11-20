import 'package:flutter/material.dart';
import 'package:webze_web/view/blog/web_blog_detail.dart';
import 'package:webze_web/view/blog/web_blog_screen.dart';
import 'package:webze_web/widget/button.dart';

class DesktopAppbar extends StatefulWidget {
  const DesktopAppbar({super.key});

  @override
  State<DesktopAppbar> createState() => _DesktopAppbarState();
}

class _DesktopAppbarState extends State<DesktopAppbar> {
  String selectedItem = 'HOME';
  String? hoveredItem;

  OverlayEntry? blogOverlay;

  final List<String> blogMenu = [
    "OUR BLOG",
    "BLOG DETAILS",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Row(
          children: [
            Image.asset(
              'asset/image/webze.png',
              height: 40,
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Row(
                children: [
                  Expanded(child: hoverText('HOME')),
                  Expanded(child: hoverText('FEATURES')),
                  Expanded(child: hoverText('TOKEN')),
                  Expanded(child: hoverText('HOW IT WORKS')),
                  Expanded(child: hoverText('ROADMAP')),
                  Expanded(child: blogHover()),
                ],
              ),
            ),

            const SizedBox(width: 40),
            CustomBuyButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }

  // BLOG BUTTON WITH HOVER
  Widget blogHover() {
    final bool isSelected = selectedItem == 'BLOG';
    final bool isHovered = hoveredItem == 'BLOG';

    return MouseRegion(
      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          hoveredItem = 'BLOG';
        });
        showBlogMenu();
      },

      // ❗Dropdown को यहाँ बंद नहीं करेंगे
      onExit: (_) {
        setState(() {
          hoveredItem = null;
        });
      },

      child: GestureDetector(
        onTap: () => setState(() => selectedItem = 'BLOG'),
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isSelected ? 30 : 0,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6B84D),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "BLOG",
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? const Color(0xFFE6B84D)
                      : isHovered
                      ? Colors.white
                      : Colors.grey.shade400,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // SHOW DROPDOWN
  void showBlogMenu() {
    if (blogOverlay != null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    blogOverlay = OverlayEntry(
      builder: (context) => Positioned(
        right: position.dx + 70,
        top: position.dy + 65,

        child: MouseRegion(
          onEnter: (_) {},

          // ❗Dropdown छोड़ने पर dropdown बंद
          onExit: (_) => hideBlogMenu(),

          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B1B),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: blogMenu.map((item) {
                  return InkWell(
                    onTap: () {
                      if (item == 'OUR BLOG') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebBlogScreen()),
                        );
                      }
                      else if (item == 'BLOG DETAILS') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebBlogDetail()),
                        );
                      }

                      hideBlogMenu();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(blogOverlay!);
  }

  void hideBlogMenu() {
    blogOverlay?.remove();
    blogOverlay = null;
  }

  // NORMAL TEXT ITEMS
  Widget hoverText(String text) {
    final bool isSelected = selectedItem == text;
    final bool isHovered = hoveredItem == text;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hoveredItem = text),
      onExit: (_) => setState(() => hoveredItem = null),
      child: GestureDetector(
        onTap: () => setState(() => selectedItem = text),
        child: Container(
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: isSelected ? 30 : 0,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6B84D),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? const Color(0xFFE6B84D)
                      : isHovered
                      ? Colors.white
                      : Colors.grey.shade400,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
