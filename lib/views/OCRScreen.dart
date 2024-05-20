// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_ml_vision/google_ml_vision.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class OCRScreen extends StatefulWidget {
//   @override
//   _OCRScreenState createState() => _OCRScreenState();
// }

// class _OCRScreenState extends State<OCRScreen> {
//   File? _pickedImage;
//   String _extractedText = '';

//   // Initialize Firebase
//   final Future<FirebaseApp> _firebaseInit = Firebase.initializeApp();

//   // Function to pick image from gallery
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedImageFile = await ImagePicker().pickImage(source: source);
//     if (pickedImageFile == null) return;

//     setState(() {
//       _pickedImage = File(pickedImageFile.path);
//     });

//     _extractTextFromImage();
//   }

//   // Function to extract text from image
//   Future<void> _extractTextFromImage() async {
//     if (_pickedImage == null) return;

//     final inputImage = InputImage.fromFilePath(_pickedImage!.path);
//     final textDetector = GoogleMlVision.textDetector();
//     final RecognisedText recognisedText =
//         await textDetector.processImage(inputImage);

//     String extractedText = '';
//     for (TextBlock block in recognisedText.blocks) {
//       for (TextLine line in block.lines) {
//         extractedText += '${line.text}\n';
//       }
//     }

//     setState(() {
//       _extractedText = extractedText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OCR Demo'),
//       ),
//       body: FutureBuilder(
//         future: _firebaseInit,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               if (_pickedImage != null) ...[
//                 Image.file(
//                   _pickedImage!,
//                   height: 300,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Extracted Text:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Text(
//                       _extractedText,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ] else ...[
//                 Center(
//                   child: Text(
//                     'No image selected.',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ],
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _pickImage(ImageSource.gallery),
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add_photo_alternate),
//       ),
//     );
//   }
// }
