import 'dart:convert';

class Counter {
  int count;
  String msg;
  Counter({
    required this.count,
    required this.msg,
  });
  

  Counter copyWith({
    int? count,
    String? msg,
  }) {
    return Counter(
      count: count ?? this.count,
      msg: msg ?? this.msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'msg': msg,
    };
  }

  factory Counter.fromMap(Map<String, dynamic> map) {
    return Counter(
      count: map['count']?.toInt() ?? 0,
      msg: map['msg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Counter.fromJson(String source) => Counter.fromMap(json.decode(source));

  @override
  String toString() => 'Counter(count: $count, msg: $msg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Counter &&
      other.count == count &&
      other.msg == msg;
  }

  @override
  int get hashCode => count.hashCode ^ msg.hashCode;
}
