*** Settings ***
Documentation    Test suite for the Luma Store e-commerce
Library     Browser
Resource    ../hooks/HOOKS.resource
Resource    ../steps/luma_steps.resource
Resource    ../commom/constants.resource
Suite Setup    Start web session    ${BROWSER}    ${HEADLESS}
Suite Teardown    Close web session

*** Test Cases ***
TC1 - Check if the home page is loading correctly
  [Tags]     web    homepage
  [Setup]    Start test case
  Given the user accesses the site
  ...    url=https://magento.softwaretestingboard.com/
  When the home page is loaded
  Then the page title should be
  ...    title=Home Page
  And the logo should be visible
  And the main menu should be available
  And the search bar should be present
  [Teardown]    End test case

TC2 - Perform search for "shirt" and validate the loading of the results page
  [Tags]     web    search
  [Setup]    Start test case
  Given the user accesses the site
  ...    url=https://magento.softwaretestingboard.com/
  And the user type a term in the search bar 
  ...    term=shirt
  When the user clicks on the last suggested result
  And the text "Related search terms" should be present
  And the product list should contain at least one item
  And the button to select the number of items per page should be visible
  And the sorting option by "Relevance" should be available
  And the product should display an image, title and price
  [Teardown]    End test case

CT3 - Add a product to the shopping cart
  [Tags]     web    shoppingcart
  [Setup]    Start test case
  Given the user accesses the site
  ...    url=https://magento.softwaretestingboard.com/
  And the user type a term in the search bar 
  ...    term=Driven Backpack
  And the user presses "Enter" to perform the search
  And the user hover the mouse over the product card
  And clicks the "Add to cart" button   
  Then a confirmation message should be displayed  
  And the cart icon should indicate at least one product added
  And the product should be present in the shopping cart
  [Teardown]    End test case

CT4 - Complete the checkout process 
  [Tags]     web    checkout    smoke
  [Setup]    Start test case
  Given the user accesses the site
  ...    url=https://magento.softwaretestingboard.com/
  And the user has a product in the shopping cart
  ...    product=Driven Backpack
  When the user clicks the cart icon
  And clicks the "Proceed to Checkout" button
  Then the "Shipping Address" page should be displayed
  When the user fills in the required shipping address fields
  And selects the shipping method "Table Rate"
  And clicks the "Next" button
  Then the payment page should be displayed
  When confirms that the billing address is the same as the shipping address
  And clicks the "Place Order" button
  Then the order confirmation page should be displayed with the message "Thank you for your purchase!"
  And the order number should be displayed
  [Teardown]    End test case

CT5 - Create an account
  [Tags]     web    account    smoke
  [Setup]    Start test case
  Given the user accesses the site
  ...    url=https://magento.softwaretestingboard.com/
  And clicks the "Create an Account" link
  When fills in all fields of the form
  And clicks the "Create an Account" button
  Then the "My Account" page should be displayed
  And a registration thank you message should be presented
  [Teardown]    End test case
