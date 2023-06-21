*** Settings ***
Resource    ToDoList_Variables.robot
Library    Selenium2Library

*** Keywords ***
Open To Do List Website
    Selenium2Library.Open Browser    ${URL_ToDoList}    ${Browser}
    Selenium2Library.Page Should Contain     ${Label_Header} 
    Selenium2Library.Page Should Contain     ${Label_TabBar_AddItem}
    Selenium2Library.Page Should Contain     ${Label_TabBar_ToDoTasks}
    Selenium2Library.Page Should Contain     ${Label_TabBar_Completed} 

Verify page contain Tab bar
    Selenium2Library.Click Element    ${Locator_Tabbar}

Verify Add Item Details
    Selenium2Library.Click Element    ${Locator_Button_AddItem}
    Selenium2Library.Page Should Contain Element    ${Textfield_NewTask}
    Selenium2Library.Page Should Contain Element    ${Locator_Button_AddItem_Add}
