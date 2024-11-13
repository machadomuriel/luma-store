*** Settings ***
Documentation    This page maps the web elements and encapsulates the actions on my account page
Library    Browser
Resource    ../../commom/constants.resource

*** Variables ***
${MY_ACCOUNT_PAGE_TITLE.INPUT}                  css=span[data-ui-id="page-title-wrapper"]