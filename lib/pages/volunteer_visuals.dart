// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/pages/login_screen.dart';
import 'package:ngo_app/pages/volunteer_info.dart';
import 'package:d_chart/d_chart.dart';

class VolunteerVisuals extends StatefulWidget {
  const VolunteerVisuals({super.key});

  @override
  State<VolunteerVisuals> createState() => _VolunteerVisualsState();
}

class _VolunteerVisualsState extends State<VolunteerVisuals> {
  var data,
      email,
      year2018,
      tc18,
      year2019,
      tc19,
      year2020,
      tc20,
      year2021,
      tc21,
      year2022,
      tc22;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getVolunteersData() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final docRef = _firestore
        .collection("volunteer contribution")
        .doc(_auth.currentUser?.email);
    docRef.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      year2018 = data['year'];
      tc18 = data['total cotributions'];

      setState(() {});
    });

    final docRef1 = _firestore
        .collection("volunteer contribution 2019")
        .doc(_auth.currentUser?.email);
    docRef1.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      year2019 = data['year'];
      tc19 = data['total cotributions'];

      setState(() {});
    });

    final docRef2 = _firestore
        .collection("volunteer contribution 2020")
        .doc(_auth.currentUser?.email);
    docRef2.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      year2020 = data['year'];
      tc20 = data['total cotributions'];

      setState(() {});
    });

    final docRef3 = _firestore
        .collection("volunteer contribution 2021")
        .doc(_auth.currentUser?.email);
    docRef3.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      year2021 = data['year'];
      tc21 = data['total cotributions'];

      setState(() {});
    });

    final docRef4 = _firestore
        .collection("volunteer contribution 2022")
        .doc(_auth.currentUser?.email);
    docRef4.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      year2022 = data['year'];
      tc22 = data['total cotributions'];

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visuals'),
        flexibleSpace: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF024E04),
                  Color(0xFF0B5D0B),
                ]),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          size: 24,
        ),
      ),
      body: Center(
        child: DChartBar(
          data: [
            {
              'id': 'Bar',
              'data': [
                {'domain': '2018', 'measure': 10},
                {'domain': '2019', 'measure': 5},
                {'domain': '2020', 'measure': 6},
                {'domain': '2021', 'measure': 5},
                {'domain': '2022', 'measure': 10},
              ],
            },
          ],
          domainLabelPaddingToAxisLine: 16,
          axisLineTick: 2,
          axisLinePointTick: 2,
          axisLinePointWidth: 10,
          axisLineColor: Colors.green,
          measureLabelPaddingToAxisLine: 16,
          barColor: (barData, index, id) => Colors.green,
          showBarValue: true,
        ),
      ),
    );
  }
}
