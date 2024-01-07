import "package:cached_network_image/cached_network_image.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";

class ImageSlider extends StatefulWidget {

  const ImageSlider({required this.imgList, super.key});
  final List<String> imgList;

  @override
  State<StatefulWidget> createState() => _ImageSliderState(imgList: imgList);
}

class _ImageSliderState extends State<ImageSlider> {

  _ImageSliderState({required this.imgList});
  final List<String> imgList;
  int _current = 0;

  @override
  Widget build(final BuildContext context) => Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 1,
                  onPageChanged: (final index, final rs) {
                    setState(() {
                      _current = index;
                    });
                  },),
              items: imgList
                  .map((final item) => InteractiveViewer(

                    panEnabled: false, // Set it to false
                    boundaryMargin: const EdgeInsets.all(100),
                    minScale: 0.5,
                    maxScale: 2,
                    child: CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          progressIndicatorBuilder: (final context, final url, final progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              value: progress.progress,
                            ),
                          ),
                        ),
                  ),)
                  .toList(),
            ),
          ),
        ],
      ),
    );
}

class CarouselPage extends StatelessWidget {

  const CarouselPage({required this.imgList, super.key});
  final List<String> imgList;

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Image Carousel"),
      ),
      body: const Center(
          child: ImageSlider(
        imgList: [],
      ),),
    );
}
