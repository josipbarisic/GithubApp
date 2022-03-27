abstract class BaseModel<T> {
  Map<String, dynamic> toJson();

  T clone();

  ///For mutations, use the map with names of parameters written in snake case.
  T cloneWithMutation(Map<String, dynamic> mutation);
}
