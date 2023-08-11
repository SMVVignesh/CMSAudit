class AuditResponse {
  List<Data>? data;
  num? currentPage;
  num? totalPages;
  num? totalCount;
  num? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  AuditResponse(
      {this.data,
        this.currentPage,
        this.totalPages,
        this.totalCount,
        this.pageSize,
        this.hasPreviousPage,
        this.hasNextPage});

  AuditResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['totalCount'] = this.totalCount;
    data['pageSize'] = this.pageSize;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? startedDate;
  String? endedDate;
  String? closingTakenDateTime;
  String? lastBilledInvoNumber;
  String? description;
  bool? isActive;
  String? branchId;
  String? branchName;
  Branch? branch;

  Data(
      {this.id,
        this.name,
        this.startedDate,
        this.endedDate,
        this.closingTakenDateTime,
        this.lastBilledInvoNumber,
        this.description,
        this.isActive,
        this.branchId,
        this.branchName,
        this.branch});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startedDate = json['startedDate'];
    endedDate = json['endedDate'];
    closingTakenDateTime = json['closingTakenDateTime'];
    lastBilledInvoNumber = json['lastBilledInvoNumber'];
    description = json['description'];
    isActive = json['isActive'];
    branchId = json['branchId'];
    branchName = json['branchName'];
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startedDate'] = this.startedDate;
    data['endedDate'] = this.endedDate;
    data['closingTakenDateTime'] = this.closingTakenDateTime;
    data['lastBilledInvoNumber'] = this.lastBilledInvoNumber;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['branchId'] = this.branchId;
    data['branchName'] = this.branchName;
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    return data;
  }
}

class Branch {
  String? id;
  String? name;
  String? gstNo;
  String? description;
  bool? isActive;
  String? addressId;
  Address? address;
  String? contactId;
  Contact? contact;
  String? companyId;
  String? companyName;

  Branch(
      {this.id,
        this.name,
        this.gstNo,
        this.description,
        this.isActive,
        this.addressId,
        this.address,
        this.contactId,
        this.contact,
        this.companyId,
        this.companyName});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gstNo = json['gstNo'];
    description = json['description'];
    isActive = json['isActive'];
    addressId = json['addressId'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    contactId = json['contactId'];
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    companyId = json['companyId'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gstNo'] = this.gstNo;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['addressId'] = this.addressId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['contactId'] = this.contactId;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    data['companyId'] = this.companyId;
    data['companyName'] = this.companyName;
    return data;
  }
}

class Address {
  String? id;
  List<DomainEvents>? domainEvents;
  String? createdBy;
  String? createdOn;
  String? lastModifiedBy;
  String? lastModifiedOn;
  String? deletedOn;
  String? deletedBy;
  String? pincode;
  String? fullAddress;
  String? landmark;
  String? googleMapLocation;
  String? countryId;
  String? stateProvinceId;
  String? cityId;
  String? areaId;
  Area? area;
  String? categoryId;
  String? categoryType;

  Address(
      {this.id,
        this.domainEvents,
        this.createdBy,
        this.createdOn,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.deletedOn,
        this.deletedBy,
        this.pincode,
        this.fullAddress,
        this.landmark,
        this.googleMapLocation,
        this.countryId,
        this.stateProvinceId,
        this.cityId,
        this.areaId,
        this.area,
        this.categoryId,
        this.categoryType});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['domainEvents'] != null) {
      domainEvents = <DomainEvents>[];
      json['domainEvents'].forEach((v) {
        domainEvents!.add(new DomainEvents.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOn = json['lastModifiedOn'];
    deletedOn = json['deletedOn'];
    deletedBy = json['deletedBy'];
    pincode = json['pincode'];
    fullAddress = json['fullAddress'];
    landmark = json['landmark'];
    googleMapLocation = json['googleMapLocation'];
    countryId = json['countryId'];
    stateProvinceId = json['stateProvinceId'];
    cityId = json['cityId'];
    areaId = json['areaId'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    categoryId = json['categoryId'];
    categoryType = json['categoryType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.domainEvents != null) {
      data['domainEvents'] = this.domainEvents!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['deletedOn'] = this.deletedOn;
    data['deletedBy'] = this.deletedBy;
    data['pincode'] = this.pincode;
    data['fullAddress'] = this.fullAddress;
    data['landmark'] = this.landmark;
    data['googleMapLocation'] = this.googleMapLocation;
    data['countryId'] = this.countryId;
    data['stateProvinceId'] = this.stateProvinceId;
    data['cityId'] = this.cityId;
    data['areaId'] = this.areaId;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['categoryId'] = this.categoryId;
    data['categoryType'] = this.categoryType;
    return data;
  }
}

class DomainEvents {
  String? triggeredOn;

  DomainEvents({this.triggeredOn});

  DomainEvents.fromJson(Map<String, dynamic> json) {
    triggeredOn = json['triggeredOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['triggeredOn'] = this.triggeredOn;
    return data;
  }
}

class Area {
  String? id;
  List<DomainEvents>? domainEvents;
  String? createdBy;
  String? createdOn;
  String? lastModifiedBy;
  String? lastModifiedOn;
  String? deletedOn;
  String? deletedBy;
  String? name;
  String? areaCode;
  String? description;
  bool? isActive;
  String? cityId;
  City? city;

  Area(
      {this.id,
        this.domainEvents,
        this.createdBy,
        this.createdOn,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.deletedOn,
        this.deletedBy,
        this.name,
        this.areaCode,
        this.description,
        this.isActive,
        this.cityId,
        this.city});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['domainEvents'] != null) {
      domainEvents = <DomainEvents>[];
      json['domainEvents'].forEach((v) {
        domainEvents!.add(new DomainEvents.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOn = json['lastModifiedOn'];
    deletedOn = json['deletedOn'];
    deletedBy = json['deletedBy'];
    name = json['name'];
    areaCode = json['areaCode'];
    description = json['description'];
    isActive = json['isActive'];
    cityId = json['cityId'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.domainEvents != null) {
      data['domainEvents'] = this.domainEvents!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['deletedOn'] = this.deletedOn;
    data['deletedBy'] = this.deletedBy;
    data['name'] = this.name;
    data['areaCode'] = this.areaCode;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['cityId'] = this.cityId;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class City {
  String? id;
  List<DomainEvents>? domainEvents;
  String? createdBy;
  String? createdOn;
  String? lastModifiedBy;
  String? lastModifiedOn;
  String? deletedOn;
  String? deletedBy;
  String? name;
  String? cityCode;
  String? description;
  bool? isActive;
  String? stateProvinceId;
  StateProvince? stateProvince;

  City(
      {this.id,
        this.domainEvents,
        this.createdBy,
        this.createdOn,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.deletedOn,
        this.deletedBy,
        this.name,
        this.cityCode,
        this.description,
        this.isActive,
        this.stateProvinceId,
        this.stateProvince});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['domainEvents'] != null) {
      domainEvents = <DomainEvents>[];
      json['domainEvents'].forEach((v) {
        domainEvents!.add(new DomainEvents.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOn = json['lastModifiedOn'];
    deletedOn = json['deletedOn'];
    deletedBy = json['deletedBy'];
    name = json['name'];
    cityCode = json['cityCode'];
    description = json['description'];
    isActive = json['isActive'];
    stateProvinceId = json['stateProvinceId'];
    stateProvince = json['stateProvince'] != null
        ? new StateProvince.fromJson(json['stateProvince'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.domainEvents != null) {
      data['domainEvents'] = this.domainEvents!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['deletedOn'] = this.deletedOn;
    data['deletedBy'] = this.deletedBy;
    data['name'] = this.name;
    data['cityCode'] = this.cityCode;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['stateProvinceId'] = this.stateProvinceId;
    if (this.stateProvince != null) {
      data['stateProvince'] = this.stateProvince!.toJson();
    }
    return data;
  }
}

class StateProvince {
  String? id;
  List<DomainEvents>? domainEvents;
  String? createdBy;
  String? createdOn;
  String? lastModifiedBy;
  String? lastModifiedOn;
  String? deletedOn;
  String? deletedBy;
  String? name;
  String? stateCode;
  String? description;
  bool? isActive;
  String? countryId;
  Country? country;

  StateProvince(
      {this.id,
        this.domainEvents,
        this.createdBy,
        this.createdOn,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.deletedOn,
        this.deletedBy,
        this.name,
        this.stateCode,
        this.description,
        this.isActive,
        this.countryId,
        this.country});

  StateProvince.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['domainEvents'] != null) {
      domainEvents = <DomainEvents>[];
      json['domainEvents'].forEach((v) {
        domainEvents!.add(new DomainEvents.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOn = json['lastModifiedOn'];
    deletedOn = json['deletedOn'];
    deletedBy = json['deletedBy'];
    name = json['name'];
    stateCode = json['stateCode'];
    description = json['description'];
    isActive = json['isActive'];
    countryId = json['countryId'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.domainEvents != null) {
      data['domainEvents'] = this.domainEvents!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['deletedOn'] = this.deletedOn;
    data['deletedBy'] = this.deletedBy;
    data['name'] = this.name;
    data['stateCode'] = this.stateCode;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    data['countryId'] = this.countryId;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  String? id;
  List<DomainEvents>? domainEvents;
  String? createdBy;
  String? createdOn;
  String? lastModifiedBy;
  String? lastModifiedOn;
  String? deletedOn;
  String? deletedBy;
  String? name;
  String? countryCode;
  String? description;
  bool? isActive;

  Country(
      {this.id,
        this.domainEvents,
        this.createdBy,
        this.createdOn,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.deletedOn,
        this.deletedBy,
        this.name,
        this.countryCode,
        this.description,
        this.isActive});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['domainEvents'] != null) {
      domainEvents = <DomainEvents>[];
      json['domainEvents'].forEach((v) {
        domainEvents!.add(new DomainEvents.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOn = json['lastModifiedOn'];
    deletedOn = json['deletedOn'];
    deletedBy = json['deletedBy'];
    name = json['name'];
    countryCode = json['countryCode'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.domainEvents != null) {
      data['domainEvents'] = this.domainEvents!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['deletedOn'] = this.deletedOn;
    data['deletedBy'] = this.deletedBy;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    return data;
  }
}

class Contact {
  String? id;
  List<DomainEvents>? domainEvents;
  String? createdBy;
  String? createdOn;
  String? lastModifiedBy;
  String? lastModifiedOn;
  String? deletedOn;
  String? deletedBy;
  String? contactPersonName;
  String? contactNumber;
  String? alternativeNumber;
  String? ownerName;
  String? ownerNumber;
  String? ownerAlternativeNumber;
  String? email;
  String? categoryId;
  String? categoryType;

  Contact(
      {this.id,
        this.domainEvents,
        this.createdBy,
        this.createdOn,
        this.lastModifiedBy,
        this.lastModifiedOn,
        this.deletedOn,
        this.deletedBy,
        this.contactPersonName,
        this.contactNumber,
        this.alternativeNumber,
        this.ownerName,
        this.ownerNumber,
        this.ownerAlternativeNumber,
        this.email,
        this.categoryId,
        this.categoryType});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['domainEvents'] != null) {
      domainEvents = <DomainEvents>[];
      json['domainEvents'].forEach((v) {
        domainEvents!.add(new DomainEvents.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOn = json['lastModifiedOn'];
    deletedOn = json['deletedOn'];
    deletedBy = json['deletedBy'];
    contactPersonName = json['contactPersonName'];
    contactNumber = json['contactNumber'];
    alternativeNumber = json['alternativeNumber'];
    ownerName = json['ownerName'];
    ownerNumber = json['ownerNumber'];
    ownerAlternativeNumber = json['ownerAlternativeNumber'];
    email = json['email'];
    categoryId = json['categoryId'];
    categoryType = json['categoryType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.domainEvents != null) {
      data['domainEvents'] = this.domainEvents!.map((v) => v.toJson()).toList();
    }
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedOn'] = this.lastModifiedOn;
    data['deletedOn'] = this.deletedOn;
    data['deletedBy'] = this.deletedBy;
    data['contactPersonName'] = this.contactPersonName;
    data['contactNumber'] = this.contactNumber;
    data['alternativeNumber'] = this.alternativeNumber;
    data['ownerName'] = this.ownerName;
    data['ownerNumber'] = this.ownerNumber;
    data['ownerAlternativeNumber'] = this.ownerAlternativeNumber;
    data['email'] = this.email;
    data['categoryId'] = this.categoryId;
    data['categoryType'] = this.categoryType;
    return data;
  }
}
