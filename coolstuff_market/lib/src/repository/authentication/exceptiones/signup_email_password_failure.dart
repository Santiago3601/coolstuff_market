class SignUpWithEmailAndPasswordFailure {
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message ="Se ha presentado un error desconocido. 🫤"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':return const SignUpWithEmailAndPasswordFailure('Por favor ingrese una cotraseña mas fuerte.');
      case 'invalid-email':return const SignUpWithEmailAndPasswordFailure('Email no valido.');
      case 'email-already-in-use':return const SignUpWithEmailAndPasswordFailure('Ya existe una cuenta asociada a este correo.');
      case 'operation-not-allowed':return const SignUpWithEmailAndPasswordFailure('Operación no permitida.');
      case 'user-disabled':return const SignUpWithEmailAndPasswordFailure('El usuario ha sido deshabilitado, por favor contacte a soporte.');
      default:return SignUpWithEmailAndPasswordFailure('');
    }
  }

}
