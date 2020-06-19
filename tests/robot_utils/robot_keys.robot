*** Settings ***
Library  SeleniumLibrary
Resource  info.robot
Library  data_moduls.py

*** Keywords ***
Get link from element
    [Arguments]  ${locator}
    ${link_href}=   Get Element Attribute  ${locator}    href
     [Return]  ${link_href}

Redmine authorization
    [Arguments]  ${login}  ${password}
    Open browser    ${login_url}     ${browser}
    Maximize Browser Window
    Input Text      ${login_input}     ${login}
    Input Text      ${password_input}  ${password}
    Click Button    ${submit_button}

After login page location
    Location Should Be  ${after_login_url}

Open all projects redmine
    Set Selenium Implicit Wait  5
    Click Link      ${project_link_top}
    Location Should Be  ${projects_page}

Open project by name
    [Arguments]  ${project_name}
    Click Element  xpath://div[@id='projects-index']//a[contains(text(), '${project_name}')]

Create new project
    [Arguments]  ${new_project_name}
    ${prj_desc}=    Generate description

    Open all projects redmine
    Click Link  ${add_new_project}
    Location Should Be  ${new_project_page}
    Input Text      ${project_field_name}   ${new_project_name}
    Textfield Value Should Be   ${indentifikator_field}     ${new_project_name}
    Input Text      ${description_field}    ${prj_desc}
    Element Attribute Value Should Be  ${create_project_button}    value   Создать
    Click Element   ${create_project_button}
    Element Should Be Visible   ${message_after_save}

Edit project name and description
    [Arguments]  ${new_name}    ${new_description}
    Input Text      ${project_field_name}   ${new_name}
    Input Text      ${description_field}    ${new_description}
    Element Attribute Value Should Be  ${save_project_button}    value   Сохранить
    Click Element   ${save_project_button}
    Element Should Be Visible   ${message_after_save}

Project exiest
    [Arguments]  ${project_name}
    Element Should Be Visible   xpath://div[@id='projects-index']//a[contains(text(), '${project_name}')]

Choose setting tab
    Click Element   ${project_setting_tab}

Close project
    Click Link  ${close_project}
    Alert Should Be Present
    Element Should Be Visible   ${message_after_lock_project}

Open project
    Click Link  ${open_project}
    Alert Should Be Present
    Element Should Not Be Visible   ${message_after_lock_project}

Project not visible
    [Arguments]  ${project_name}
    Element Should Not Be Visible   xpath://div[@id='projects-index']//a[contains(text(), '${project_name}')]

Set chekbox for show close projects
    Select Checkbox     ${chekbox_show_close_projects}

Choose task tab
    ${link}=   Get link from element    ${issues_tab}
    Click Element   ${issues_tab}
    Location Should Be  ${link}
    Element Should Be Visible   ${table_with_task}

Open new task form
    ${link}=   Get link from element    ${add_task_link}
    Click element   ${add_task_link}
    Location Should Be  ${link}
    Element Should Be Visible   ${new_task_form}

Open task by subject
    [Arguments]  ${subject_name}
    Click Element  xpath://div[@class='autoscroll']//a[contains(text(), '${subject_name}')]

Open first task
    ${link}=   Get link from element    ${first_task}
    Click Element   ${first_task}
    Location Should Be  ${link}

Copy task
    ${card_subject_text}=   Get Text    ${subject_card}
    ${card_desc_text}=  Get Text     ${desc_card}
    ${assigned_desc_text}=  Get Text    ${assigned_card}

    Click element       ${copy_task_link}

    Check value in field    ${subject_field}    ${card_subject_text}
    Check value in field    ${task_description_field}    ${card_desc_text}
    List Selection Should Be    ${assigned_select}    ${assigned_desc_text}

    Click element   ${save_task_button}

    ${card_subject_text_copy}=   Get Text    ${subject_card}
    ${card_desc_text_copy}=  Get Text     ${desc_card}
    ${assigned_desc_text_copy}=  Get Text    ${assigned_card}

    Should Be Equal  ${card_subject_text_copy}    ${card_subject_text}
    Should Be Equal  ${card_desc_text}    ${card_desc_text_copy}
    Should Be Equal  ${assigned_desc_text}    ${assigned_desc_text_copy}
    Element Should Be Visible      ${additional_task}

Check value in field
    [Arguments]  ${locator}  ${value}
    ${field_value}=     Get Value   ${locator}
    Should Be Equal     ${field_value}  ${value}

Task delete sucess
    [Arguments]  ${subject_name}
    Element Should Not Be Visible  xpath://div[@class='autoscroll']//a[contains(text(), '${subject_name}')]

Get all history by task
    ${history_text}=    Get text    ${history_block}
    [Return]  ${history_text}

History block exist
    Element Should Be Visible   ${history_block}

Fill and save new task with preview
    [Arguments]     ${task_sub}     ${task_desc}

    Input Text  ${subject_field}    ${task_sub}
    Input Text  ${task_description_field}   ${task_desc}
    Select From List By Label  ${assigned_select}  Михаил Достоевский
    Click link  ${preview_link}
    Wait Until Element Is Visible   ${preview_block}
    ${preview_text}=    Get Text    ${preview_desc}
    Should Be Equal  ${preview_text}    ${task_desc}
    Click element   ${save_task_button}
    Wait Until Element Is Visible   ${message_creat_task}
    ${current_url}=     Get Location
    Log    ${current_url}

    ${card_subject_text}=   Get Text    ${subject_card}
    ${card_desc_text}=  Get Text     ${desc_card}
    ${assigned_desc_text}=  Get Text    ${assigned_card}

    Should Be Equal  ${card_desc_text}    ${task_desc}
    Should Be Equal  ${card_subject_text}    ${task_sub}
    Should Be Equal  ${assigned_desc_text}    Михаил Достоевский

Open task for edit
    Click Element   ${edit_task_link}
    Click Element   ${open_edit_field}
    Wait Until Element Is Visible   ${task_description_field}

Delete task
    Click Element   ${delete_task_link}
    Alert Should Be Present
    Wait Until Element Is Visible   ${table_with_task}

