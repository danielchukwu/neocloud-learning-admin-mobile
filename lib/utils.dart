// replaces all the " " space in a string with an underscore "_" and
// returns a lowercase version of the new string and then prepends a forward
// slash "/" e.g Back Office => /back_office, Profile => /profile
String getRouteName(String value) =>
    "/" + value.replaceAll(" ", "_").toLowerCase();
