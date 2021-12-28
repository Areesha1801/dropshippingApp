import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../firebaseapi.dart';
import '../brain.dart';
import 'address.dart';
import 'paymentoption.dart';
import 'success.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

//final FirebaseDatabase database = FirebaseDatabase.instance;
class JazzCash extends StatefulWidget {
  const JazzCash({Key key}) : super(key: key);

  @override
  _JazzCashState createState() => _JazzCashState();
}

class _JazzCashState extends State<JazzCash> {

  String item;
  String quanity;
  String price;
  functionality obj = functionality();
  String x;
  File imageFile;
  ImagePicker img = ImagePicker();
  String url;
  Future<void> _openGallery(BuildContext context) async{
    var picture= (await  ImagePicker().getImage(source:ImageSource.gallery));
     setState(() {
      print(picture);
      imageFile =  File(picture.path);
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialogue(BuildContext context){
   return showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text('Click button to open Gallery'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            GestureDetector(
              child: Text('Gallery'),
              onTap: (){
                _openGallery(context);

              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
          ],
        ),
      ),
      );
   });
  }

  void uploadFile() async{
    final Reference postImageReference = FirebaseStorage.instance.ref().child('Order Images');
    var timeKey = new DateTime.now();
    final UploadTask uploadTask = postImageReference.child(timeKey.toString()+ ".jpg").putFile(imageFile);

    var ImageUrl = await(await uploadTask).ref.getDownloadURL();
    url = ImageUrl.toString();
    print("Image Url = " + url);

    saveToDatabase(url);
  }
  void saveToDatabase(url){
    var dbTimeKey = new DateTime.now();
    var formatDate = DateFormat('MM d, yyyy');
    var formateTime = DateFormat('EEE, hh:mm aaa');
    
    String date=formatDate.format(dbTimeKey);
    String time=formateTime.format(dbTimeKey);
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    String potato = "${obj.showItems()[0]} : ${obj.showItems()[1]} g, ${obj.showItems()[2]} Rs";
    String brocolli = "${obj.showItems()[3]} : ${obj.showItems()[4]} g, ${obj.showItems()[5]} Rs";


        var cartData={
          "Item": "$potato , $brocolli",
          "image": url,
          "time": time,
          "Location": obj.showLocation(),
          "PaymentMethod": "Jazzcash",
          "Name": "Areesha",//obj.userName(),
          "Number": "654321",//obj.userNumber(),
          "TotalPrice": obj.bill(),
        };
        ref.child("Order1").push().set(cartData);

  }
  /*Future uploadFile() async{
    if (imageFile == null)
      {
        return;
      }else{
      final fileName = basename(imageFile.path);
      final destination = 'Order1/$fileName';
      FirebaseApi.uploadFile(destination, imageFile);

    }
  }*/

  Widget _decideImageView(){
    if(imageFile == null){
      return Text('No Images Selected');
    }else{
      return Image.file(imageFile,width: 200, height: 200,);
  }
  }
  /*@override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff69A03A),
        leading: Padding(
          padding: const EdgeInsets.only(),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const paymentOption()));
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(),
          child: Center(
            child: Text(
              'Jazz Cash',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Your Total Bill is ${obj.bill()} Rs',

                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Please pay amount to Jazzcash Account:',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '1234567891 and upload receipt',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    _decideImageView(),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20,
                      ),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: const Color(0xff69A03A),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Upload Receipt Image",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          _showChoiceDialogue(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 20,
                      ),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: const Color(0xff69A03A),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Place Order",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          uploadFile();
                          print(item);
                          /*database.reference().child("User1").child("Order1").child("Item").set("$item");
                          database.reference().child("User1").child("Order1").child("Quantity").set("$quanity");
                          database.reference().child("User1").child("Order1").child("Price").set("$price");
                          uploadFile();*/



                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Success()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

