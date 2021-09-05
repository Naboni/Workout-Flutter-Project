import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  TextEditingController weight = TextEditingController();
  bool fieldIsEmpty = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('(#############');

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.2),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'How much do you weigh?',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: weight,
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    hintText: 'kg',
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan.shade300),
                    ),
                  ),
                  //###############edit the submit function################3
                  onSubmitted: (val) => {
                    double.parse(weight.text),
                    fieldIsEmpty = false,
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(width: 1, color: Colors.cyan),
                      borderRadius: BorderRadius.circular(1000.0)),
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: fieldIsEmpty
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              elevation: 0,
                              shape: StadiumBorder()),
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 22),
                          ),
                          onPressed: null,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.blue[200],
                              shadowColor: Colors.blue,
                              elevation: 0,
                              shape: StadiumBorder()),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (ctx) => Weight(),
                            // ));
                          },
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
