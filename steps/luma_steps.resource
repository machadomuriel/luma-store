*** Settings ***
Documentation    This resource file defines reusable keywords for testing the user journey on the Luma e-commerce site.
Library    Browser
Library    String
Resource   ../resources/components/header.resource
Resource   ../resources/pages/search_results_page.resource
Resource   ../resources/pages/checkout_page.resource
Resource   ../resources/pages/create_account_page.resource
Resource   ../resources/pages/my_account_page.resource
Resource   ../resources/components/data_creation.resource

*** Keywords ***
the user accesses the site
    [Arguments]    ${url}
    Set Browser Timeout    20s
    New Page       url=${url}    wait_until=load

the home page is loaded
    Wait For Load State    state=load    timeout=${ELEMENT_TIMEOUT}

the page title should be
    [Arguments]    ${title}
    Get Title    ==    ${title}

the logo should be visible
    Check if logo is visible

the main menu should be available
    Check if main menu is visible

the search bar should be present
    Check if search bar is visible    

the user type a term in the search bar 
    [Arguments]    ${term}
    Type on search input the term ${term}
    Set Test Variable    ${term}

the user clicks on the last suggested result
    Click on the last suggested result

the user presses "Enter" to perform the search
    Press Enter key on search input

the text "${text}" should be present
    ${i}    Get text    text=${text}
    Should Be True    '${i}' == '${text}'

the product list should contain at least one item
    Check if it's displayed at least one product
    
the button to select the number of items per page should be visible
    Check if the number of items per page component is visible

the sorting option by "Relevance" should be available
    Check if the Sort By component is visible

the product should display an image, title and price
    Check if the product image is visible
    Check is the product title is visible
    Check is the product price is visible

the user hover the mouse over the product card
    Hover the product card

clicks the "Add to cart" button
    Clicks "Add to cart" button

a confirmation message should be displayed
    Check if the add to cart confirmation message is displayed

the cart icon should indicate at least one product added
    Check if there is a product in the cart

the product should be present in the shopping cart
    Check is a specific product is in the shopping cart

the user has a product in the shopping cart
    [Arguments]    ${product}
    Type on search input the term ${product}
    Press Enter key on search input
    Scroll To    vertical=50%
    Hover the product card
    Clicks "Add to cart" button
    Get Text    text=You added ${product} to your shopping cart.

the user clicks the cart icon
    Check if there is a product in the cart
    Click on cart icon

clicks the "Proceed to Checkout" button
    Click on "Proceed to Checkout" button

the "Shipping Address" page should be displayed
    Wait For Condition    Title    ==    Checkout    timeout=${ELEMENT_TIMEOUT}
    Wait For Elements State    text=Shipping Address    visible    timeout=${ELEMENT_TIMEOUT}

the user fills in the required shipping address fields
    ${customer_data}    Generate Customer Data

    Write on the email address field
    ...    email=${customer_data}[email]
    
    Write on the first name field
    ...    firstname=${customer_data}[firstName]

    Write on the last name field
    ...    lastname=${customer_data}[lastName]

    Write on the company field
    ...    company=${customer_data}[company]

    Write on the street field
    ...    street=${customer_data}[street]
    
    Write on the city field
    ...    city=${customer_data}[city]

    Select option on the state/province field
    ...    state=Alabama

    Write on the postal code field
    ...    postalcode=${customer_data}[postalCode]

    Select option on the country field
    ...    country=United States
    
    Write on the phone number field
    ...    phone=${customer_data}[phoneNumber]

selects the shipping method "Table Rate"
    Check shipping checkbox

clicks the "Next" button
    Click on the next button

the payment page should be displayed
    Wait For Elements State    ${CHECKOUT_PAYMENT.LABEL}    visible    timeout=${ELEMENT_TIMEOUT}

confirms that the billing address is the same as the shipping address
    Check "My billing and shipping address are the same" checkbox

clicks the "Place Order" button
    Click on the "Place Order" button

the order confirmation page should be displayed with the message "Thank you for your purchase!"
    Wait For Elements State    text=Thank you for your purchase!    visible    timeout=${ELEMENT_TIMEOUT}
    
the order number should be displayed
    Wait For Elements State    ${CHECKOUT_ORDER_NUMBER.LABEL}    visible    timeout=${ELEMENT_TIMEOUT}

clicks the "Create an Account" link
    Click on the "Create an Account" link

fills in all fields of the form
    ${customer_data}    Generate Customer Data

    Write on the first name field - Create Account
    ...    firstname=${customer_data}[firstName]
    
    Write on the last name field - Create Account
    ...    lastname=${customer_data}[lastName]
    
    Write on the email address field - Create Account
    ...    email=${customer_data}[email]
    
    Write on the password field - Create Account
    ...    password=${customer_data}[password]
    
    Write on the confirm password field - Create Account
    ...    password=${customer_data}[password]

clicks the "Create an Account" button
    Click on the "Create an Account" button
    
the "My Account" page should be displayed
    Get Text    ${MY_ACCOUNT_PAGE_TITLE.INPUT}

a registration thank you message should be presented
    Get Text    text=Thank you for registering with Main Website Store.