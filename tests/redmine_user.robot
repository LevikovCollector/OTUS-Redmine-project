*** Settings ***
Library  SeleniumLibrary
Resource  robot_utils/robot_keys.robot
Library  robot_utils/data_moduls.py

Test Teardown  Close Browser

*** Test Cases ***
User authorization
    Redmine authorization   user   qq123456
    After login page location

User add new task
    ${subject_task}=    Generate string
    ${desc_task}=    Generate description

    Redmine authorization   user   qq123456
    After login page location
    Open all projects redmine
    Open project by name  TEST_Project
    Choose task tab
    Open new task form
    Fill and save new task with preview     ${subject_task}  ${desc_task}

User edit task
    ${subject_task}=    Generate string
    ${desc_task}=    Generate description
    ${new_subject_task}=    Generate string
    ${new_desc_task}=   Generate description

    Redmine authorization   user   qq123456
    After login page location
    Open all projects redmine
    Open project by name  TEST_Project
    Choose task tab
    Open new task form
    Fill and save new task with preview     ${subject_task}  ${desc_task}
    ${url_task_before_edit}=    Get Location
    Choose task tab
    Open task by subject    ${subject_task}
    Open task for edit
    Fill and save new task with preview     ${new_subject_task}  ${new_desc_task}
    ${url_task_after_edit}=    Get Location
    ${check_url}=   Check contain url   ${url_task_after_edit}  ${url_task_before_edit}
    Log     ${check_url}
    History block exist
    ${history_text}=    Get all history by task
    Log     ${history_text}

User delete task
    ${subject_task}=    Generate string
    ${desc_task}=    Generate description

    Redmine authorization   user   qq123456
    After login page location
    Open all projects redmine
    Open project by name  TEST_Project
    Choose task tab
    Open new task form
    Fill and save new task with preview     ${subject_task}  ${desc_task}
    Choose task tab
    Open task by subject    ${subject_task}
    Delete task
    Task delete sucess  ${subject_task}

User copy task
    Redmine authorization   user   qq123456
    After login page location
    Open all projects redmine
    Open project by name  TEST_Project
    Choose task tab
    Open first task
    Copy task