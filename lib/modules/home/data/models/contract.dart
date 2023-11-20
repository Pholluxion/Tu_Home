class ContractsResponse {
  final List<Contract> contracts;

  ContractsResponse({
    required this.contracts,
  });

  factory ContractsResponse.fromJson(List<dynamic> json) {
    List<Contract> contracts = [];
    contracts = json.map((i) => Contract.fromJson(i)).toList();

    return ContractsResponse(
      contracts: contracts,
    );
  }
}

class Contract {
  final int id;
  final List<dynamic> startDate;
  final List<dynamic> endDate;
  final String rent;
  final String deposit;
  final String status;
  final int userId;
  final int propertyId;

  Contract({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.rent,
    required this.deposit,
    required this.status,
    required this.userId,
    required this.propertyId,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      rent: json['rent'],
      deposit: json['deposit'],
      status: json['status'],
      userId: json['userId'],
      propertyId: json['propertyId'],
    );
  }
}
