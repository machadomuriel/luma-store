*** Settings ***
Documentation    This file maps the header elements and encapsulates its actions
Library    Browser
Resource    ../../commom/constants.resource

*** Variables ***
${HEADER_LOGO.IMAGE}                   css=a.logo > img
${HEADER_MAIN_MENU.DIV}                css=div[id="store.menu"]
${HEADER_SEARCH.INPUT}                 css=input#search
${HEADER_LAST_SUGGESTED_RESULT.LABEL}  css=div#search_autocomplete > ul > li:last-child
${HEADER_CART_COUNTER_NUMBER.VALUE}    css=span.counter-number
${HEADER_CART_COUNTER_NUMBER.ICON}     css=a.showcart
${HEADER_CART_PRODUCT.LABEL}           css=div.product > div.product-item-details > strong.product-item-name > a
${HEADER_CART_GO_TO_CHECKOUT.BUTTON}   css=button#top-cart-btn-checkout
${HEADER_CREATE_AN_ACCOUNT.LINK}       xpath=(//div[@class="panel header"]//a)[4]

*** Keywords ***
Check if logo is visible
    Wait For Elements State    ${HEADER_LOGO.IMAGE}    state=visible    timeout=${ELEMENT_TIMEOUT}

Check if main menu is visible
    Wait For Elements State    ${HEADER_MAIN_MENU.DIV}    state=visible    timeout=${ELEMENT_TIMEOUT}

Check if search bar is visible
    Wait For Elements State    ${HEADER_SEARCH.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}

Type on search input the term ${term}
    Wait For Elements State    ${HEADER_SEARCH.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    selector=${HEADER_SEARCH.INPUT}    txt=${term}

Press Enter key on search input
    Wait For Elements State    ${HEADER_SEARCH.INPUT}    state=visible    timeout=${ELEMENT_TIMEOUT}
    Keyboard Key    action=press    key=Enter

Click on the last suggested result
    Wait For Elements State    ${HEADER_LAST_SUGGESTED_RESULT.LABEL}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${HEADER_LAST_SUGGESTED_RESULT.LABEL}

Check if there is a product in the cart
    ${value}=    Get Text    ${HEADER_CART_COUNTER_NUMBER.VALUE}
    ${value}=    Convert To Integer    ${value}
    Should Be True    ${value} > 0

Check is a specific product is in the shopping cart
    Click    ${HEADER_CART_COUNTER_NUMBER.ICON}
    ${text}=    Get Text    ${HEADER_CART_PRODUCT.LABEL}
    Should Be Equal    ${text}    ${product_name}

Click on cart icon
    Click    ${HEADER_CART_COUNTER_NUMBER.ICON}

Click on "Proceed to Checkout" button
    Wait For Elements State    ${HEADER_CART_GO_TO_CHECKOUT.BUTTON}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${HEADER_CART_GO_TO_CHECKOUT.BUTTON}

Click on the "Create an Account" link
    Wait For Elements State    ${HEADER_CREATE_AN_ACCOUNT.LINK}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${HEADER_CREATE_AN_ACCOUNT.LINK}