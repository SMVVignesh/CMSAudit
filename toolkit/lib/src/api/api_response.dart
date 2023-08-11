
class ApiResponse<T> {
  Status? status;
  T? body;
  String? message;
  Exception? exception;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.body) : status = Status.COMPLETED;

  ApiResponse.error(this.exception, this.message): status = Status.ERROR;

  ApiResponse.unAuthorised(this.exception, this.message): status = Status.UN_AUTHORISED;


  @override
  String toString() {
    return "Status : $status \n Message : $message \n Body : $body";
  }
}

enum Status { LOADING, COMPLETED, ERROR,UN_AUTHORISED }
