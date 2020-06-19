*** Variables ***
${default_url}      http://localhost/
${login_url}        http://localhost/login
${after_login_url}  http://localhost/my/page
${new_project_page}     http://localhost/projects/new
${browser}          Chrome
${projects_page}    http://localhost/projects
# Локаторы для авторизации
${login_input}      css:input#username
${password_input}   css:input#password
${submit_button}    css:input#login-submit
# Локаторы для проекта
${project_link_top}     css:#top-menu a.projects
${add_new_project}      css:#content div.contextual a
${project_setting_tab}  css:#main-menu a.settings
${create_project_button}    css:#new_project input[name='commit']
${save_project_button}   css:form.edit_project input[name='commit']
${form_create_new_project}      css:form#new_project
${project_field_name}     css:form #project_name
${indentifikator_field}   css:form #project_identifier
${description_field}      css:form #project_description
${close_project}      css:#content a.icon-lock
${open_project}       css:#content a.icon.icon-unlock
${message_after_save}   css:#content #flash_notice
${message_after_lock_project}   css:#content p.warning>span
${chekbox_show_close_projects}  css:form #closed
# Локаторы для задач
${issues_tab}       css:#main-menu a.issues
${table_with_task}  css:form div.autoscroll>table
${add_task_link}    css:#main div.contextual>a.icon-add
${new_task_form}    css:#issue-form
${subject_field}    css:#issue-form #issue_subject
${task_description_field}   css:#issue-form #issue_description
${assigned_select}     css:#issue-form #issue_assigned_to_id
${save_task_button}    css:#issue-form input[name='commit']
${preview_link}        css:#issue-form a[accesskey='r']
${preview_block}       css:#preview
${preview_desc}        css:#preview p
${message_creat_task}  css:#flash_notice
${open_edit_field}     css:#all_attributes span.icon.icon-edit
${first_task}          css:div.autoscroll>table td.subject>a


#Локаторы для  карточки задачи
${subject_card}     css:#content div.subject
${desc_card}        css:#content div.wiki p
${assigned_card}    css:#content div.assigned-to.attribute div.value>a
${edit_task_link}   css:div.contextual>a.icon.icon-edit
${copy_task_link}   css:div.contextual>a.icon.icon-copy
${delete_task_link}     css:div.contextual>a.icon.icon-del
${history_block}        css:#history
${additional_task}      css:form table.list.issues.odd-even