*** Settings ***
Documentation    This page has keywords that are able to create data
Library    FakerLibrary
Resource    ../../commom/constants.resource

*** Keywords ***
Generate Customer Data
    ${email}        FakerLibrary.Email
    ${firstName}    FakerLibrary.First Name
    ${lastName}     FakerLibrary.Last Name
    ${company}      FakerLibrary.Company
    ${street}       FakerLibrary.Street Address
    ${city}         FakerLibrary.City
    ${postalCode}   FakerLibrary.Postalcode
    ${phoneNumber}  FakerLibrary.Phone Number
    ${password}     FakerLibrary.Password    length=8    special_chars=True    digits=True    upper_case=True    lower_case=True
    &{customer_data}    Create Dictionary
    ...    email=${email}
    ...    firstName=${firstName}
    ...    lastName=${lastName}
    ...    company=${company}
    ...    street=${street}
    ...    city=${city}
    ...    postalCode=${postalCode}
    ...    phoneNumber=${phoneNumber}
    ...    password=${password}
    RETURN    ${customer_data}