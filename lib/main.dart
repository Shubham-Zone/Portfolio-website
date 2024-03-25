import 'package:flutter/material.dart';
import 'package:portfolio/Mongodb.dart';
import 'Widgets/Blogs.dart';
import 'Widgets/Contact.dart';
import 'Widgets/Home.dart';
import 'Widgets/Portfolio.dart';
import 'Widgets/SocialMedia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await mongoDb.connect();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shubham Kumar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const MyHomePage(title: 'Shubham Kumar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Shubham Kumar',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
          tabs: const <Widget>[
            Tab(text: 'Home'),
            Tab(text: 'Portfolio'),
            Tab(text: 'Blog'),
            Tab(text: 'SocialMedia'),
            Tab(text: 'Contact'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget> [
          const Center(
            child: Home(),
          ),
          const Center(
            child: PortfolioWidget(),
          ),
          const Center(
            child: BlogWidget(),
          ),
          Center(
            child: SocialMediaHandlesWidget()
          ),
          const Center(
            child: ContactWidget(),
          ),
        ],
      ),
    );
  }
}
