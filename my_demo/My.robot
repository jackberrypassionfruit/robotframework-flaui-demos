*** Settings ***
Documentation       Test suite for opening a new file in Sublime Text Editor.
...

Library             Process
Library             FlaUILibrary    screenshot_on_failure=False


*** Variables ***
${NEW_SUBLIME_WINDOW}    apps\\Sublime_Text
${XPATH_SUBLIME_WINDOW}    /Window[@ClassName='PX_WINDOW_CLASS']

@{KEYBOARD_INPUT_OPEN_FILE}    s'CTRL+O'

${XPATH_SUBLIME_OPEN_FILE_TEXTINPUT}   ${XPATH_SUBLIME_WINDOW}/Window[@Name='Open']/ComboBox[@AutomationId='1148']/Edit[@AutomationId='1148']
${KEYBOARD_INPUT_TEXT}    t'\\Users\\Jack\\Downloads\\firefox_rsa_auth_backup_codes.txt'

${XPATH_SUBLIME_OPEN_FILE_BUTTON}   ${XPATH_SUBLIME_WINDOW}/Window[@Name='Open']/Button[@AutomationId='1']


*** Test Cases ***
Launch Application
    ${PID}    Launch Application        ${NEW_SUBLIME_WINDOW}
    Should Not Be Equal As Integers     ${PID}      0

Open a New File
    Press Key    @{KEYBOARD_INPUT_OPEN_FILE}    ${XPATH_SUBLIME_WINDOW}
    Press Key    ${KEYBOARD_INPUT_TEXT}    ${XPATH_SUBLIME_OPEN_FILE_TEXTINPUT}   
    Click    ${XPATH_SUBLIME_OPEN_FILE_BUTTON}


