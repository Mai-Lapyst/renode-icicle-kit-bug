*** Settings ***
Suite Setup                   Setup
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}

*** Variables ***
${SCRIPT}                     ${CURDIR}/test.resc
${MMUART0}                    sysbus.mmuart0
${MMUART1}                    sysbus.mmuart1

*** Keywords ***
Load Script
    Execute Script            ${SCRIPT}
    Create Terminal Tester    ${MMUART1}
    Create Log Tester         0


*** Test Cases ***
Should Run Test Case
    Load Script
    Start Emulation

    Wait For Prompt On Uart     Starting kernel ...
    Should Not Be In Log        Trying to execute code outside RAM or ROM   30