function requiredFormSubmit() {
    let username = frmLogin.username.value;
    let password = frmLogin.password.value;
    let email = frmLogin.email.value;

    if(username === "") {
        alert("Digite o seu username");
        frmLogin.nome.focus();
        return false;
    } else if(password === "") {
        alert("Digite o sua senha");
        frmLogin.password.focus();
        return false;
    } else if(email === "") {
        alert("Digite o sue email");
        frmLogin.email.focus();
        return false;
    } else {
        document.forms["frmLogin"].submit();
    }
}

export default requiredFormSubmit();