import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import qs.modules.common.functions

ContentPage {
    baseWidth: lightDarkButtonGroup.implicitWidth
    forceWidth: true

    Process {
        id: konachanWallProc
        property string status: ""
        command: ["bash", "-c", FileUtils.trimFileProtocol(`${Directories.scriptPath}/colors/random-wall.sh`)]
        stdout: SplitParser {
            onRead: data => {
                console.log(`Random wall proc output: ${data}`);
                konachanWallProc.status = data.trim();
            }
        }
    }


    ContentSection {
        title: ("Decorations & Effects")

        ContentSubsection {
            title: ("Transparency")

            ConfigRow {
                ConfigSwitch {
                    text: ("Enable")
                    checked: Config.options.appearance.transparency.enable
                    onCheckedChanged: {
                        Config.options.appearance.transparency.enable = checked;
                    }
                    StyledToolTip {
                        content: ("Might look ass. Unsupported.")
                    }
                }
            }
        }

        ContentSubsection {
            title: ("Fake screen rounding")

            ButtonGroup {
                id: fakeScreenRoundingButtonGroup
                property int selectedPolicy: Config.options.appearance.fakeScreenRounding
                spacing: 2
                SelectionGroupButton {
                    property int value: 0
                    leftmost: true
                    buttonText: ("No")
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        Config.options.appearance.fakeScreenRounding = value;
                    }
                }
                SelectionGroupButton {
                    property int value: 1
                    buttonText: ("Yes")
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        Config.options.appearance.fakeScreenRounding = value;
                    }
                }
                SelectionGroupButton {
                    property int value: 2
                    rightmost: true
                    buttonText: ("When not fullscreen")
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        Config.options.appearance.fakeScreenRounding = value;
                    }
                }
            }
        }

        ContentSubsection {
            title: ("Shell windows")

            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: ("Title bar")
                    checked: Config.options.windows.showTitlebar
                    onCheckedChanged: {
                        Config.options.windows.showTitlebar = checked;
                    }
                }
                ConfigSwitch {
                    text: ("Center title")
                    checked: Config.options.windows.centerTitle
                    onCheckedChanged: {
                        Config.options.windows.centerTitle = checked;
                    }
                }
            }
        }

        ContentSubsection {
            title: ("Wallpaper parallax")

            ConfigSwitch {
                text: ("Vertical")
                checked: Config.options.background.parallax.vertical
                onCheckedChanged: {
                    Config.options.background.parallax.vertical = checked;
                }
            }

            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: ("Depends on workspace")
                    checked: Config.options.background.parallax.enableWorkspace
                    onCheckedChanged: {
                        Config.options.background.parallax.enableWorkspace = checked;
                    }
                }
                ConfigSwitch {
                    text: ("Depends on sidebars")
                    checked: Config.options.background.parallax.enableSidebar
                    onCheckedChanged: {
                        Config.options.background.parallax.enableSidebar = checked;
                    }
                }
            }
            ConfigSpinBox {
                text: ("Preferred wallpaper zoom (%)")
                value: Config.options.background.parallax.workspaceZoom * 100
                from: 100
                to: 150
                stepSize: 1
                onValueChanged: {
                    console.log(value/100)
                    Config.options.background.parallax.workspaceZoom = value / 100;
                }
            }
        }
    }
}

