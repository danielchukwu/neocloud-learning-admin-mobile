// replaces all the " " space in a string with an underscore "_" and
// returns a lowercase version of the new string and then prepends a forward
// slash "/" e.g Back Office => /back_office, Profile => /profile
String getRouteName(String value) =>
    "/" + value.replaceAll(" ", "_").toLowerCase();


// This function is used to get the amount of stars set with a provided ratings number
// e.g 100 => {full_stars: 5, half_stars: 0, empty_stars: 0}
// e.g 90  => {full_stars: 4, half_stars: 1, empty_stars: 0}
// e.g 72  => {full_stars: 3, half_stars: 0, empty_stars: 2}
Map<String, int> getStarsForRating({required double ratings}) {
  // Our final result object containing the amount of full_stars, half_stars, empty_stars to be displayed
  Map<String, int> stars = {"full_stars": 0, "half_stars": 0, "empty_stars": 0};
  // In a range of 100 where we have only 5 stars. A full star is worth
  // 20 in that range
  const fs_value = 20;
  // In a range of 100 where we have only 5 stars. Half a star is worth
  // 10 in that range
  const hs_value = 10;

  // this represents the amount of half stars that make up the entire ratings
  double half_stars = ratings/hs_value;

  // Final: get full stars in rating (2 half stars make up 1 full star)
  int full_stars = (half_stars / 2).floor();
  stars['full_stars'] = full_stars;

  // Final: is half star present in final ratings (if half star total is not divisible by 2 then their exists a half star in our final result)
  bool is_half_star_present = (half_stars % 2) == 1;
  int half_star = is_half_star_present ? 1 : 0;
  stars['half_stars'] = half_star;

  // Final: get empty stars in rating ()
  int empty_stars = 5 - (stars["full_stars"]! + stars["half_stars"]!);
  stars['empty_stars'] = empty_stars;

  return stars;
}