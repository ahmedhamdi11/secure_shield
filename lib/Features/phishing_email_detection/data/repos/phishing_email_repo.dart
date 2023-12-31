import 'package:app/core/models/prediction_model.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class EmailDetectionRepo {
  Future<Either<Failure, PredictionModel>> checkEmail({required String email});
}
