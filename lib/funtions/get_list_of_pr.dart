import 'package:tum_proj/models/pr_list_element_model.dart';
import 'package:tum_proj/models/pr_list_model.dart';

Future<PullRequestsListModel> getListOfPullRequests() {
  return Future(
    () => PullRequestsListModel(
      isLoading: false,
      list: List.generate(
        40,
        (index) => PullRequestElementModel(
          studentId: 'asdfgh$index',
          prId: 'asddfgh$index',
          studentName: 'Смирнов Михаил Александрович',
          date: DateTime(2023, 12, 31),
          numOfPassedLabs: 0,
          numOfRepasses: 0,
          labaIndex: 1,
        ),
      ),
    ),
  );
}
