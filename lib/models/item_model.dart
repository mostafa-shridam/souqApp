class ItemModel {
  String? productName;
  String? productSalary;
  String? productImage;
  String? productDesc;
  double? rate;
  int? conte;
  int? id;
  bool? isSelect;

  ItemModel({
    this.productImage,
    this.productName,
    this.productSalary,
    this.rate,
    this.conte,
    this.productDesc,
    this.id,
    this.isSelect,
  });

  factory ItemModel.fromFirebase(Map<String, dynamic> firebase) {
    return ItemModel(
      productImage: firebase['productImage'],
      productName: firebase['productName'],
      productSalary: firebase['productSalary'],
      conte: firebase['conte'],
      productDesc: firebase['productDesc'],
      rate: firebase['rate'],
      id: firebase['id'],
      isSelect: firebase['isSelect'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productImage': productImage,
      'productName': productName,
      'productSalary': productSalary,
      'conte': conte,
      'productDesc': productDesc,
      'rate': rate,
      'id': id,
      'isSelect': isSelect,
    };
  }
}
