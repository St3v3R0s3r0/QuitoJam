enum TipoUsuario { admin, cliente, invitado }

class MockUserSession {
  static TipoUsuario tipoUsuarioActual = TipoUsuario.cliente;
}
