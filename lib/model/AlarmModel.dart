class AlarmModel{
  final String medName;
  final int medDosage;
  final String time;
  
  AlarmModel(this.medName, this.medDosage, this.time);

  AlarmModel.fromJson(Map<String, dynamic> json) :
      medName = json['medName'],
      medDosage = json['medDosage'],
      time = json['time'];

  Map<String, dynamic> toJson() =>
      {
        'medName' : this.medName,
        'medDosage': this.medDosage,
        'time' : this.time
      };

}

