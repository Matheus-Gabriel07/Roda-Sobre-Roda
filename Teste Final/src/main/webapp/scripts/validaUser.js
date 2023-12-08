/*  JS - Validação campos para entrada 
    UTA: 07/12/23
    @author Matheus Gabriel
*/

function validaCadastro() {
	let user = frmCad.user.value
	let email = frmCad.email.value
	let password = frmCad.password.value

	if (user.trim() === "") {
		frmCad.user.focus()
		alert("Digite o nome de usuário")
		return false
	} else if (email.trim() === "") {
		frmCad.email.focus()
		alert("Digite o email")
		return false
	} else if (password.trim() === "") {
		frmCad.password.focus()
		alert("Digite uma senha")
		return false
	}

	return true
}

function validaLogin() {
	let user = frmLog.user.value;
	let password = frmLog.password.value;

	if (user.trim() === "") {
		frmLog.user.focus()
		alert("Digite o nome de usuário")
		return false
	} else if (password.trim() === "") {
		alert("Digite uma senha")
		frmLog.password.focus()
		return false
	}
	return true
}