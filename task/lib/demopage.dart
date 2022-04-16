import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task/apidemo.dart';
import 'package:task/models/post.dart';
import 'package:task/services/remote_service.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

@override
Widget build(BuildContext context) {
  return Container();
}

class _DemoPageState extends State<DemoPage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _rating;
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade500,
        body: SafeArea(
          child: Column(children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 50,
              child:  Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ListTile(
                  leading: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  
                  title: const Text(
                    "Doctors",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                  trailing: const Icon(
                    Icons.filter_list_rounded,
                     color: Colors.white,
                  ),
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApiDemo(),
                      ),
                    );
         
                   
                       }),
              ),
               ),
                 
            
                   
               
           
            Expanded(
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "SEARCH",
                            hintStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38),
                            suffixIcon: IconButton(
                              onPressed: () => _controller.clear(),
                              icon: const Icon(
                                Icons.search,
                                color: Colors.lightBlueAccent,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2 * 1.45,
                      child: ListView.builder(
                          itemCount: posts?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZG9jdG9yJTIwcGhvbmV8ZW58MHx8MHx8&w=1000&q=80"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Dr. Ram Bahadur Kc",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "MBBS and MD",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "Speciality",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Rs 50,000 per checkup",
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Info",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w100)),
                                            const Text(
                                              "English, Nepali",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text(
                                              "Price",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            const Text(
                                              "15,000",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            RatingBar(
                                              ratingWidget: RatingWidget(
                                                full: const Icon(
                                                  Icons.star,
                                                  color: Colors.blueGrey,
                                                ),
                                                half: const Icon(
                                                  Icons.star,
                                                  color: Colors.blueGrey,
                                                ),
                                                empty: const Icon(
                                                  Icons.star_border,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              initialRating: 1,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemSize: 20,
                                              onRatingUpdate: (rating) {
                                                _rating = rating;
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 23,
                                      child: ElevatedButton(
                                          child: const Text(
                                              "Click here to consult",
                                              style: TextStyle(fontSize: 11)),
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              foregroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.blueGrey),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(5),
                                                      side: const BorderSide(color: Colors.blueGrey)))),
                                          onPressed: () {}),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SizedBox(
                                      height: 23,
                                      child: ElevatedButton(
                                          child: const Text(
                                              "Visit for more info",
                                              style: TextStyle(fontSize: 11)),
                                          style: ButtonStyle(
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              foregroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                      Colors.blueGrey),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(5),
                                                      side: const BorderSide(color: Colors.blueGrey)))),
                                          onPressed: () {}),
                                    ),
                                  ],
                                )
                              ]),
                            );
                          }),
                    ),
                  ),
                ]),
              ),
            )
          ]),
        ));
  }
}
