import 'package:bloc/bloc.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:cep_app/repositories/cep_repository_impl.dart';
import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final CepRepository cepRepository = CepRepositoryImp();

  HomeController() : super(HomeInitial());

  Future<void> findCep(String cep) async {
    try {
      emit(HomeLoading());
      final enderecoModel = await cepRepository.getCep(cep);
      emit(HomeLoaded(enderecoModel: enderecoModel));
    } catch (e) {
      emit(HomeFailure());
    }
  }
}
