class NotificationTypeModel {
  final String id;
  final String name;

  NotificationTypeModel({
    required this.id,
    required this.name,
  });

  static NotificationTypeModel fromMap({required Map nt}) => NotificationTypeModel(
    id: nt['_id'],
    name: nt['name'],
  );
}


// query Query {
//   notificationTypes {
//     _id
//     name
//   }
// }