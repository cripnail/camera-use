// import 'package:flutter/material.dart';
// import 'dart:io';
//
// class ImagesView extends StatelessWidget {
//
//   final List<File> images;
//   const ImagesView({Key? key, required this.images}) : super(key: key);
//
// //
// // @override
// // class _ImagesViewState extends State<ImagesView> {
// //   XFile? lastImage;
// //
// //   get images => null;
//
//   @override
//   Widget build(BuildContext context) {
//     // if (lastImage != null)
//     {return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gallery'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 3,
//         mainAxisSpacing: 2,
//         crossAxisSpacing: 2,
//         children: images
//             .map((image) => Image.file(image, fit: BoxFit.cover))
//             .toList(),
//       ),
//     );
//       // return Align(
//       //   alignment: Alignment.topRight,
//       //   child: Padding(
//       //     padding: const EdgeInsets.all(8.0),
//       //     child: Container(
//       //       decoration: BoxDecoration(
//       //           border: Border.all(color: Colors.black, width: 2.0)),
//       //       width: 120,
//       //       height: 240,
//       //       child: Image.file(
//       //         File(lastImage!.path),
//       //         fit: BoxFit.cover,
//       //       ),
//       //     ),
//       //   ),
//       // );
//     }
//     // else {
//     //   return const SizedBox.shrink();
//     // }
//   }
// }
