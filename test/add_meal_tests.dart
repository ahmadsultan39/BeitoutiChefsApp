// import 'dart:convert';
// import 'dart:io';
//
// import 'package:beitouti_chefs/core/error/exceptions.dart';
// import 'package:beitouti_chefs/core/util/constants.dart';
// import 'package:beitouti_chefs/features/add_meal/data/data_sources/remote/add_meal_remote_data_source_imp.dart';
// import 'package:beitouti_chefs/features/add_meal/domain/use_cases/add_meal.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'add_meal_tests.mocks.dart';
//
// @GenerateMocks([Dio])
// void main() {
//   final MockDio mockDio = MockDio();
//   final imagePath = File("test/assets/image.png").path;
//   final AddMealRemoteDataSourceImp mockAddMealRemoteDataSource =
//       AddMealRemoteDataSourceImp(
//     dio: mockDio,
//   );
//   AddMealUseCaseParams meal = AddMealUseCaseParams(
//     pickedImage: XFile(imagePath, name: "image"),
//     name: "name",
//     categoryId: 1,
//     ingredients: "ingredients",
//     preparingTime: 20,
//     maxMeals: 15,
//     price: 3000,
//   );
//
//   group("add meal tests", () {
//     test(
//       'Should throw Bad Request Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 400)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<BadRequestException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Unauthorized Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 401)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<UnauthorizedException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Forbidden Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 403)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<ForbiddenException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Not Found Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 404)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<NotFoundException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Unprocessable Entity Exception for 422 status code',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 422)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<UnprocessableEntityException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Unprocessable Entity Exception for 412 status code',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 412)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<UnprocessableEntityException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Internal Server Error Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 500)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<InternalServerErrorException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Service Unavailable Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 503)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<ServiceUnavailableException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Unhandled Dio Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenThrow(
//           DioError(
//               requestOptions: RequestOptions(path: Endpoints.addMeal),
//               type: DioErrorType.response,
//               response: Response(
//                   data: json.encode({"errors": "error", "data": ""}),
//                   requestOptions: RequestOptions(
//                     path: Endpoints.addMeal,
//                   ),
//                   statusCode: 505)),
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<ServerException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should throw Server Exception',
//       () async {
//         final FormData formData = await RequestBody.addMeal(params: meal);
//         when(
//           mockDio.post(
//             Endpoints.addMeal,
//             data: isA<FormData>(),
//             options: GetOptions.getOptionsWithToken(""),
//           ),
//         ).thenAnswer((_) async => Response(
//             data: json.encode({"data": ""}),
//             requestOptions: RequestOptions(
//               path: Endpoints.addMeal,
//             ),
//             statusCode: 505));
//
//         final call = mockAddMealRemoteDataSource.addMeal;
//
//         expect(
//           () => call(params: meal, token: ""),
//           throwsA(
//             const TypeMatcher<ServerException>(),
//           ),
//         );
//       },
//     );
//
//     test(
//       'Should complete with no Exceptions',
//           () async {
//             final FormData formData = await RequestBody.addMeal(params: meal);
//             when(
//               mockDio.post(
//                 Endpoints.addMeal,
//                 data: isA<FormData>(),
//                 options: GetOptions.getOptionsWithToken(""),
//               ),
//         ).thenAnswer(
//                 (_) async => Response(
//                 data: json.encode({"data": ""}),
//                 requestOptions: RequestOptions(
//                   path: Endpoints.addMeal,
//                 ),
//                 statusCode: 201)
//         );
//
//         final call = mockAddMealRemoteDataSource.addMeal(params: meal, token: "");
//
//         expect(
//               () => call,
//           equals(
//             const TypeMatcher<void>(),
//           ),
//         );
//       },
//     );
//   });
// }
