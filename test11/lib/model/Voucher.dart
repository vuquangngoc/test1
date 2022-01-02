class Voucher {
  String code;
  String description;
  int count;
  int discount;
  String startTime;
  String endTime;
  String createdDate;
  String updatedDate;
  bool isDisable;
  bool isDeleted;

  Voucher(
      { required this.code,
        required this.description,
        required this.count,
        required  this.discount,
        required this.startTime,
        required this.endTime,
        required this.createdDate,
        required this.updatedDate,
        required this.isDisable,
        required this.isDeleted});

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
    code : json['code'],
    description : json['description'],
    count : json['count'],
    discount : json['discount'],
    startTime : json['startTime'],
    endTime : json['endTime'],
    createdDate : json['createdDate'],
    updatedDate : json['updatedDate'],
    isDisable : json['isDisable'],
    isDeleted : json['isDeleted'],
  );
}

