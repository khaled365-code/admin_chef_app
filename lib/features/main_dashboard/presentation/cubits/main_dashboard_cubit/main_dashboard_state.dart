part of 'main_dashboard_cubit.dart';

@immutable
sealed class MainDashboardState {}

final class MainDashboardInitial extends MainDashboardState {}

final class PerformMealRequestDesignState extends MainDashboardState {}


final class DealWithChefRequestLoadingState extends MainDashboardState {}


final class DealWithChefRequestSuccessState extends MainDashboardState {
  final String successMessage;

  DealWithChefRequestSuccessState({required this.successMessage});

}
final class DealWithChefRequestFailureState extends MainDashboardState {

  final ErrorModel errorModel;
  DealWithChefRequestFailureState({required this.errorModel});

}

final class DealWithMealRequestLoadingState extends MainDashboardState {}


final class DealWithMealRequestSuccessState extends MainDashboardState {
  final String successMessage;
  DealWithMealRequestSuccessState({required this.successMessage});
}


final class DealWithMealRequestFailureState extends MainDashboardState {

  final ErrorModel errorModel;
  DealWithMealRequestFailureState({required this.errorModel});

}



final class PerformChefRequestDesignState extends MainDashboardState {}

final class GetAllChefsLoadingState extends MainDashboardState {}


final class GetAllChefsSuccessState extends MainDashboardState {

  final AllChefsDataModel allChefsDataModel;

  GetAllChefsSuccessState({required this.allChefsDataModel});
}
final class GetAllChefsFailureState extends MainDashboardState {

  final ErrorModel errorModel;
  GetAllChefsFailureState({required this.errorModel});
}

final class UpdateMealIndexState extends MainDashboardState {}

final class UpdateDrawerListShape extends MainDashboardState {}

final class UpdateSecondDrawerIndexState extends MainDashboardState {}


final class UpdateSelectedCategoryIndex extends MainDashboardState {}


final class GetAllMealsLoadingState extends MainDashboardState {}


final class GetAllMealsSuccessState extends MainDashboardState {
  final AllSystemMealsModel allSystemMealsModel;

  GetAllMealsSuccessState({required this.allSystemMealsModel});

}


final class GetAllMealsErrorState extends MainDashboardState {

  final ErrorModel errorModel;

  GetAllMealsErrorState({required this.errorModel});

}

