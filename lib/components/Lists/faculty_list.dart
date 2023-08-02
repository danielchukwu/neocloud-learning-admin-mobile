import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/graphql/services/faculty_service.dart';
// import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Faculty.dart';

class FacultyList extends StatefulWidget {
  const FacultyList({Key? key, this.facultyList}) : super(key: key);

  final List<FacultyModel>? facultyList;

  @override
  State<FacultyList> createState() => _FacultyListState();
}

// (){} "" <> ? _ ! *
class _FacultyListState extends State<FacultyList> {
  var facultyService = FacultyService();
  List<FacultyModel>? dataList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    if (!mounted) return;
    
    if (widget.facultyList == null) {
      facultyService.getFaculties().then((faculties) {
        setState(() {
          dataList = faculties;
        });
      });
    }  else {
      dataList = widget.facultyList;
    }  
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    // children: List.generate(facultiesList.length,
    //     (index) => FacultyCard(faculty: facultiesList[index])),
    // );
    return dataList == null
        ? Center(child: CircularProgressIndicator())
        : dataList!.isEmpty
            ? Center(child: Text('No Faculties Found'))
            : Column(
                children: List.generate(
                  facultiesList.length,
                  (index) => FacultyCard(faculty: dataList![index])
                ),
              );
  }
}
