import 'package:filter_app/Model/Amenity.dart';
import 'package:filter_app/Model/Item.dart';
import 'package:filter_app/Model/Property.dart';
import 'package:filter_app/Utils/SizeConfig.dart';

import 'package:filter_app/Utils/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Item> spacesList;
  int _radioValue = -1;
  List<Amenity> amenitiesList = Amenity.list;
  RangeValues rangeValues = RangeValues(0, 50000);
  double sliderValue = 0;
  bool isAvailable = false;

  void initState() {
    super.initState();

    spacesList = List<Item>.from(Item.itemList);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(),
      body: makeBody(),
    );
  }

  makeAppBar() {
    return AppBar(
      title: Text(
        'Category',
      ),
      centerTitle: true,
      backgroundColor: Colors.pink,
      leading: Icon(Icons.arrow_back),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(Icons.my_location),
        )
      ],
    );
  }

  makeBody() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical * 20,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[200],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              SizeConfig.safeBlockHorizontal * 100))),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.search,
                                color: Colors.pink,
                              ),
                            ),
                            Expanded(
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.all(0),
                                        hintText: 'Search Your Space',
                                      ),
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: FlatButton.icon(
                            icon: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                              textDirection: TextDirection.ltr,
                              size: SizeConfig.safeBlockHorizontal * 8,
                            ),
                            onPressed: () {
                              showFilterWidget();
                            },
                            label: Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 3,
                  ),
                  buildItemList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildItemList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: spacesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Image.asset(spacesList[index].img)),
                  ListTile(
                    title: Text(
                      '${spacesList[index].name}',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.place),
                          Text('${spacesList[index].addr}')
                        ],
                      ),
                    ),
                    trailing: RatingWidget(
                      value: spacesList[index].rating,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  showFilterWidget() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Text(
                      'Availability',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Available today',
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Switch(
                            value: isAvailable,
                            onChanged: (val) {
                              setState(() {
                                isAvailable = val;
                              });
                            })
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Text(
                      'Sort Options',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Popularity',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                            Radio(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue = value;
                                });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Star Rating(High to Low)',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                            Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Star Rating(Low to High)',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                            Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Most Reviewed First',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                            Radio(
                                value: 3,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                })
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              'Price(Low to High)',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                            Radio(
                                value: 4,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Text(
                      'Amenities',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: amenitiesList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: amenitiesList[index].isSelected
                                    ? Colors.lightBlue
                                    : Colors.white,
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  '${amenitiesList[index].text}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4,
                                    fontWeight: FontWeight.normal,
                                    color: amenitiesList[index].isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    amenitiesList[index].isSelected
                                        ? amenitiesList[index].isSelected =
                                            false
                                        : amenitiesList[index].isSelected =
                                            true;
                                  });
                                },
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    Text(
                      'Price Range',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Text(
                      'Price in ₹',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    RangeSlider(
                      min: 0,
                      max: 50000,
                      divisions: 8,
                      values: rangeValues,
                      onChanged: (val) {
                        setState(() {
                          rangeValues = val;
                        });
                      },
                      labels: RangeLabels(
                          '₹${rangeValues.start}', '₹${rangeValues.end}'),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Text(
                      'Units',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Slider(
                      value: sliderValue,
                      divisions: 10,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      label: '${(sliderValue * 10).toString()}',
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          applyFilters();
                        },
                        child: Text(
                          'Apply Filters',
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        color: Colors.pink,
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  applyFilters() {
    setState(() {
      spacesList = List<Item>.from(Item.itemList);
    });

    switch (_radioValue) {
      case 0:
        setState(() {
          spacesList.sort((b, a) => a.popularity.compareTo(b.popularity));
        });
        break;
      case 1:
        setState(() {
          spacesList.sort((b, a) => a.rating.compareTo(b.rating));
        });

        break;
      case 2:
        setState(() {
          spacesList.sort((a, b) => a.rating.compareTo(b.rating));
        });
        break;
      case 3:
        setState(() {
          spacesList.sort((b, a) => a.reviews.compareTo(b.reviews));
        });
        break;
      case 4:
        setState(() {
          spacesList.sort((a, b) => a.price.compareTo(b.price));
        });
        break;
    }

    if (isAvailable) {
      setState(() {
        spacesList = spacesList.where((i) => i.availability == true).toList();
      });
    } else {
      setState(() {
        spacesList = List<Item>.from(Item.itemList);
      });
    }

    // List<int> check = [];
    // Property temp = Property(
    //     projector: false,
    //     whiteboard: false,
    //     printer: false,
    //     tv: false,
    //     wifi: true,
    //     kitchen: false);

    // for (int i = 0; i < amenitiesList.length; i++) {
    //   if (amenitiesList[i].isSelected) check.add(i);
    // }

    // setState(() {
    //   spacesList = spacesList.where((i) {
    //     if (amenitiesList[0].isSelected) {
    //       return i.properties.wifi == true;
    //     } else if (amenitiesList[1].isSelected) {
    //       return i.properties.projector == true;
    //     } else if (amenitiesList[2].isSelected) {
    //       return i.properties.whiteboard == true;
    //     } else if (amenitiesList[3].isSelected) {
    //       return i.properties.printer == true;
    //     } else if (amenitiesList[4].isSelected) {
    //       return i.properties.tv == true;
    //     } else {
    //       return (i.properties.wifi == true ||
    //           i.properties.tv == true ||
    //           i.properties.whiteboard == true ||
    //           i.properties.printer == true ||
    //           i.properties.kitchen == true ||
    //           i.properties.projector == true);
    //     }
    //   }).toList();
    // });

    if (amenitiesList[0].isSelected) {
      setState(() {
        spacesList =
            spacesList.where((i) => i.properties.wifi == true).toList();
      });
    } else if (amenitiesList[1].isSelected) {
      setState(() {
        spacesList =
            spacesList.where((i) => i.properties.projector == true).toList();
      });
    } else if (amenitiesList[2].isSelected) {
      setState(() {
        spacesList =
            spacesList.where((i) => i.properties.whiteboard == true).toList();
      });
    } else if (amenitiesList[3].isSelected) {
      setState(() {
        spacesList =
            spacesList.where((i) => i.properties.printer == true).toList();
      });
    } else if (amenitiesList[4].isSelected) {
      setState(() {
        spacesList = spacesList.where((i) => i.properties.tv == true).toList();
      });
    } else if (amenitiesList[5].isSelected) {
      setState(() {
        spacesList =
            spacesList.where((i) => i.properties.kitchen == true).toList();
      });
    } else {
      setState(() {
        spacesList = List<Item>.from(Item.itemList);
      });
    }

    setState(() {
      spacesList = spacesList
          .where(
              (i) => i.price >= rangeValues.start && i.price <= rangeValues.end)
          .toList();
    });

    if (sliderValue > 0) {
      setState(() {
        spacesList = spacesList.where((i) => i.units >= sliderValue).toList();
      });
    }

    Navigator.of(context).pop();
  }
}
