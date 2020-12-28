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
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      bottomNavigationBar: bottomNavBar(),
      body: Column(
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
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30 ,
                        //itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          //size: 1,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      /*Text(
                        doctor.rating,
                        style:
                        TextStyle(fontSize: 18, color: Color(0x770000000)),
                      )*/
                    ],

                  ),

                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
        ],),
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