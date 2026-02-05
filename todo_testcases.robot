*** Settings ***
Library    SeleniumLibrary
Library    String

Resource    todo_variables.robot
Resource    todo_keywords.robot

Suite Setup     Open Browser To Todo Page
Suite Teardown  Close Browser


*** Test Cases ***
TC_001_Verify_Todo_List_Main_Page_UI
    [Documentation]    Verify header, tabs, input field and add button are displayed
    Verify Header Is Displayed
    Verify Tabs Are Displayed
    Verify Input Field Is Displayed
    Verify Add Button Is Displayed

TC_002_Add_Item_Without_Text_Should_Not_Create_List
    [Documentation]    Click Add without input, no todo item should be created
    ${before}=    Get Todo Count    ${TODO_LIST}
    Click Element    ${ADD_BUTTON}
    ${after}=     Get Todo Count    ${TODO_LIST}

    Verify Todo Count Not Changed    ${before}    ${after}
    

TC_003_Add_Item_With_Text_Should_Create_Todo_List
    [Documentation]    Add new to do, and verify is it add to incomplete
    Add Todo And Verify Increased    ${TODO_TEXT}
    Verify Todo In Incomplete List    ${TODO_TEXT}



TC_004_Checked_Todo_Item_Should_Move_To_Completed_List
    [Documentation]    Checked to do item, and verify if it moved from incomplete to complete 
    ${to_do_before}=    Get Todo Count    ${TODO_LIST}
    ${completed_before}=   Get Todo Count    ${COMPLETED_LIST}

    Checked Todo Item    ${TODO_TEXT}

    Verify Todo Moved To Completed    ${TODO_TEXT}    ${to_do_before}    ${completed_before}
    Verify Todo Not In Incomplete List    ${TODO_TEXT}
    Verify Todo Appears In Completed List    ${TODO_TEXT}


TC_005_Add_New_Todo_List
    [Documentation]    Add new to do, and verify is it add to incomplete
    Add Todo And Verify Increased    ${TODO_TEXT_2}
    Verify Todo In Incomplete List    ${TODO_TEXT_2}

TC_006_Delete_Completed_Todo_Item
    [Documentation]    Delete completed to do item
    Delete Todo And Verify Decreased

TC_007_Verify_Todo_By_Index
    [Documentation]    Verify item by index
    Add Todo Item    First
    Add Todo Item    Second
    Add Todo Item    Third

    ${item}=    Get Incomplete Todo By Index    2
    Element Should Be Visible    ${item}

TC_008_Multiple_Todo_Should_Not_Conflict_By_Index
    [Documentation]    Verify multiple to do item by index
    Clear All Todos
    Verify Incomplete Todo Count    0

    Add Todo Item    Todo 1
    Add Todo Item    Todo 2
    Add Todo Item    Todo 3

    Verify Todo Exists By Position    1    Todo 1
    Verify Todo Exists By Position    2    Todo 2
    Verify Todo Exists By Position    3    Todo 3

    Check Todo By Position    2

    Verify Todo Exists By Position    1    Todo 1
    Verify Todo Exists By Position    2    Todo 3
    Verify Completed Todo Exists      Todo 2



