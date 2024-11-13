*** Settings ***
Documentation    This page maps the web elements and encapsulates the actions on create account page
Library    Browser
Resource    ../../commom/constants.resource

*** Variables ***
${CREATE_ACCOUNT_FIRST_NAME.INPUT}                  css=input[id="firstname"]
${CREATE_ACCOUNT_LAST_NAME.INPUT}                   css=input[id="lastname"]
${CREATE_ACCOUNT_EMAIL.INPUT}                       css=input[id="email_address"]
${CREATE_ACCOUNT_PASSWORD.INPUT}                    css=input[id="password"]
${CREATE_ACCOUNT_PASSWORD_CONFIRMATION.INPUT}       css=input[id="password-confirmation"]
${CREATE_CREATE_AN_ACCOUNT.BUTTON}                  css=button[title="Create an Account"]

*** Keywords ***
Write on the first name field - Create Account
    [Arguments]    ${firstname}
    Wait For Elements State    ${CREATE_ACCOUNT_FIRST_NAME.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CREATE_ACCOUNT_FIRST_NAME.INPUT}    txt=${firstname}

Write on the last name field - Create Account
    [Arguments]    ${lastname}
    Wait For Elements State    ${CREATE_ACCOUNT_LAST_NAME.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CREATE_ACCOUNT_LAST_NAME.INPUT}    txt=${lastname}

Write on the email address field - Create Account
    [Arguments]    ${email}
    Wait For Elements State    ${CREATE_ACCOUNT_EMAIL.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CREATE_ACCOUNT_EMAIL.INPUT}    txt=${email}

Write on the password field - Create Account
    [Arguments]    ${password}
    Wait For Elements State    ${CREATE_ACCOUNT_PASSWORD.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CREATE_ACCOUNT_PASSWORD.INPUT}    txt=${password}

Write on the confirm password field - Create Account
    [Arguments]    ${password}
    Wait For Elements State    ${CREATE_ACCOUNT_PASSWORD_CONFIRMATION.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CREATE_ACCOUNT_PASSWORD_CONFIRMATION.INPUT}    txt=${password}

Click on the "Create an Account" button
    Wait For Elements State    ${CREATE_CREATE_AN_ACCOUNT.BUTTON}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${CREATE_CREATE_AN_ACCOUNT.BUTTON}