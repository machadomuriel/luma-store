*** Settings ***
Documentation    This page maps the web elements and encapsulates the actions on checkout page
Library    Browser
Resource    ../../commom/constants.resource

*** Variables ***
${CHECKOUT_EMAIL.INPUT}                       css=div._with-tooltip > input#customer-email
${CHECKOUT_FIRST_NAME.INPUT}                  css=input[name="firstname"]
${CHECKOUT_LAST_NAME.INPUT}                   css=input[name="lastname"]
${CHECKOUT_LAST_NAME.INPUT}                   css=input[name="company"]
${CHECKOUT_STREET.INPUT}                      css=input[name="street[0]"]
${CHECKOUT_CITY.INPUT}                        css=input[name="city"]
${CHECKOUT_REGION.SELECT}                     css=select[name="region_id"]
${CHECKOUT_POSTCODE.INPUT}                    css=input[name="postcode"]
${CHECKOUT_COUNTRY.SELECT}                    css=select[name=country_id]
${CHECKOUT_TELEPHONE.INPUT}                   css=input[name=telephone]
${CHECKOUT_SHIPPING_METHOD.INPUT}             css=input[name=ko_unique_1]
${CHECKOUT_NEXT.BUTTON}                       css=button[data-role=opc-continue]
${CHECKOUT_PAYMENT.LABEL}                     css=div.payment-group > div[data-role="title"]
${CHECKOUT_CONFIRM_BILLING_ADRRESS.CHECKBOX}  css=input[name="billing-address-same-as-shipping"]
${CHECKOUT_CHECKOUT.BUTTON}                   css=button.checkout
${CHECKOUT_ORDER_NUMBER.LABEL}                css=div.checkout-success > p > span

*** Keywords ***
Write on the email address field
    [Arguments]    ${email}
    Wait For Elements State    ${CHECKOUT_EMAIL.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_EMAIL.INPUT}    ${email}

Write on the first name field
    [Arguments]    ${firstname}
    Wait For Elements State    ${CHECKOUT_FIRST_NAME.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_FIRST_NAME.INPUT}    ${firstname}

Write on the last name field
    [Arguments]    ${lastname}
    Wait For Elements State    ${CHECKOUT_LAST_NAME.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_LAST_NAME.INPUT}    ${lastname}

Write on the company field
    [Arguments]    ${company}
    Wait For Elements State    ${CHECKOUT_LAST_NAME.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_LAST_NAME.INPUT}    ${company}

Write on the street field
    [Arguments]    ${street}
    Wait For Elements State    ${CHECKOUT_STREET.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_STREET.INPUT}    ${street}

Write on the city field
    [Arguments]    ${city}
    Wait For Elements State    ${CHECKOUT_CITY.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_CITY.INPUT}    ${city}

Select option on the state/province field
    [Arguments]    ${state}
    Wait For Elements State    ${CHECKOUT_REGION.SELECT}    visible    timeout=${ELEMENT_TIMEOUT}
    Select Options By    ${CHECKOUT_REGION.SELECT}    text    ${state}

Write on the postal code field
    [Arguments]    ${postalcode}
    Wait For Elements State    ${CHECKOUT_POSTCODE.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_POSTCODE.INPUT}    ${postalcode}

Select option on the country field
    [Arguments]    ${country}
    Wait For Elements State    ${CHECKOUT_COUNTRY.SELECT}    visible    timeout=${ELEMENT_TIMEOUT}
    Select Options By    ${CHECKOUT_COUNTRY.SELECT}    text    ${country}

Write on the phone number field
    [Arguments]    ${phone}
    Wait For Elements State    ${CHECKOUT_TELEPHONE.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Type Text    ${CHECKOUT_TELEPHONE.INPUT}    ${phone}

Check shipping checkbox
    Wait For Elements State    ${CHECKOUT_SHIPPING_METHOD.INPUT}    visible    timeout=${ELEMENT_TIMEOUT}
    Check Checkbox    ${CHECKOUT_SHIPPING_METHOD.INPUT}

Click on the next button
    Wait For Elements State    ${CHECKOUT_NEXT.BUTTON}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${CHECKOUT_NEXT.BUTTON}

Check "My billing and shipping address are the same" checkbox
    Wait For Elements State    ${CHECKOUT_CONFIRM_BILLING_ADRRESS.CHECKBOX}    visible    timeout=${ELEMENT_TIMEOUT}
    Check Checkbox    ${CHECKOUT_CONFIRM_BILLING_ADRRESS.CHECKBOX}

Click on the "Place Order" button
    Wait For Elements State    ${CHECKOUT_CHECKOUT.BUTTON}    visible    timeout=${ELEMENT_TIMEOUT}
    Click    ${CHECKOUT_CHECKOUT.BUTTON}