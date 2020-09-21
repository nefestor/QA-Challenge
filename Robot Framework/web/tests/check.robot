*** Settings ***
Resource                                base.robot

Test Setup                              Nova sessão
Test Teardown                           Encerra sessão

*** Variable ***
${check_email}                          id:email_create
${submit_button}                        id:SubmitCreate
${email}                                tiago@tiago.com

*** Test Cases ***
Verificar se pode utilizar email
    Go To                               ${url}?controller=authentication
    Check if can use email              ${email}
    Page Should Contain                 Create an account

*** Keywords ***
Check if can use email
    [Arguments]                         ${email}
    Input Text                          ${check_email}      ${email}
    Click Element                       ${submit_button}