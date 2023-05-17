import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_view/model/crop_model.dart';
import 'package:market_view/model/model_result.dart';
import 'package:market_view/screens/detail_screen.dart';
import 'package:market_view/widget/drop_down.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crops',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                DropDown(),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 5.0),
                      Text(
                        'Search',
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Expanded(
                  child: Container(
                    child: FutureBuilder<List<Crop>>(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          bool isTrue;
                          return snapshot.data?.isNotEmpty ?? false
                              ? ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                isTrue = snapshot.data?[index].isUp ?? false;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (builder) => DetailScreen(crop: snapshot.data?[index],)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(width: 1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${snapshot.data?[index].name}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  ?.copyWith(
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              '${snapshot.data?[index].city}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text('₹${snapshot.data?[index].rate}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    ?.copyWith(
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5.0),
                                                color: isTrue
                                                    ? Colors.green
                                                    : Colors.red,
                                              ),
                                              child: Text(
                                                '${true ? '+' : '-'}' +
                                                    '${snapshot.data?[index].growth}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    ?.copyWith(fontSize: 14.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                              : Center(
                            child: Text("List is empty"),
                          );
                        } else if (snapshot.hasError) {
                          Text("${snapshot.error}");
                        }

                        // By default, show a loading spinner.
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<List<Crop>> getData() async {
    String jsonData = await rootBundle.loadString('assets/data.json');
    return CropResult.fromJson(json.decode(jsonData)).crops;
  }
}