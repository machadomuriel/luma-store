*** Settings ***
Documentation    This page maps the web elements and encapsulates the actions on search results page
Library    Browser
Resource    ../../commom/constants.resource

*** Variables ***
${SEARCH_PRODUCT_ITEMS}               css=ol.product-items li.item
${SEARCH_PRODUCTS_PER_PAGE.SELECTOR}  xpath=(//select[@id="limiter"])[2]
${SEARCH_SORT_PRODUCTS_BY.SELECTOR}   xpath=(//select[@id="sorter"])[1]
${SEARCH_PRODUCT.IMG}                 xpath=(//img[@class="product-image-photo"])[1]
${SEARCH_PRODUCT.TITLE}               xpath=(//a[@class="product-item-link"])[1]
${SEARCH_PRODUCT.LABEL}               xpath=(//span[@class="price"])[1]
${SEARCH_PRODUCT_NAME.LABEL}          css=ol.products.list.items.product-items > li:first-of-type strong.product-item-name > a
${SEARCH_PRODUCT.CARD}                xpath=(//div[@data-container="product-grid"])[1]
${SEARCH_PRODUCT.BUTTON}              xpath=(//button[@title="Add to Cart"])[1]
${SEARCH_ADD_TO_CART_MESSAGE.LABEL}   css=div[data-ui-id="message-success"]

*** Keywords ***
Check if it's displayed at least one product
    ${count}=    Get Element Count    ${SEARCH_PRODUCT_ITEMS}
    Should Be True    ${count} > 0

Check if the number of items per page component is visible
    Wait For Elements State    ${SEARCH_PRODUCTS_PER_PAGE.SELECTOR}    visible    timeout=${ELEMENT_TIMEOUT}

Check if the Sort By component is visible
    Wait For Elements State    ${SEARCH_SORT_PRODUCTS_BY.SELECTOR}    visible    timeout=${ELEMENT_TIMEOUT}

Check if the product image is visible
    Wait For Elements State    ${SEARCH_PRODUCT.IMG}    visible    timeout=${ELEMENT_TIMEOUT}

Check is the product title is visible
    Wait For Elements State    ${SEARCH_PRODUCT.TITLE}    visible    timeout=${ELEMENT_TIMEOUT}

Check is the product price is visible
    Wait For Elements State    ${SEARCH_PRODUCT.LABEL}    visible    timeout=${ELEMENT_TIMEOUT}

Hover the product card
    Scroll To    vertical=50%
    Hover    ${SEARCH_PRODUCT.CARD}
    ${product_name}    Get Text    ${SEARCH_PRODUCT_NAME.LABEL}
    Set Test Variable    ${product_name}

Clicks "Add to cart" button
    Wait For Elements State    ${SEARCH_PRODUCT.BUTTON}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${SEARCH_PRODUCT.BUTTON}

Check if the add to cart confirmation message is displayed
    Wait For Elements State    ${SEARCH_ADD_TO_CART_MESSAGE.LABEL}    visible    timeout=${ELEMENT_TIMEOUT}
    Get Text    text=You added ${term} to your shopping cart.