import 'package:flutter/material.dart';
import 'package:oapata_mart/src/DataLayer/resources/repository.dart';
import 'package:oapata_mart/src/PresentationLayer/config/routeGenerator.dart';

import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App(
      routesGenerator: RoutesGenerator(),
      repository: Repository(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   final Repository repository = new Repository();
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CategoryBloc>(
//           create: (context) =>
//               CategoryBloc(repository: repository)..add(AppStarted()),
//         )
//       ],
//       child: MaterialApp(
//         title: 'Category Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: BlocBuilder<CategoryBloc, CategoryState>(
//           builder: (context, state) {
//             return Home();
//           },
//         ),
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Category"),
//       ),
//       body: BlocBuilder<CategoryBloc, CategoryState>(
//         builder: (context, state) {
//           if (state is Loading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is LoadCategory) {
//             return ListView.separated(
//               separatorBuilder: (context, index) => Divider(),
//               itemCount: state.categories.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     state.categories[index].name,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(state.categories[index].slug ?? ""),
//                 );
//               },
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
