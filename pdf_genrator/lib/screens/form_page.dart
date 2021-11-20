import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_genrator/screens/pdf_view_screen.dart';

import '../shared/constants.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final _formkey = GlobalKey<FormState>();
//=============check box items list===================


  final _nameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _companyNameController = new TextEditingController();
  final _phoneNoController = new TextEditingController();
  final _itemoneController = new TextEditingController();
  final _itemtwoController = new TextEditingController();
  final _itemthreeController = new TextEditingController();
  final pdf = pw.Document();

  writeInPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32.0),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              level: 0,
              child:
                  pw.Text('User Details!', style: pw.TextStyle(fontSize: 40.0)),
            ),
            pw.Container(
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                  pw.SizedBox(height: 20.0),
                  pw.Text('Name: ' + _nameController.text,
                      style: pw.TextStyle(fontSize: 30.0),
                      textAlign: pw.TextAlign.left),
                  pw.SizedBox(height: 20.0),
                  pw.Text('Email: ' + _emailController.text,
                      style: pw.TextStyle(fontSize: 30.0),
                      textAlign: pw.TextAlign.left),
                  pw.SizedBox(height: 20.0),
                  pw.Text('Company Name: ' + _companyNameController.text,
                      style: pw.TextStyle(fontSize: 30.0),
                      textAlign: pw.TextAlign.left),
                  pw.SizedBox(height: 20.0),
                  pw.Text('Phone Number: ' + _phoneNoController.text,
                      style: pw.TextStyle(fontSize: 30.0),
                      textAlign: pw.TextAlign.left),
                  pw.SizedBox(height: 20.0),
                      pw.Header(
                        level: 0,
                        child:
                        pw.Text('Items added!', style: pw.TextStyle(fontSize: 40.0)),
                      ),


                      pw.SizedBox(height: 20.0),
                      pw.Text('Item one: ' + _itemoneController.text,
                          style: pw.TextStyle(fontSize: 30.0),
                          textAlign: pw.TextAlign.left),

                      pw.SizedBox(height: 20.0),
                      pw.Text('Item two: ' + _itemtwoController.text,
                          style: pw.TextStyle(fontSize: 30.0),
                          textAlign: pw.TextAlign.left),

                      pw.SizedBox(height: 20.0),
                      pw.Text('Item Three: ' + _itemthreeController.text,
                          style: pw.TextStyle(fontSize: 30.0),
                          textAlign: pw.TextAlign.left),

                ]))
          ];
        }));
  }

  Future savepdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;
    File file = File("$documentPath/details.pdf");
    file.writeAsBytesSync(await pdf.save());
  }

  //======================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Fill Your Details'),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      validator: (value) =>
                      value!.isEmpty ?'Please enter your name': null,
                      controller: _nameController,
                      decoration: kTextInputDecoration.copyWith(hintText: 'Name'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)
                            ? null
                            : "Please enter a valid email";
                      },
                      decoration:
                          kTextInputDecoration.copyWith(hintText: 'Email'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: _phoneNoController,
                      validator: (value) => value!.length < 6
                          ? 'Please enter proper number'
                          : null,
                      decoration:
                          kTextInputDecoration.copyWith(hintText: 'Phone number'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      validator: (value) =>
                      value!.isEmpty ?'Please enter your company name': null,
                      controller: _companyNameController,

                      decoration:
                          kTextInputDecoration.copyWith(hintText: 'Company Name'),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Add Items',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                           Container(
                             width: 120.0,
                            height: 40.0,
                            child: TextFormField(
                              validator: (value) =>
                              value!.isEmpty ?'Please add the item ': null,

                              controller: _itemoneController,
                              decoration: kTextInputDecoration.copyWith(
                                hintText: 'Item 1',
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                        Container(
                          width: 120.0,
                          height: 40.0,
                          child: TextFormField(
                            validator: (value) =>
                            value!.isEmpty ?'Please add the item': null,
                            controller: _itemtwoController,
                            decoration: kTextInputDecoration.copyWith(
                              hintText: 'Item 2',
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          width: 120.0,
                          height: 40.0,
                          child: TextFormField(
                            validator: (value) =>
                            value!.isEmpty ?'Please add the item ': null,
                            controller: _itemthreeController,
                            decoration: kTextInputDecoration.copyWith(
                              hintText: 'Item 3',
                            ),
                          ),
                        ),


                      ],
                    ),



                    FlatButton(
                      onPressed: () async {
                        final form = _formkey.currentState;
                       if(form!.validate()) {
                         writeInPdf();
                         await savepdf();

                         Directory documentDirectory =
                         await getApplicationDocumentsDirectory();

                         String documentPath = documentDirectory.path;
                         String path = "$documentPath/details.pdf";
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => PdfViewScreen(path: path)),
                         );
                       }
                      },
                      color: Colors.blueGrey,
                      child: Text('Create pdf'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
