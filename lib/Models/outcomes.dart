class Outcomes {
  String outcome;

  Outcomes({this.outcome});

  Outcomes.fromJson(Map<String, dynamic> json) {
    outcome = json['outcome'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['outcome'] = this.outcome;
  //   return data;
  // }
}
