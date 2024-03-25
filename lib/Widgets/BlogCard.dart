import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class BlogCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final String publishingDate;

  const BlogCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.publishingDate,
  });

  @override
  _BlogCardState createState() =>
      _BlogCardState();
}

class _BlogCardState extends State<BlogCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Orientation orientation = MediaQuery.of(context).orientation;

    if(orientation==Orientation.landscape){
      return ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: ImageNetwork(
                  image:widget.imageUrl,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fitWeb: BoxFitWeb.cover,
                  fitAndroidIos: BoxFit.cover,
                  duration: 1500,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  // borderRadius: BorderRadius.circular(70),
                  onLoading: const CircularProgressIndicator(
                    color: Colors.indigoAccent,
                  ),
                  onError: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // const CircleAvatar(
                            //   backgroundImage: NetworkImage(
                            //     'https://example.com/user-avatar.jpg',
                            //   ),
                            //   radius: 20,
                            // ),
                            // const SizedBox(width: 10),
                            Text(
                              widget.author,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.publishingDate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }else{
      return ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: ImageNetwork(
                  image:widget.imageUrl,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fitWeb: BoxFitWeb.cover,
                  fitAndroidIos: BoxFit.cover,
                  duration: 1500,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  // borderRadius: BorderRadius.circular(70),
                  onLoading: const CircularProgressIndicator(
                    color: Colors.indigoAccent,
                  ),
                  onError: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // const CircleAvatar(
                            //   backgroundImage: NetworkImage(
                            //     'https://example.com/user-avatar.jpg',
                            //   ),
                            //   radius: 20,
                            // ),
                            // const SizedBox(width: 10),
                            Text(
                              widget.author,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.publishingDate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

  }
}
