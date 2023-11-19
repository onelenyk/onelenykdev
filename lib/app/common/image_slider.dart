import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  final List<String> imgList;

  const ImageSlider({super.key, required this.imgList});

  @override
  State<StatefulWidget> createState() {
    return _ImageSliderState(imgList: imgList);
  }
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imgList;
  int _current = 0;

  _ImageSliderState({required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  aspectRatio: 1,
                  onPageChanged: (index, rs) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: imgList
                  .map((item) => InteractiveViewer(

                    panEnabled: false, // Set it to false
                    boundaryMargin: EdgeInsets.all(100),
                    minScale: 0.5,
                    maxScale: 2,
                    child: CachedNetworkImage(
                          imageUrl: item,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              value: progress.progress,
                            ),
                          ),
                        ),
                  ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  final List<String> imgList;

  CarouselPage({required this.imgList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Carousel'),
      ),
      body: Center(
          child: ImageSlider(
        imgList: [],
      )),
    );
  }
}
