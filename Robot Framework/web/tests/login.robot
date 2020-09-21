*** Settings ***
Resource            base.robot

Test Setup          Nova sessão
Test Teardown       Encerra sessão

*** Variable ***
${input_email}      id:email
${input_password}   id:passwd
${login_button}     id:SubmitLogin
${login_info}       class:info-account

*** Test Cases ***

Login com sucesso
    Go To           ${url}?controller=authentication
    Login With      teste@teste1.com  12345
    Click Element   ${login_button}
    Should See Info Account

*** Keywords ***
Login With
    [Arguments]     ${email}            ${pass}
    Input Text      ${input_email}      ${email}
    Input Text      ${input_password}   ${pass}

Should See Info Account
    Page Should Contain Element         ${login_info}