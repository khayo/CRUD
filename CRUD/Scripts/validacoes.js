var ValidaExclusao = function (id, evento) {
    if (confirm("Confirmar exclusão do filme?")) {
        return true;
    } else {
        evento.preventDefault();
        return false;
    }
}