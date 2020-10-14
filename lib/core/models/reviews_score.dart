class ReviewsScore {
  double overallAverage;
  int sanitization;
  int wearingMask;
  int socialDistancing;

  ReviewsScore(
      {this.overallAverage,
      this.sanitization,
      this.wearingMask,
      this.socialDistancing});

  ReviewsScore.fromJson(Map<String, dynamic> json) {
    overallAverage = json['overall_average'];
    sanitization = json['sanitization'];
    wearingMask = json['wearing_mask'];
    socialDistancing = json['social_distancing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overall_average'] = this.overallAverage;
    data['sanitization'] = this.sanitization;
    data['wearing_mask'] = this.wearingMask;
    data['social_distancing'] = this.socialDistancing;
    return data;
  }
}
