import 'dart:ui';
import 'package:diaries/app/theme/dimens.dart';
import 'package:flutter/material.dart';

class ReferenceViewer extends StatefulWidget {
  final List<String> images;

  const ReferenceViewer({super.key, required this.images});

  @override
  State<ReferenceViewer> createState() => _ReferenceViewerState();
}

class _ReferenceViewerState extends State<ReferenceViewer> {
  int selectedIndex = 0;

  void nextImage() {
    setState(() {
      selectedIndex = (selectedIndex + 1) % widget.images.length;
    });
  }

  void previousImage() {
    setState(() {
      selectedIndex =
          (selectedIndex - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  /// ---------------- MAIN IMAGE ----------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      height: 360,
                      width: double.infinity,
                      child: Image.network(
                        widget.images[selectedIndex],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Dimens.boxHeight10,
                  SizedBox(
                    height: 140,
                    child: Stack(
                      children: [
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) {
                            bool active = index == selectedIndex;
                            return GestureDetector(
                              onTap: () {
                                setState(() => selectedIndex = index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      active
                                          ? Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          )
                                          : null,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    widget.images[index],
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder:
                              (_, __) => const SizedBox(width: 10),
                        ),
                        Positioned(
                          left: 10,
                          top: 45,
                          child: _arrowButton(
                            Icons.arrow_back_ios,
                            previousImage,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 45,
                          child: _arrowButton(
                            Icons.arrow_forward_ios,
                            nextImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Dimens.boxHeight15,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.5),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
