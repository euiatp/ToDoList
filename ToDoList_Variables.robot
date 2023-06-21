*** Variables ***

### Browser ###
${Browser}    Chrome

### URL ###
${URL_ToDoList}    https://abhigyank.github.io/To-Do-List/ 

### Label ###
${Label_Header}    To-Do List
${Label_TabBar_AddItem}    Add Item
${Label_TabBar_ToDoTasks}    To-Do Tasks
${Label_TabBar_Completed}    Completed

### Locator Label ###
${Locator_Label_Header_ToDoList}    /html/body/div/h1

### Locator Button ###
${Locator_Button_AddItem}    /html/body/div/div/div[1]/a[1]/span
${Locator_Button_ToDoTasks}    /html/body/div/div/div[1]/a[2]/span
${Locator_Button_Completed}    /html/body/div/div/div[1]/a[3]/span
${Locator_Button_AddItem_Add}    //*[@id="add-item"]/button/i

### Locator Tab Bar ###
${Locator_Tabbar}    /html/body/div/div/div[1]

### Locator Text Fields ####
${Textfield_NewTask}    //*[@id="new-task"]
