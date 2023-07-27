import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: bilgiTesti(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class bilgiTesti extends StatefulWidget {
  const bilgiTesti({super.key});

  @override
  State<bilgiTesti> createState() => _bilgiTestiState();
}

class _bilgiTestiState extends State<bilgiTesti> {
  List<Widget> secimler = [];

  int soruIndex = 0;
  List<String> sorular = [
    "Adana tükiye'nin başkentidir",
    "Dünyadaki tavuk sayısı insan sayısından fazladır",
    "Kelebeklerin ömrü bir gündür",
    "Dünya üçgendir",
    "Kutuplara gittikçe ağırlık artar",
    "Güneş bir yıldızdır"
  ];

  List<bool> cevaplar = [false, true, false, false, true, true];









  @override






showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("Evet"),
    onPressed: () { 


  
           setState(() {
                Navigator.pop(context);
                if (secimler.length == sorular.length) {
         secimler.clear();
    }
  soruIndex=0;
});
      
     },
  );

  if(soruIndex==sorular.length){

// set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Test Bitti."),
    content: Text("Tekrar oynamak ister misiniz?"),
    actions: [
      okButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );


  }
}





  Widget build(BuildContext context) {
    if (soruIndex == sorular.length) {
      soruIndex = 0;
    }

    if (secimler.length == 7) {
   var x =secimler.last;
   secimler.clear();
   secimler.add(x);
       }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan.shade900,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Container()),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        sorular[soruIndex],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ))),
              Padding(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < secimler.length; i++) secimler[i]
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (cevaplar[soruIndex] == false)
                              secimler.add(trueicon);
                            else
                              secimler.add(falseicon);

                            if (secimler.length == soruIndex) {
                              soruIndex = 0;
                            } else
                              soruIndex++;
                          });



                             showAlertDialog(context);



                        },
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.thumb_down,
                            )),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      )),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (cevaplar[soruIndex] == true)
                              secimler.add(trueicon);
                            else
                              secimler.add(falseicon);

                            if (secimler.length == soruIndex) {
                              soruIndex = 0;
                            } else
                              soruIndex++;
                          });




                          showAlertDialog(context);



                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.thumb_up,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

const Icon trueicon = Icon(
  Icons.mood,
  color: Colors.green,
);
const Icon falseicon = Icon(
  Icons.mood,
  color: Colors.red,
);







