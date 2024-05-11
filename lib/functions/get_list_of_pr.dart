import 'package:puble_frontend/models/pr_list_model.dart';
import 'package:puble_frontend/models/pr_model.dart';

Future<PullRequestsListModel> getListOfPullRequests() {
  return Future(
    () => PullRequestsListModel(
      isLoading: false,
      list: List.generate(
        40,
        (index) => PullRequestModel(
          studentId: 'asdfgh$index',
          prId: 'asddfgh$index',
          studentName: 'Смирнов Михаил Александрович',
          date: DateTime(2023, 12, 31),
          numOfPassedLabs: 0,
          numOfRepasses: 0,
          labaIndex: 1,
          prLink: "https://github.com/Aleshua/OMSTU-lubs5/pull/11",
        ),
      ),
    ),
  );
}