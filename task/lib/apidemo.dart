import 'package:flutter/material.dart';
import 'package:task/models/post.dart';
import 'package:task/services/remote_service.dart';

class ApiDemo extends StatefulWidget {
  const ApiDemo({Key? key}) : super(key: key);

  @override
  State<ApiDemo> createState() => _ApiDemoState();
}

@override
Widget build(BuildContext context) {
  return Container();
}

class _ApiDemoState extends State<ApiDemo> {
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
    // ignore: avoid_print
    print(posts);
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
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Posts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w900),
                  ),
                  trailing: Icon(
                    Icons.filter_list_rounded,
                    color: Colors.white,
                  ),
                ),
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
                      child: ListView.builder(
                          itemCount: posts?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(posts![index].title),
                                leading: Text('${posts![index].userId}'),
                              ),
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
