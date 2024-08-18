import 'package:admin_chef_app/core/database/errors/error_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/all_system_meals_model/all_system_meals_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/models/drawer_data_model/drawer_data_model.dart';
import 'package:admin_chef_app/features/main_dashboard/data/repos/dashboard_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../data/models/categories_data_model.dart';
import '../../../data/models/chefs_data/all_chefs_data_model.dart';

part 'main_dashboard_state.dart';

class MainDashboardCubit extends Cubit<MainDashboardState> {
  MainDashboardCubit({required this.dashBoardRepoImplementation}) : super(MainDashboardInitial());
  static MainDashboardCubit get(context) => BlocProvider.of(context);


 final DashBoardRepoImplementation dashBoardRepoImplementation;

  List<DrawerDataModel> firstDrawerDataList=[
    DrawerDataModel(image: ImageConstants.dashBoardIcon, text: 'Home',itemIsSelected: true),
    DrawerDataModel(image: ImageConstants.mealIcon, text: 'System Meals'),
    DrawerDataModel(image: ImageConstants.chefsIcon, text: 'System Chefs'),
    DrawerDataModel(image: ImageConstants.dealWithChefRequestIcon, text: 'Chefs Requests'),
    DrawerDataModel(image: ImageConstants.orderIcon, text: 'Meals Requests'),

  ];
  
  
  List<DrawerDataModel>secondDrawerDataList=[
    DrawerDataModel(image: ImageConstants.trashIcon, text: 'Delete Meal'),
    DrawerDataModel(image: ImageConstants.trashIcon, text: 'Delete Chef'),
    DrawerDataModel(image: ImageConstants.logoutIcon, text: 'Logout account'),
  ];

  int firstDrawerListIndex=0;

  int secondDrawerListIndex=0;


  updateFirstDrawerListShape({required int currentIndex})
  {
    for(var item in firstDrawerDataList)
    {
      item.itemIsSelected=false;
    }
    for(var item in secondDrawerDataList)
    {
      item.itemIsSelected=false;
    }
    firstDrawerDataList[currentIndex].itemIsSelected=true;

    emit(UpdateDrawerListShape());
  }

  updateSecondDrawerListShape({required int currentIndex})
  {
    for(var item in firstDrawerDataList)
    {
      item.itemIsSelected=false;
    }
    for(var item in secondDrawerDataList)
    {
      item.itemIsSelected=false;
    }
    secondDrawerDataList[currentIndex].itemIsSelected=true;

    emit(UpdateDrawerListShape());
  }


  List<CategoriesDataModel> categoriesList = [
    CategoriesDataModel(categoryName: 'Beef'),
    CategoriesDataModel(categoryName: 'Chicken'),
    CategoriesDataModel(categoryName: 'Fish'),
    CategoriesDataModel(categoryName: 'Seafood'),
    CategoriesDataModel(categoryName: 'Pork'),
    CategoriesDataModel(categoryName: 'Lamb'),
    CategoriesDataModel(categoryName: 'Vegetarian'),
    CategoriesDataModel(categoryName: 'Vegan'),
    CategoriesDataModel(categoryName: 'Gluten-free'),
    CategoriesDataModel(categoryName: 'Dairy-free'),
    CategoriesDataModel(categoryName: 'Breakfast'),
    CategoriesDataModel(categoryName: 'Lunch'),
    CategoriesDataModel(categoryName: 'Dinner'),
    CategoriesDataModel(categoryName: 'Appetizers'),
    CategoriesDataModel(categoryName: 'Salads'),
    CategoriesDataModel(categoryName: 'Soups'),
    CategoriesDataModel(categoryName: 'Sandwiches'),
    CategoriesDataModel(categoryName: 'Pasta'),
    CategoriesDataModel(categoryName: 'Pizza'),
    CategoriesDataModel(categoryName: 'Rice dishes'),
    CategoriesDataModel(categoryName: 'Stir-fries'),
    CategoriesDataModel(categoryName: 'Curries'),
    CategoriesDataModel(categoryName: 'Desserts'),
    CategoriesDataModel(categoryName: 'Baked goods'),
    CategoriesDataModel(categoryName: 'Snacks')
  ];


  List<String>mealsImages=[
    ImageConstants.blackChocolateImage,
    ImageConstants.cartImage1,
    ImageConstants.cartImage2,
    ImageConstants.cartImage3,
    ImageConstants.cartImage4,
    ImageConstants.filfilImage,
    ImageConstants.meksaratImage,
    ImageConstants.redPizzaImage,
    ImageConstants.spaghettiImage,
    ImageConstants.sweetsImage,
    ImageConstants.vegetablePizzaImage,
    ImageConstants.blackChocolateImage,
    ImageConstants.cartImage1,
    ImageConstants.cartImage2,
    ImageConstants.cartImage3,
    ImageConstants.cartImage4,
    ImageConstants.filfilImage,
    ImageConstants.meksaratImage,
    ImageConstants.redPizzaImage,
    ImageConstants.spaghettiImage,
    ImageConstants.sweetsImage,
    ImageConstants.vegetablePizzaImage,
    ImageConstants.blackChocolateImage,
    ImageConstants.cartImage1,
    ImageConstants.cartImage2,
    ImageConstants.cartImage3,
    ImageConstants.cartImage4,
    ImageConstants.filfilImage,
    ImageConstants.meksaratImage,
    ImageConstants.redPizzaImage,
    ImageConstants.spaghettiImage,
    ImageConstants.sweetsImage,
    ImageConstants.vegetablePizzaImage,
    ImageConstants.blackChocolateImage,
    ImageConstants.cartImage1,
    ImageConstants.cartImage2,
    ImageConstants.cartImage3,
    ImageConstants.cartImage4,
    ImageConstants.filfilImage,
    ImageConstants.meksaratImage,
    ImageConstants.redPizzaImage,
    ImageConstants.spaghettiImage,
    ImageConstants.sweetsImage,
    ImageConstants.vegetablePizzaImage,
    ImageConstants.blackChocolateImage,
    ImageConstants.cartImage1,
    ImageConstants.cartImage2,
    ImageConstants.cartImage3,
    ImageConstants.cartImage4,
    ImageConstants.filfilImage,
    ImageConstants.meksaratImage,
    ImageConstants.redPizzaImage,
    ImageConstants.spaghettiImage,
    ImageConstants.sweetsImage,
    ImageConstants.vegetablePizzaImage
  ];

  int selectedCategoryIndex=0;

  updateSelectedCategoryIndex({required int currentIndex})
  {
    selectedCategoryIndex=currentIndex;
    emit(UpdateSelectedCategoryIndex());
  }


  AllSystemMealsModel? allSystemMealsModel;

  getAllMealsFun()async
  {
    emit(GetAllMealsLoadingState());
    final response=await dashBoardRepoImplementation.getAllSystemMeals();
    response.fold((errorModel) {
      emit(GetAllMealsErrorState(errorModel: errorModel));
    }, (AllSystemMealsModel) {
      emit(GetAllMealsSuccessState(allSystemMealsModel: AllSystemMealsModel));
      allSystemMealsModel=AllSystemMealsModel;
    });

  }

  int currentMealIndex=0;
  int currentChefIndex=0;

  updateSelectedMeal({required int index})
  {
    currentMealIndex=index;
    emit(UpdateMealIndexState());
  }

  updateChefIndex({required int index})
  {
    currentChefIndex=index;
    emit(UpdateChefIndexState());
  }


  AllChefsDataModel? allChefsData;

  getAllSystemChefsFun()async
  {
    emit(GetAllChefsLoadingState());
    final result=await dashBoardRepoImplementation.getAllSystemChefs();
    result.fold((errorModel) {
     emit(GetAllChefsFailureState(errorModel: errorModel));
    },(AllChefsDataModel) {
      emit(GetAllChefsSuccessState(allChefsDataModel: AllChefsDataModel));
      allChefsData=AllChefsDataModel;
    }, );

  }
  getChefRequestDesign()
  {
    emit(PerformChefRequestDesignState());
  }

  TextEditingController chefIdForControllerForChefRequest=TextEditingController();
  TextEditingController statusControllerForChefRequest=TextEditingController();

  GlobalKey<FormState>dealWithChefRequestFormKey=GlobalKey();


  dealWithChefRequestFun({required String chefId, required String status})async
  {
    emit(DealWithChefRequestLoadingState());
    final result=await dashBoardRepoImplementation.dealWithChefRequest(chefId: chefId, status: status);

    result.fold(
        (errorModel)
          {
          emit(DealWithChefRequestFailureState(errorModel: errorModel));
          },
          (message)
          {
            emit(DealWithChefRequestSuccessState(successMessage: message));
          });

  }



  //

  getMealRequestDesign()
  {
    emit(PerformMealRequestDesignState());
  }
  TextEditingController mealIdControllerForMealRequest=TextEditingController();
  TextEditingController mealStatusControllerForMealRequest=TextEditingController();

  GlobalKey<FormState>dealWithMealRequestFormKey=GlobalKey();

  dealWithMealRequestFun({required String mealId, required String status})async
  {
    emit(DealWithMealRequestLoadingState());
    final result=await dashBoardRepoImplementation.dealWithMealRequest(mealId: mealId, status: status);
    result.fold((errorModel) {
      emit(DealWithMealRequestFailureState(errorModel: errorModel));
    }, (message) {
      emit(DealWithMealRequestSuccessState(successMessage: message));
    });
  }

  TextEditingController mealIdDeleteMealController=TextEditingController();

  GlobalKey<FormState>deleteMealFormKey=GlobalKey();

  getDeleteMealDesign()
  {
    emit(GetDeleteMealDesignState());
  }

  deleteMealFun({required String mealId}) async
  {
    emit(DeleteMealLoadingState());
    final result=await dashBoardRepoImplementation.deleteMeal(mealId: mealId);
    result.fold((errorModel) {
      emit(DeleteMealFailureState(errorModel: errorModel));
    }, (message)
    {
      emit(DeleteMealSuccessState(message: message));
    });
  }


  TextEditingController deleteChefIdController=TextEditingController();
  GlobalKey<FormState>deleteChefFormKey=GlobalKey();
  getDeleteChefDesign()
  {
    emit(GetDeleteChefDesignState());
  }

  deleteChefFun({required String chefId}) async
  {
    emit(DeleteChefLoadingState());
    final result=await dashBoardRepoImplementation.deleteChef(chefId: chefId);
    result.fold((errorModel) {
      emit(DeleteChefFailureState(errorModel: errorModel));
    }, (message)
    {
      emit(DeleteChefSuccessState(message: message));
    });
  }

  getLogoutDesign()
  {
    emit(GetLogoutDesignState());
  }
  logoutAdminFun() async
  {
    emit(AdminLogoutLoadingState());
    final result=await dashBoardRepoImplementation.adminLogout();
    result.fold((errorModel) {
      emit(AdminLogoutFailureState(errorModel: errorModel));
    }, (message)
    {
      emit(AdminLogoutSuccessState(message: message));
    });
  }




}
