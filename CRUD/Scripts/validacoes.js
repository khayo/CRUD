var ValidaExclusao = function (id, evento) {
    if (confirm("Confirmar exclusão?")) {
        return true;
    } else {
        evento.preventDefault();
        return false;
    }
}