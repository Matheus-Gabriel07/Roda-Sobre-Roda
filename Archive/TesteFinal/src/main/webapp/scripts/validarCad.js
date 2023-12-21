function validarCadastro() {
    let modelo = frmCVeiculos.modelo.value
    let marca = frmCVeiculos.marca.value
    let ano = frmCVeiculos.ano.value
    let diaria = frmCVeiculos.diaria.value
    let descricao = frmCVeiculos.descricao.value
    let cor = frmCVeiculos.cor.value

    if (modelo === '') {
        frmCVeiculos.modelo.focus()
        alert("Preencha o campo modelo")
        return false
    } else if (marca === '') {
        frmCVeiculos.marca.focus()
        alert("Preencha o campo marca")
        return false
    } else if (ano === '') {
        frmCVeiculos.ano.focus()
        alert("Preencha o campo ano")
        return false
    } else if (diaria === '') {
        frmCVeiculos.diaria.focus()
        alert("Preencha o campo diaria")
        return false
    } else if (descricao === '') {
        frmCVeiculos.descricao.focus()
        alert("Preencha o campo descricao")
        return false
    } else {
        frmCVeiculos.submit()
    }
}