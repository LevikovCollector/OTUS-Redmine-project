*** Settings ***
Library  SeleniumLibrary
Resource  robot_utils/robot_keys.robot
Library  robot_utils/data_moduls.py


Test Teardown  Close Browser

*** Test Cases ***
Admin authorization
    Redmine authorization   test_user   qq123456
    After login page location

Admin create new project
    ${new_test_project}=    Generate string
    Redmine authorization   test_user   qq123456
    After login page location
    Create new project  ${new_test_project}
    Open all projects redmine
    Project exiest  ${new_test_project}

Admin edit project
    ${new_test_project}=    Generate string
    ${prj_desc}=    Generate description
    ${new_prj_name}=    Generate string

    Redmine authorization   test_user   qq123456
    After login page location
    Create new project  ${new_test_project}
    Open all projects redmine
    Open project by name    ${new_test_project}
    Choose setting tab
    Edit project name and description  ${new_prj_name}  ${prj_desc}
    Open all projects redmine
    Project exiest  ${new_prj_name}

Admin close project
    ${new_test_project}=    Generate string

    Redmine authorization   test_user   qq123456
    After login page location
    Create new project  ${new_test_project}
    Open all projects redmine
    Open project by name    ${new_test_project}
    Close project
    Open all projects redmine
    Project not visible     ${new_test_project}
    Set chekbox for show close projects
    Project exiest  ${new_test_project}

Admin open close project
    ${new_test_project}=    Generate string

    Redmine authorization   test_user   qq123456
    After login page location
    Create new project  ${new_test_project}
    Open all projects redmine
    Open project by name    ${new_test_project}
    Close project
    Open all projects redmine
    Project not visible     ${new_test_project}
    Set chekbox for show close projects
    Project exiest  ${new_test_project}
    Open project by name    ${new_test_project}
    Open project
    Open all projects redmine
    Project exiest  ${new_test_project}