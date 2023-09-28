abstract class RemoteUserEvent {
  final String text;
  const RemoteUserEvent(this.text);
}

class GetUserEvent extends RemoteUserEvent {
  const GetUserEvent(super.text);
}