*** Keywords ***

Verify Header Is Displayed
    Element Should Be Visible    ${TODO_Web_Header} 

Verify Tabs Are Displayed
    Element Should Be Visible    ${TAB_ADD_ITEM} 
    Element Should Be Visible    ${TAB_TODO}
    Element Should Be Visible    ${TAB_COMPLETED} 

Verify Input Field Is Displayed
    Element Should Be Visible    ${TODO_INPUT}
    Element Should Be Enabled    ${TODO_INPUT}

Verify Add Button Is Displayed
    Element Should Be Visible    ${ADD_BUTTON}

Open Browser To Todo Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TODO_Web_Header}     10s

Verify Todo Not In Incomplete List
    [Arguments]    ${todo_text}
    ${locator}=    Get Incomplete Todo Locator    ${todo_text}
    Wait Until Page Does Not Contain Element    ${locator}    5s

Checked Todo Item
    [Arguments]    ${todo_text}
    ${checkbox}=    Get Checkbox Locator    ${todo_text}
    Wait Until Element Is Visible    ${checkbox}    5s
    Click Element    ${checkbox}

Get CSS Value
    [Arguments]    ${locator}    ${attribute_name}
    ${element}=    Get WebElement    ${locator}
    ${css_value}=    Call Method    ${element}    value_of_css_property    ${attribute_name}
    RETURN    ${css_value}

Verify Todo Appears In Completed List
    [Arguments]    ${todo_text}
    ${completed_locator}=    Get Completed Todo Locator    ${todo_text}

    Wait Until Element Is Visible    ${completed_locator}    5s

    Element Should Be Visible
    ...    ${completed_locator}/i[text()='done']

    ${decoration}=    Get CSS Value
    ...    ${completed_locator}
    ...    text-decoration-line

    Should Be Equal    ${decoration}    line-through

Verify Todo Moved To Completed
    [Arguments]    ${todo_text}    ${incomplete_before}    ${completed_before}

    ${incomplete_after}=    Get Todo Count    ${TODO_LIST}
    ${completed_after}=     Get Todo Count    ${COMPLETED_LIST}

    Log    Incomplete: As is ${incomplete_before} , Now ${incomplete_after}
    Log    Completed: As is ${completed_before} , Now ${completed_after}

    Should Be True    ${incomplete_after} == ${incomplete_before} - 1
    Should Be True    ${completed_after}  == ${completed_before} + 1

Verify Todo Count Not Changed
    [Arguments]    ${before}    ${after}
    Should Be Equal    ${before}    ${after}

Add Todo And Verify Increased
    [Arguments]    ${todo_text}

    ${before}=    Get Todo Count    ${TODO_LIST}
    Add Todo Item    ${todo_text}
    ${after}=     Get Todo Count    ${TODO_LIST}

    Verify Todo Count Increased    ${before}    ${after}

Delete Todo And Verify Decreased
    ${before}=    Get Todo Count    ${COMPLETED_LIST}
    Delete Completed Todo Item    ${TODO_TEXT}
    ${after}=     Get Todo Count    ${COMPLETED_LIST}

    Verify Todo Count Decreased    ${before}    ${after}

Add Todo Item
    [Arguments]    ${todo_text}
    Input Text    ${TODO_INPUT}    ${todo_text}
    Click Element    ${ADD_BUTTON}

    ${locator}=    Get Incomplete Todo Locator    ${todo_text}
    Wait Until Page Contains Element    ${locator}    5s

Get Todo Count
    [Arguments]    ${list_locator}
    ${count}=    Get Element Count    ${list_locator}
    RETURN    ${count}

Verify Todo Count Increased
    [Arguments]    ${before}    ${after}
    Should Be True    ${after} == ${before} + 1

Verify Todo Count Decreased
    [Arguments]    ${before}    ${after}
    Should Be True    ${after} == ${before} - 1

Verify Todo In Incomplete List
    [Arguments]    ${todo_text}
    ${todo_locator}=    Get Incomplete Todo Locator    ${todo_text}
    Element Should Be Visible    ${todo_locator}

Delete Completed Todo Item
    [Arguments]    ${todo_text}
    ${delete_btn}=    Replace String    ${DELETE_BUTTON_TMPL}    {}    ${todo_text}
    Wait Until Element Is Visible    ${delete_btn}    5s
    Click Element    ${delete_btn}

Verify Completed Todo Item Is Removed
    Wait Until Page Does Not Contain Element
    ...    ${COMPLETED_LIST}
    ...    5s

Get Incomplete Todo Locator
    [Arguments]    ${todo_text}
    ${locator}=    Replace String    ${INCOMPLETE_TODO_TEXT_TMPL}    {}    ${todo_text}
    RETURN    ${locator}

Get Completed Todo Locator
    [Arguments]    ${todo_text}
    ${locator}=    Replace String    ${COMPLETED_TODO_TEXT_TMPL}    {}    ${todo_text}
    RETURN    ${locator}

Get Checkbox Locator
    [Arguments]    ${todo_text}
    ${locator}=    Replace String    ${CHECKBOX_TMPL}    {}    ${todo_text}
    RETURN    ${locator}

Verify Incomplete Todo Count
    [Arguments]    ${expected}
    ${actual}=    Get Todo Count    ${TODO_LIST}
    Should Be Equal As Integers    ${actual}    ${expected}

Verify Completed Todo Count
    [Arguments]    ${expected}
    ${actual}=    Get Todo Count    ${COMPLETED_LIST}
    Should Be Equal As Integers    ${actual}    ${expected}

Verify Todo Exists By Position
    [Arguments]    ${position}    ${expected_text}
    ${locator}=    Replace String
    ...    ${INCOMPLETE_TEXT_BY_INDEX_TMPL}
    ...    {}
    ...    ${position}
    Element Text Should Be    ${locator}    ${expected_text}

Check Todo By Position
    [Arguments]    ${position}
    ${checkbox}=    Replace String
    ...    ${INCOMPLETE_CHECKBOX_BY_INDEX_TMPL}
    ...    {}
    ...    ${position}
    Click Element    ${checkbox}

Get Incomplete Todo By Index
    [Arguments]    ${index}
    ${locator}=    Replace String
    ...    ${INCOMPLETE_ITEM_BY_INDEX_TMPL}
    ...    {}
    ...    ${index}
    RETURN    ${locator}

Verify Completed Todo Exists
    [Arguments]    ${todo_text}
    ${locator}=    Get Completed Todo Locator    ${todo_text}
    Wait Until Element Is Visible    ${locator}    5s

Clear All Todos
    ${count}=    Get Todo Count    ${TODO_LIST}
    FOR    ${i}    IN RANGE    ${count}
        Click Element    xpath=//*[@id="incomplete-tasks"]/li[1]//input[@type='checkbox']
    END
