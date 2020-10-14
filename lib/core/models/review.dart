class Review {
  String sId;
  String reviewerEmail;
  String reviewerName;
  String comments;
  String date;
  String title;

  Review(
      {this.sId,
      this.reviewerEmail,
      this.reviewerName,
      this.title,
      this.comments,
      this.date});

  Review.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    reviewerEmail = json['reviewer_email'];
    reviewerName = json['reviewer_name'];
    title = json['title'];
    comments = json['comments'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['reviewer_email'] = this.reviewerEmail;
    data['reviewer_name'] = this.reviewerName;
    data['comments'] = this.comments;
    data['date'] = this.date;
    data['title'] = this.title;
    return data;
  }
}
