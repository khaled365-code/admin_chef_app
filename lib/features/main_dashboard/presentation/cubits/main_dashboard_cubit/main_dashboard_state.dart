part of 'main_dashboard_cubit.dart';

@immutable
sealed class MainDashboardState {}

final class MainDashboardInitial extends MainDashboardState {}

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

