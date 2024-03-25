import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:portfolio/Mongodb.dart';
import 'package:portfolio/Widgets/card.dart';
import 'package:portfolio/Widgets/DynamicButton.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import '../constants.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // var collection;
  //
  // connect() async {
  //
  //   var db = await mongo.Db.create(MONGO_URL);
  //   await db.open();
  //   inspect(db);
  //   var status = db.serverStatus();
  //   print(status);
  //   collection = db.collection(COLLECTION_NAME);
  //   print(await collection.find().toList());
  //
  //
  // }


  // @override
  // void initState() {
  //   connect();
  //   super.initState();
  // }

  void contactButtonPressed() {
    // Implement your contact logic here
    // For example, you can show a dialog, send an email, or make a phone call
    // when the contact button is pressed
    // print('Contact button pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: constraints.maxWidth > 800 ? 500 : 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.3)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'I AM A DEVELOPER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Horizontally center the buttons
                        children: [
                          InkWell(
                            onTap: () async {
                              // Your onTap logic for "View Work" button here
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: const DynamicButton(
                                label: "View Work",
                                iconData: Icons.computer,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Add spacing between buttons
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: const DynamicButton(
                              label: "Hire me",
                              iconData: Icons.work,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'About ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 28,
                            ),
                          ),
                          TextSpan(
                            text: 'Myself',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "I am a skilled full stack developer with expertise in both frontend and backend development. I have a strong foundation in Flutter for building dynamic and responsive user interfaces. On the backend, I am proficient in various technologies such as Node.js, Express, and databases like MongoDB. I thrive in designing and implementing scalable architecture, creating efficient APIs, and ensuring smooth data flow between the frontend and backend components. With a passion for problem-solving and staying up-to-date with the latest industry trends, I am dedicated to delivering high-quality and user-centric applications. I am an effective collaborator and possess excellent communication skills, allowing me to work seamlessly in both individual and team-oriented environments. My goal is to leverage my skills and experience to create innovative and robust solutions that meet the needs of clients and users.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 210,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: 5,left: 5,right: 5,top: 5),
                    child: Row(
                      children: [

                        SkillsCard(title: "Skills", skills: 'Flutter, Dart, HTML, CSS, JavaScript , Nodejs , Mongo db ,Realm , Firebase'),
                        SizedBox(width: 10),
                        SkillsCard(title: "Projects", skills: 'Project 1, Project 2, Project 3'),
                        SizedBox(width: 10),
                        SkillsCard(title: "Testimonials", skills: 'Great work, Excellent service'),
                        SizedBox(width: 10),
                        SkillsCard(title: "Contact", skills: 'Email: devshubham652@gmail.com , Phone: +919050074225'),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.only(left: 10,right: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/f4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(child: Text(textAlign: TextAlign.center,"Coding is a never-ending puzzle, where problem-solving and creativity intersect",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(

                      child: Lottie.asset("assets/lottie/animation1.json",fit: BoxFit.cover)
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
