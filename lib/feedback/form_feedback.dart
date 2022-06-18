/// FeedbackForm is a data class which stores data fields of Feedback.
class form_feedback {
  String How_was_the_food;
  String Rating;
  String Do_you_like_the_concept_of_Robot_as_a_waiter;
  String Rating_for_the_robot;
  String Please_tell_your_overall_experience;

  form_feedback(
    this.How_was_the_food,
    this.Rating,
    this.Do_you_like_the_concept_of_Robot_as_a_waiter,
    this.Rating_for_the_robot,
    this.Please_tell_your_overall_experience,
  );

  factory form_feedback.fromJson(dynamic json) {
    return form_feedback(
        "${json['How_was_the_food']}",
        "${json['Rating']}",
        "${json['Do_you_like_the_concept_of_Robot_as_a_waiter']}",
        "${json['Rating_for_the_robot']}",
        "${json['Please_tell_your_overall_experience']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'How_was_the_food': How_was_the_food,
        'Rating': Rating,
        'Do_you_like_the_concept_of_Robot_as_a_waiter':
            Do_you_like_the_concept_of_Robot_as_a_waiter,
        'Rating_for_the_robot': Rating_for_the_robot,
        'Please_tell_your_overall_experience':
            Please_tell_your_overall_experience
      };
}
