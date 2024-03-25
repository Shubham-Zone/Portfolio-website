import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_network/image_network.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({Key? key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(

      stream: FirebaseFirestore.instance.collection('portfolio').snapshots(),

      builder: (BuildContext context,AsyncSnapshot snapshot){

        if(!snapshot.hasData) {

          return const CircularProgressIndicator();

        } if(snapshot.connectionState==ConnectionState.active){

          QuerySnapshot querySnapshot=snapshot.data;
          List<QueryDocumentSnapshot> list=querySnapshot.docs;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 5 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: list.length,
            itemBuilder: (context,index){

              QueryDocumentSnapshot document=list[index];

              // final post = posts[index];
              final title = document['title'];
              final detail = document['Detail'];
              final duration = document['Duration'];
              final technologies = document['Technologies'];
              final img = document["img"];

              return PortfolioItem(title: title, description: detail, imageUrl: img,technologies: technologies,duration: duration, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectDetailsPage(index, duration, technologies, title, img, detail)),
                );
              },);


            },
          );

          // return  ListView.builder(
          //   itemCount:list.length, // Replace with the actual number of blog posts
          //   itemBuilder: (context, index) {
          //
          //     QueryDocumentSnapshot document=list[index];
          //
          //     // final post = posts[index];
          //     final title = document['title'];
          //     final content = document['content'];
          //     final author = document['author'];
          //     final date = document['date'];
          //
          //     return ListTile(
          //       title: Text('Blog Post $index'),
          //       subtitle: Text(title),
          //       onTap: () {
          //         // Navigate to the blog post details page
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => BlogDetailsPage(index,title,content,author,date)),
          //         );
          //       },
          //     );
          //   },
          // );


          //   ListView.builder(
          //     itemCount: posts.length,
          //     itemBuilder: (context , index){
          //       final post = posts[index];
          //       final title = post['title'];
          //       final content = post['content'];
          //       return ListTile(
          //         title: Text(title),
          //         subtitle: Text(content),
          //       );
          //     }
          // );
        }
        if(snapshot.hasError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );

  }
}

class PortfolioItem extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String technologies;
  final String duration;
  final VoidCallback onTap;


  const PortfolioItem({super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.duration,
    required this.onTap


  });

  @override
  _PortfolioItemState createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  bool isHovered = false;


  @override
  Widget build(BuildContext context) {

    final scaleFactor = isHovered ? 1.02 : 1.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        double imageHeight;

        if (screenWidth >= 1200) {
          imageHeight = 290;
        } else if (screenWidth >= 800) {
          imageHeight = 250;
        } else {
          imageHeight = 140;
        }

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: IntrinsicHeight(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.identity()..scale(scaleFactor),
                decoration: BoxDecoration(
                  color: isHovered ? Colors.blue.withOpacity(0.05) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    if (isHovered)
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      child: ImageNetwork(
                        image: widget.imageUrl,
                        fitWeb: BoxFitWeb.cover,
                        height: imageHeight,
                        width: constraints.maxWidth,
                        duration: 1500,
                        curve: Curves.easeIn,
                        onPointer: true,
                        debugPrint: false,
                        fullScreen: false,
                        fitAndroidIos: BoxFit.cover,
                        onLoading: const CircularProgressIndicator(
                          color: Colors.indigoAccent,
                        ),
                        onError: const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );



  }
}

class ProjectDetailsPage extends StatelessWidget {
  final int projectIndex;

  final String title;
  final String description;
  final String imageUrl;
  final String technologies;
  final String duration;

  const ProjectDetailsPage(this.projectIndex,this.duration,this.technologies,this.title,this.imageUrl,this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project ${projectIndex + 1}'),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(

          padding: const EdgeInsets.all(16.0),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                'Project ${projectIndex + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              ImageNetwork(
                image: imageUrl,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.4,
                fitWeb: BoxFitWeb.cover,
                duration: 1500,
                curve: Curves.easeIn,
                onPointer: true,
                debugPrint: false,
                fullScreen: false,
                fitAndroidIos: BoxFit.cover,
                onLoading: const CircularProgressIndicator(
                  color: Colors.indigoAccent,
                ),
                onError: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),

              const SizedBox(height: 16),

               Text(
                description,
              ),

              const SizedBox(height: 16),

              const Text(
                'Technologies used:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

               Text(
              technologies,
              ),

              const SizedBox(height: 16),

               Text(
                'Duration: $duration',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
