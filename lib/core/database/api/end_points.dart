
import 'dart:convert';

class EndPoints
{

  static const String baseUrl="https://food-api-omega.vercel.app/api/v1";


  static const String adminLoginEndPoint="$baseUrl/admin/signin";

  static const String adminLogoutEndPoint="$baseUrl/admin/logout";

  static const String getAllMealsEndPoint='$baseUrl/admin/get-meals?status=all';

  static const String getAllSystemChefsEndPoint='$baseUrl/admin/get-chefs?status=all';

  static  String dealWithChefRequestEndPoint({required String chefId,required String status})
  {

    return '$baseUrl/admin/deal-with-chef-request/$chefId?status=$status';
  }

  static  String dealWithMealRequestEndPoint({required String mealId,required String status})
  {

    return '$baseUrl/admin/deal-with-meal-request/$mealId?status=$status';
  }

  static String deleteMealEndPoint({required String mealId})
  {
    return '$baseUrl/meal/delete-meal/$mealId';
  }

  static String deleteChefEndPoint({required String chefId})
  {
    return '$baseUrl/chef/delete?id=$chefId';
  }

}
