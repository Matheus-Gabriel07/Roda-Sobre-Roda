/*  JS - Validação campos para entrada
    UTA: 07/12/23
    @author Matheus Gabriel
*/
 
function validaCadastro() {
    let user = frmCad.user.value
    let email = frmCad.email.value
    let password = frmCad.password.value
 
    if (user.trim() === "") {
        alert("Digite o nome de usuário")
        frmCad.user.focus()
        return false
    } else if (email.trim() === "") {
        alert("Digite o email")
        frmCad.email.focus()
        return false
    } else if (password.trim() === "") {
        alert("Digite uma senha")
        frmCad.password.focus()
        return false
    } else if(password.trim() != "" && user.trim() != "" && email.trim() != "") {
        document.forms["frmCad"].submit()
    } else {
        return false
    }
}
 
function validaLogin() {
    let user = frmLog.user.value;
    let password = frmLog.password.value;
 
    if (user.trim() === "") {
        alert("Digite o nome de usuário")
        frmLog.user.focus()
        return false
    } else if (password.trim() === "") {
        alert("Digite uma senha")
        frmLog.password.focus()
        return false
    } else if(password.trim() != "" && user.trim() != ""){
        document.forms["frmLog"].submit()
    } else {
        return false
    }
}