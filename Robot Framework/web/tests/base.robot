*** Settings ***
Library                                 SeleniumLibrary

*** Variable ***
${url}                                  http://automationpractice.com/index.php

*** Keywords ***
Nova sessão    
    Open Browser                        ${url}  chrome

Encerra sessão
    Capture Page Screenshot
    Close Browser