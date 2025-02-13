import 'package:first_app/pages/actus.dart';
import 'package:first_app/pages/appels.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/communaute.dart';
import 'package:first_app/pages/communaute.dart';
import 'package:first_app/pages/discussions.dart';

//RunApp permet d'afficher un widget a l'ecran

void main() {
  runApp(MaterialApp(
/**
 * Theme pour changer la couleur des icons et de l'arriere plan
 */
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      //Pour supprimer le debug app
      debugShowCheckedModeBanner: false,
      home: HomePage()));
}

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  //Utiliser dans le NavigationBar
  final pages = [
    DiscussionsPage(),
    ActusPage(),
    CommunautePage(),
    AppelsPage()
  ];
  int pageIndex = 0;
  Color bg = Colors.white;
  final List images = [
    'https://letemps-17455.kxcdn.com/photos/130f060a-53b2-4c6b-93ef-e15b18ba192f/small',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFvpNT5PeU2VU7kb-se1nFIApLJ4RfkzhIJQ&s'
  ];
  @override
  Widget build(BuildContext context) {
    //Scaffold permet de definir la structure d'une appli mobile avec une entte et un corps
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text('Béneficiaires'),
        //Ajout de la barre de menu
        //leading pour dire que icon menu vient avant le title du appBar
        //leading: Icon(Icons.menu),
        //elevation controle la taille de l'ombre du appBar
        elevation: 12,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      // body: Center(
      //   child: Text('Bonjour $counter'),
      // ),
/**
 * Utilisation de row qui permet dalligner des éléments défilables
 */
      // body: ListView(scrollDirection: Axis.horizontal, children: [
      //   Image.network(
      //       'https://letemps-17455.kxcdn.com/photos/130f060a-53b2-4c6b-93ef-e15b18ba192f/small'),
      //   Image.network(
      //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFvpNT5PeU2VU7kb-se1nFIApLJ4RfkzhIJQ&s'),
      //   Image.network(
      //       'https://letemps-17455.kxcdn.com/photos/130f060a-53b2-4c6b-93ef-e15b18ba192f/small'),
      //   Image.network(
      //       'https://letemps-17455.kxcdn.com/photos/130f060a-53b2-4c6b-93ef-e15b18ba192f/small')
      // ]),

/**
 * NavigationBar de WhatsApp
 */
      // body: Center(
      //   child: Text('WHATSAPP'),
      // ),
      // body: pages[pageIndex],
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //       border: Border(
      //     top: BorderSide(color: Colors.grey, width: 0.2),
      //   )),
      //   child: NavigationBar(
      //       // Pour changer l'icone active par clic
      //       selectedIndex: pageIndex,
      //       //Pour que le clic change la page
      //       onDestinationSelected: (int index) {
      //         setState(() {
      //           pageIndex = index;
      //         });
      //       },
      //       backgroundColor: Colors.white,
      //       destinations: const [
      //         NavigationDestination(
      //             icon: Icon(Icons.message), label: 'Discussions'),
      //         NavigationDestination(
      //             icon: Icon(Icons.filter_tilt_shift), label: 'Actus'),
      //         NavigationDestination(
      //             icon: Icon(Icons.group), label: 'Communautes'),
      //         NavigationDestination(icon: Icon(Icons.phone), label: 'Appels'),
      //       ]),
      // ),
/**
 * Les types de bouttons 
 */
      // body: ListView(
      //   padding: EdgeInsets.all(20),
      //   children: [
      //     ElevatedButton(
      //         onPressed: () {},
      //         child: const Text('Elevatedd boutton'),
      //         //Diminuer le bord radius
      //         style: ElevatedButton.styleFrom(
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10)))),
      //     OutlinedButton(
      //         onPressed: () {},
      //         child: const Text('Outlined bouttons'),
      //         style: OutlinedButton.styleFrom(backgroundColor: Colors.orange)),
      //     TextButton(
      //         //change la couleur du background lorsque l'on clic sur un boutton
      //         onPressed: () {
      //           setState(() {
      //             bg = Colors.orange;
      //           });
      //         },
      //         child: const Text('Texte Boutton')),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.home),
      //       style: IconButton.styleFrom(backgroundColor: Colors.yellow),
      //     )
      //   ],
      // ),
// Menu a l'angle droit

      drawer: Drawer(
        child: ListView(
          children: [
            //Le titre du menu
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu')),
            //Liens clicable
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.settings),
              title: Text("Parametres"),
              // action lorsqu'onclique sur le lien
              onTap: () {},
            ),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.account_box),
              title: Text("Profil"),
              //Les trailings viennent apres le title
              trailing: Icon(Icons.chevron_right),
              // action lorsqu'onclique sur le lien
              onTap: () {},
            ),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.help),
              title: Text("Help"),
              // action lorsqu'onclique sur le lien
              onTap: () {},
            ),
            ListTile(
              //leading qui vient avant le titre
              leading: Icon(Icons.close),
              title: Text("Quittez"),
              // action lorsqu'onclique sur le lien
              onTap: () {},
            )
          ],
        ),
      ),
      body: Center(child: Text('Flutter drawer menu')),

// /**
//  * Utilisation de row qui permet dalligner des éléments défilables. avec un tableau dynamique
//  * ListView.builder permet d'afficher une liste d'élement
//  * ListView.separated permet de definir des separateur avec des style
//  */
//       body: ListView.separated(
//         itemCount: images.length,
//         itemBuilder: (context, index) {
//           return Container(
//             child: Image.network(
//               images[index],
//               width: 200,
//             ),
//             margin: EdgeInsets.all(100),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return Divider();
//         },
//       ),
/**
 * Utilisation de row qui permet d'alligner les éléments horizontalement
 */
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Icon(Icons.thumb_up),
      //     Image.network(
      //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeWSR-aNhg_8mtpRL_U48v8hHF2mOfdp8BBA&s',
      //       width: 150,
      //     ),
      //     Icon(Icons.thumb_down)
      //   ],
      // ),

/** Utilisation de column qui permet d'alligner les élément de facon verticale dans le body
 * le mainAxisAlignment permet de donne l'emplacement des élément sur l'axe des vertical
 * ou meme de definir l'espacemment entres les différents éléments avec la methode axe between 
 * crossAlignment donne des precisions sur l'alignement contraire
 */
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Text('Stephane Sanou'),
      //     Text('Investir au pays'),
      //     Image.network(
      //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeWSR-aNhg_8mtpRL_U48v8hHF2mOfdp8BBA&s')
      //   ],
      // ),
      /** Utilisation de Container dans le body  */
      // body: Container(
      //     child: Text('Bonjour'),
      //     padding: EdgeInsets.all(10),
      //     //aligner le texte en haut a gauche
      //     alignment: const Alignment.topLeft,
      //     margin: const EdgeInsets.all(20),
      //     height: 200,
      //     width: 400,
      //     decoration: BoxDecoration(
      //         color: Colors.blue, borderRadius: BorderRadius.circular(10))),
      // floatingActionButton Pour afficher le boutton en bas de page
      floatingActionButton: FloatingActionButton(
        //lorsque on clique sur le button afficher le point incrementer
        onPressed: () {
          //reconstruire l'interface
          setState(() {
            counter += 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
//Stateless implementation
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   // const et le constructeur permet d'ameliorer la performance de l'application
//   @override
//   Widget build(BuildContext context) {
//     // return const Center(
//     //     child: Text(
//     //   "Bonjour Burkina",
//     //   textDirection: TextDirection.ltr,
//     // ));
//     //Scaffold permet de definir la structure d'une appli mobile avec une entte et un corps
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Beneficiaires'),
//         //elevation controle la taille de l'ombre du appBar
//         elevation: 12,
//       ),
//       body: const Center(
//         child: Text('Bonjour'),
//       ),
//       // floatingActionButton Pour afficher le boutton en bas de page
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
