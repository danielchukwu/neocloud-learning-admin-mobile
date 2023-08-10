import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:neocloud_mobile/components/stacks.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';

// replaces all the " " space in a string with an underscore "_" and
// returns a lowercase version of the new string and then prepends a forward
// slash "/" e.g Back Office => /back_office, Profile => /profile
String getRouteName(String value) =>
    "/" + value.replaceAll(" ", "-").toLowerCase();

// This function is used to get the amount of stars set with a provided
// ratings number
// e.g 100 => {full_stars: 5, half_stars: 0, empty_stars: 0}
// e.g 90  => {full_stars: 4, half_stars: 1, empty_stars: 0}
// e.g 72  => {full_stars: 3, half_stars: 0, empty_stars: 2}
Map<String, int> getStarsForRating({required double ratings}) {
  // Our final result object containing the amount of full_stars, half_stars,
  // empty_stars to be displayed
  Map<String, int> stars = {"full_stars": 0, "half_stars": 0, "empty_stars": 0};
  // In a range of 100 where we have only 5 stars. A full star is worth
  // 20 in that range
  const fs_value = 20;
  // In a range of 100 where we have only 5 stars. Half a star is worth
  // 10 in that range
  const hs_value = 10;

  // this represents the amount of half stars that make up the entire ratings
  double half_stars = ratings / hs_value;

  // Final: get full stars in rating (2 half stars make up 1 full star)
  int full_stars = (half_stars / 2).floor();
  stars['full_stars'] = full_stars;

  // Final: is half star present in final ratings (if half star total is not
  // divisible by 2 then their exists a half star in our final result)
  bool is_half_star_present = (half_stars % 2) == 1;
  int half_star = is_half_star_present ? 1 : 0;
  stars['half_stars'] = half_star;

  // Final: get empty stars in rating ()
  int empty_stars = 5 - (stars["full_stars"]! + stars["half_stars"]!);
  stars['empty_stars'] = empty_stars;

  return stars;
}

// takes `count` and `a singular word` then based on the count it either
// pluralizes the singular word or returns the singular word like this
String getPluralOrSingular({required int count, required String word}) {
  var result = '';
  if (count == 0 || count >= 2) {
    if (word.endsWith('ss')) {
      // e.g Singular; class - Plural; classes
      return "${word}es";
    }
    return "${word}s"; // e.g Singular; educator - plural; educators
  }
  return word;
}

// if a text is longer than a specified number this func shortens it
// and adds an ellipse e.g  text: daniel, limit: 3  => dan...
String shortenText({required String text, required int limit}) {
  if (text.length > limit) {
    // shorten the text and return with ellipse
    return text.substring(0, limit) + "...";
  }
  return text;
}

// Gets the proper format of money, e.g 99999.0 =>  99,999.00
String getMoneyFormat(double num) {
  var formatter = NumberFormat.currency(symbol: '');

  return formatter.format(num);
}

// Gets the proper rating format e.g 4.3222 => 4.3 or 2.54 => 2.5
String getRatingFormat(double rating) => "${(rating / 20)}".substring(0, 3);

// Stack util functions
// This function extracts the String url of the avatars from the List<Account>
// passed in and creates a list with that then passes it into the
// StackedImages Widget which returns a Widget of stacked images
Widget buildStackedUserImgs(
    {required List<Account> users,
    double imgSize = 35,
    double overlapDifference = 25}) {
  List<String> avatarsList = [];
  for (var i = 0; i < users.length; i++) {
    if (i < 3) {
      avatarsList.add(users[i].avatar);
      continue;
    }
    break;
  }
  return StackedImages(
    imgList: avatarsList,
    length: users.length,
    imgSize: imgSize,
    stackRight: true,
    overlapDifference: overlapDifference,
  );
}

Widget buildStackedClassImgs(
    {required List<Course> classList,
    double imgSize = 35,
    double overlapDifference = 25}) {
  List<String> avatarsList = [];
  for (var i = 0; i < classList.length; i++) {
    if (i < 3) {
      avatarsList.add(classList[i].avatar);
      continue;
    }
    break;
  }
  return StackedImages(
    imgList: avatarsList,
    length: classList.length,
    imgSize: imgSize,
    stackRight: true,
    overlapDifference: overlapDifference,
  );
}

// Get Role Icon Filename
String getRoleSvgFileName({required List<String> roleList}) {
  String svg = "assets/icons/roles/";
  if (roleList.contains("SuperAdmin")) {
    svg += "superadmin.svg";
  } else if (roleList.contains("Admin")) {
    svg += "admin.svg";
  } else if (roleList.contains("Educator")) {
    svg += "educator.svg";
  } else if (roleList.contains("Student")) {
    svg += "student.svg";
  }

  return svg;
}
