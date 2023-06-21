*** Settings ***
Library    Selenium2Library
Resource    ToDoList_Keywords.robot

Suite Teardown    Selenium2Library.Close All Browsers

*** Test Cases ***
Testcase 1 - Varify ToDoList Website
    [Tags]    TC1
    Open To Do List Website
    Verify page contain Tab bar
    Verify Add Item Details
