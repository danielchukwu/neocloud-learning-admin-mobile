class RoleModel {
  final String id;
  final String name;

  RoleModel({
    required this.id,
    required this.name,
  });

  static RoleModel fromMap({required Map role}) => RoleModel(
    id: role['_id'],
    name: role['name'],
  );
}

// query Query($limit: Int) {
//   roles(limit: $limit) {
//     _id
//     name
//   }
// }