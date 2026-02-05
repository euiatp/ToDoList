*** Variables ***
${URL}      https://abhigyank.github.io/To-Do-List/
${BROWSER}  chrome

${TODO_WEB_HEADER}    xpath=//h1[text()='To Do List']
${TODO_INPUT}   id=new-task
${ADD_BUTTON}   xpath=//i[text()='add']

${TODO_LIST}    xpath=//*[@id="incomplete-tasks"]/li
${COMPLETED_LIST}    xpath=//*[@id="completed-tasks"]/li

${TAB_ADD_ITEM}    xpath=//a[@href='#add-item' and contains(@class,'mdl-tabs__tab')]
${TAB_TODO}    xpath=//a[@href='#todo' and contains(@class,'mdl-tabs__tab')]
${TAB_COMPLETED}    xpath=//a[@href='#completed' and contains(@class,'mdl-tabs__tab')]

${INCOMPLETE_TODO_TEXT_TMPL}    xpath=//*[@id="incomplete-tasks"]//span[text()='{}']
${COMPLETED_TODO_TEXT_TMPL}     xpath=//*[@id="completed-tasks"]//span[contains(.,'{}')]
${CHECKBOX_TMPL}    xpath=//*[@id="incomplete-tasks"]//span[text()='{}']/preceding-sibling::input[@type='checkbox']
${DELETE_BUTTON_TMPL}    xpath=//*[@id="completed-tasks"]//span[contains(.,'{}')]/following-sibling::button
${INCOMPLETE_ITEM_BY_INDEX_TMPL}      xpath=//*[@id="incomplete-tasks"]/li[{}]
${INCOMPLETE_TEXT_BY_INDEX_TMPL}      xpath=//*[@id="incomplete-tasks"]/li[{}]//span
${INCOMPLETE_CHECKBOX_BY_INDEX_TMPL}  xpath=//*[@id="incomplete-tasks"]/li[{}]//input[@type='checkbox']


${TODO_TEXT}    Hello
${TODO_TEXT_2}    Breakfast