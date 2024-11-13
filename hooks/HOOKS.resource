*** Settings ***
Documentation    File responsible for global configuration, setup, and teardown of tests and suites.
Library        Browser
Resource       ../commom/constants.resource

*** Keywords ***
Start web session
    [Arguments]     ${BROWSER}      ${HEADLESS}
    Log    Running tests in the browser: ${BROWSER}
    New Browser    browser=${BROWSER}    headless=${HEADLESS}

Close web session
    Close Browser

Start test case
    New Context    viewport={'width': 1366, 'height': 768}

End test case
    Take Screenshot
    Close Page