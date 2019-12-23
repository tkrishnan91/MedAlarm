class Alarm {
  int id;
  String drugName;
  int dosage;
  String timeOfDay;


  Alarm(this.id, this.drugName, this.dosage, this.timeOfDay);

  Alarm.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    drugName = map["medname"];
    dosage = map["dosage"];
    timeOfDay = map["time"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "medname": drugName,
      "dosage": dosage,
      "time": timeOfDay
    };
    if (id != null) {
      map["_id"] = id;
    }
    return map;
  }
}
