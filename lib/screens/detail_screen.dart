import 'package:flutter/material.dart';
import 'package:market_view/model/crop_model.dart';
import 'package:market_view/widget/line_chart.dart';

class DetailScreen extends StatefulWidget {
  final Crop? crop;

  DetailScreen({
    this.crop,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isTrue = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    isTrue = widget.crop?.isUp ?? false;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.crop?.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text('₹${widget.crop?.rate ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: isTrue ? Colors.green : Colors.red,
                    ),
                    child: Text(
                      '${true ? '+' : '-'}' + '${widget.crop?.growth ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 12.0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),

              SizedBox(height: 10.0,),

              Container(
                color: Colors.lightBlueAccent,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: LineChart(),
              ),


              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1.0, color: Colors.grey),
                      bottom: BorderSide(width: 1.0, color: Colors.grey)),
                ),
                child: Row(
                  children: [
                    DaysItem(
                        isSelected: i == 0,
                        day: '1D',
                        onPressed: () {
                          setState(() {
                            i = 0;
                          });
                        }
                    ),
                    SizedBox(width: 5.0,),
                    DaysItem(
                        isSelected: i == 1,
                        day: '5D',
                        onPressed: () {
                          setState(() {
                            i = 1;
                          });
                        }
                    ),
                    SizedBox(width: 5.0,),
                    DaysItem(
                        isSelected: i == 2,
                        day: '1M',
                        onPressed: () {
                          setState(() {
                            i = 2;
                          });
                        }
                    ),
                    SizedBox(width: 5.0,),
                    DaysItem(
                        isSelected: i == 3,
                        day: '3D',
                        onPressed: () {
                          setState(() {
                            i = 3;
                          });
                        }
                    ),
                    SizedBox(width: 5.0,),
                    DaysItem(
                        isSelected: i == 4,
                        day: '1Y',
                      onPressed: () {
                          setState(() {
                            i = 4;
                          });
                      }
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget DaysItem({required bool isSelected, required String day, required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : null,
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Center(
          child: Text(
            '${day}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
