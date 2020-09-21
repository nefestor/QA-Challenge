*** Settings ***
Resource                                base.robot

Test Setup                              Nova sessão
Test Teardown                           Encerra sessão

*** Variable ***
${check_mr}                             id_gender1
${check_email}                          id:email_create
${submit_button}                        id:SubmitCreate
${email}                                tiago@tiago.com

*** Test Cases ***
Registro do usuario
    Go To                               ${url}?controller=authentication
    Check if can use email              tiago@tiago.com 
    sleep   2
    Register user

*** Keywords ***
Register user
    [Arguments]
    Input Text  id:customer_firstname   Tiago
    Input Text  id:customer_lastname    Coelho
    Input Text  id:passwd               123456
    #Select From List By Label

Check if can use email
    [Arguments]                         ${email}
    Input Text                          ${check_email}      ${email}
    Click Element                       ${submit_button}