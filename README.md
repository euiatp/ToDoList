# ToDoList
(2. Automate Testing Scripts เพื่อทดสอบ Todo List website ที่ Url: https://abhigyank.github.io/To-Do-List/)

Robot Framework – To Do List Automation Test Suite
This project is an automated UI test suite for the To Do List web application:
https://abhigyank.github.io/To-Do-List/
It is written in Robot Framework using SeleniumLibrary and follows good QA automation practices such as reusable keywords, dynamic locators, and clean test isolation.

## Objectives
- Verify core UI elements of the To Do List application
- Validate functional behavior of To Do items
- Prevent regression related to index-based IDs (1,2,3…)
- Ensure selecting one item does not affect other items
- Demonstrate professional Robot Framework test design

## Tech Stack
- Robot Framework
- Selenium Library
- String Library
- Chrome Browser

## Project Structure
-	todo_testcases.robot  #Main test suite
-	todo_variables.robot  #Variables + Locators
-	todo_keywords.robot  #Reusable Keywords (Business / Action / Assertion)
-	README.md  #Project documentation

## Prerequisites
Before running the tests, make sure you have:
1.	Python 3.x installed
2.	Robot Framework
3.	SeleniumLibrary
4.	Chrome browser
5.	ChromeDriver compatible with your Chrome version

## Install dependencies
- pip install robotframework
- pip install robotframework-seleniumlibrary

## How to Run the Tests
- Run the entire test suite: robot todo_tests.robot
- Run with report output: robot -d reports todo_tests.robot

## Test Cases Overview
### TC_001_Verify_Todo_List_Main_Page_UI
- Verify page header
- Verify tabs (Add Item / To Do / Completed)
- Verify input field and Add button
  
### TC_002_Add_Item_Without_Text_Should_Not_Create_List
- Click Add with empty input
- Verify To Do count does not change

### TC_003_Add_Item_With_Text_Should_Create_Todo_List
- Add a new To Do item
- Verify item appears in Incomplete list
### TC_004_Checked_Todo_Item_Should_Move_To_Completed_List
- Check a To Do item
- Verify:
    - Incomplete count decreases
    - Completed count increases
    - Item is removed from Incomplete list
    - Item appears in Completed list
    - Text has line-through CSS decoration

### TC_005_Add_New_Todo_List
- Add another To Do item
- Verify item exists in Incomplete list

### TC_006_Delete_Completed_Todo_Item
- Delete a completed To Do item
- Verify completed count decreases

### TC_007_Verify_Todo_By_Index
- Add multiple To Do items
- Verify item visibility by list index

### TC_008_Multiple_Todo_Should_Not_Conflict_By_Index 
- Add 3 items (Todo 1, Todo 2, Todo 3)
- Verify each item exists at its expected index
- Check only item at position 2
- Verify:
    - Item 2 moves to Completed list
    - Item 1 and Item 3 remain unchanged



