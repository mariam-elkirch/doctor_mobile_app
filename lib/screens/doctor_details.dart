import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorDetails extends StatefulWidget {
  Doctor doctor;

  DoctorDetails(this.doctor);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff07da5f),
      ),
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      bottomNavigationBar: bottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Image.asset('assets/images/1.jpg'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      // child: Image.asset('assets/images/1.jpg'),
                      backgroundImage: AssetImage(widget.doctor.urlPhoto),
                      radius: 65,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctor.name,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        widget.doctor.speciality,
                        style: TextStyle(
                            color: Color(0xff07da5f),
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                      Row(
                        children: [
                          RatingBar(
                            initialRating: widget.doctor.rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 30,
                            //itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            '${widget.doctor.rating}',
                            style: TextStyle(
                                fontSize: 18, color: Color(0x770000000)),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Text(
                "Short Description",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "${widget.doctor.shortDescription}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey),
                    Text(
                      widget.doctor.address,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                    child: Image.asset(
                      'assets/images/map.png',
                      scale: 4,
                    )),
              ),
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 53,
                  child: Center(
                    child: Text(
                      'Request',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff07da5f),
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      onTap: (index) {
        setState(() {
          _selectedItem = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important_sharp),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}