// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipe/views/home.dart';

void main() => runApp(MaterialApp(
  title: 'Food Secret Recipes' ,
  theme: ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.white
      )
    )
  ),
  home: const Home(),
));

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MaterialApp(
//     home: Recipe(),
//   ));
// }
//
// class Recipe extends StatefulWidget {
//   const Recipe({Key? key}) : super(key: key);
//
//   @override
//   State<Recipe> createState() => _RecipeState();
// }
//
// class _RecipeState extends State<Recipe> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//
//   //creating methods
//
//   void _addRecipe() async {
//     String name = _nameController.text;
//     String description = _descriptionController.text;
//
//     if(name.isNotEmpty && description.isNotEmpty){
//       await _db.collection('recipe').add({'name': name, 'description': description});
//       _nameController.clear();
//       _descriptionController.clear();
//     }
//   }
//
//   Widget _buildListItem (DocumentSnapshot documents) {
//     return ListTile (
//       //title: Text(document['name']),
//       //subtitle: Text(document ['description']),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SECRET RECIPES'),
//         centerTitle: true,
//       ),
//
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       hintText: 'Ofe Nsala Recipe',
//                       labelText: 'Name of Recipe'
//                   ),
//                 ),
//                 const SizedBox(height: 16,),
//                 TextField(
//                   controller: _descriptionController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       hintText: 'This recipe is made up of....',
//                       labelText: 'Description'
//                   ),
//                 ),
//
//                 const SizedBox(height: 16,),
//
//                 ElevatedButton(
//                     onPressed: _addRecipe ,
//                     child: const Text('Add Recipe'))
//               ],
//             ),),
//
//           //main Column continues here
//           Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: _db.collection('recipes').snapshots(),
//                   builder:(context, snapshot) {
//                     if(snapshot.hasData) {
//                       return ListView(
//                         children:
//                         snapshot.data.docs.map((documents) =>
//                             _buildListItem(documents)).toList(),
//                       );
//                     } else if (snapshot.hasError){
//                       return Center(
//                         child: Text('Error: ${snapshot.error}'),
//                       );
//                     } else {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                   } ))
//         ],
//       ),
//     );
//   }
// }
//
//
