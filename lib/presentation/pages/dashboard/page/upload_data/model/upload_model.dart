class UploadDataModel {
  int id;
  String name;
  int? totalCount;
  int? completedCount;
  int? errorCount;
  bool isLoading;

  UploadDataModel({required this.id, required this.name, required this.totalCount,required this.isLoading,this.completedCount,this.errorCount});
}
