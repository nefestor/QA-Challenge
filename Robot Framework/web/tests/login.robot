*** Settings ***
Resource                                base.robot

Test Setup                              Nova sessão
Test Teardown                           Encerra sessão

*** Variable ***
${input_email}                          id:email
${input_password}                       id:passwd
${login_button}                         id:SubmitLogin
${login_info}                           class:info-account

*** Test Cases ***
Login sem email
    Go To                               ${url}?controller=authentication
    Login With                          \                   12345
    Should Contain Login Alert Message  An email address required.

Login sem senha
    Go To                               ${url}?controller=authentication
    Login With                          teste@teste1.com    \
    Should Contain Login Alert Message  Password is required.

Login sem email e senha
    Go To                               ${url}?controller=authentication
    Login With                          \                   \     
    Should Contain Login Alert Message  An email address required.

Login com email inválido
    Go To                               ${url}?controller=authentication
    Login With                          teste.com           12345
    Should Contain Login Alert Message  Invalid email address.

Login com senha inválida
    Go To                               ${url}?controller=authentication
    Login With                          teste@teste1.com    123456
    Should Contain Login Alert Message  Authentication failed.

Login com sucesso
    Go To                               ${url}?controller=authentication
    Login With                          teste@teste1.com    12345
    Should See Info Account
    
*** Keywords ***
Login With
    [Arguments]                         ${email}            ${pass}
    Input Text                          ${input_email}      ${email}
    Input Text                          ${input_password}   ${pass}
    Click Element                       ${login_button}

Should See Info Account
    Page Should Contain Element         ${login_info}

Should Contain Login Alert Message
    [Arguments]                         ${expect_message}

    ${message}=                         Get WebElement      class:alert-danger
    Should Contain                      ${message.text}     ${expect_message}