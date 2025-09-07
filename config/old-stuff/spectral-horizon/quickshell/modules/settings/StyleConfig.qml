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
        command: ["bash", "-c", FileUtils.trimFileProtocol(`${Directories.scriptPath}/colors/random_konachan_wall.sh`)]
        stdout: SplitParser {
            onRead: data => {
                console.log(`Konachan wall proc output: ${data}`);
                konachanWallProc.status = data.trim();
            }
        }
    }

    ContentSection {
        title: Translation.tr("Colors & Wallpaper")

        // Light/Dark mode preference
        ButtonGroup {
            id: lightDarkButtonGroup
            Layout.fillWidth: true
            LightDarkPreferenceButton {
                dark: false
            }
            LightDarkPreferenceButton {
                dark: true
            }
        }

        // Material palette selection
        ContentSubsection {
            title: Translation.tr("Material palette")
            ConfigSelectionArray {
                currentValue: Config.options.appearance.palette.type
                configOptionName: "appearance.palette.type"
                onSelected: (newValue) => {
                    Config.options.appearance.palette.type = newValue;
                    Quickshell.execDetached(["bash", "-c", `${Directories.wallpaperSwitchScriptPath} --noswitch`])
                }
                options: [
                    {"value": "auto", "displayName": Translation.tr("Auto")},
                    {"value": "scheme-content", "displayName": Translation.tr("Content")},
                    {"value": "scheme-expressive", "displayName": Translation.tr("Expressive")},
                    {"value": "scheme-fidelity", "displayName": Translation.tr("Fidelity")},
                    {"value": "scheme-fruit-salad", "displayName": Translation.tr("Fruit Salad")},
                    {"value": "scheme-monochrome", "displayName": Translation.tr("Monochrome")},
                    {"value": "scheme-neutral", "displayName": Translation.tr("Neutral")},
                    {"value": "scheme-rainbow", "displayName": Translation.tr("Rainbow")},
                    {"value": "scheme-tonal-spot", "displayName": Translation.tr("Tonal Spot")}
                ]
            }
        }

        StyledText {
            Layout.topMargin: 5
            Layout.alignment: Qt.AlignHCenter
            text: Translation.tr("Alternatively use /dark, /light, /img in the launcher")
            font.pixelSize: Appearance.font.pixelSize.smaller
            color: Appearance.colors.colSubtext
        }
    
    }

    ContentSection {
        title: Translation.tr("Decorations & Effects")

        ContentSubsection {
            title: Translation.tr("Transparency")

            ConfigRow {
                ConfigSwitch {
                    text: Translation.tr("Enable")
                    checked: Config.options.appearance.transparency.enable
                    onCheckedChanged: {
                        Config.options.appearance.transparency.enable = checked;
                    }
                    StyledToolTip {
                        content: Translation.tr("Might look ass. Unsupported.")
                    }
                }
            }
        }

        ContentSubsection {
            title: Translation.tr("Fake screen rounding")

            ButtonGroup {
                id: fakeScreenRoundingButtonGroup
                property int selectedPolicy: Config.options.appearance.fakeScreenRounding
                spacing: 2
                SelectionGroupButton {
                    property int value: 0
                    leftmost: true
                    buttonText: Translation.tr("No")
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        Config.options.appearance.fakeScreenRounding = value;
                    }
                }
                SelectionGroupButton {
                    property int value: 1
                    buttonText: Translation.tr("Yes")
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        Config.options.appearance.fakeScreenRounding = value;
                    }
                }
                SelectionGroupButton {
                    property int value: 2
                    rightmost: true
                    buttonText: Translation.tr("When not fullscreen")
                    toggled: (fakeScreenRoundingButtonGroup.selectedPolicy === value)
                    onClicked: {
                        Config.options.appearance.fakeScreenRounding = value;
                    }
                }
            }
        }

        ContentSubsection {
            title: Translation.tr("Shell windows")

            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: Translation.tr("Title bar")
                    checked: Config.options.windows.showTitlebar
                    onCheckedChanged: {
                        Config.options.windows.showTitlebar = checked;
                    }
                }
                ConfigSwitch {
                    text: Translation.tr("Center title")
                    checked: Config.options.windows.centerTitle
                    onCheckedChanged: {
                        Config.options.windows.centerTitle = checked;
                    }
                }
            }
        }

        ContentSubsection {
            title: Translation.tr("Wallpaper parallax")

            ConfigSwitch {
                text: Translation.tr("Vertical")
                checked: Config.options.background.parallax.vertical
                onCheckedChanged: {
                    Config.options.background.parallax.vertical = checked;
                }
            }

            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: Translation.tr("Depends on workspace")
                    checked: Config.options.background.parallax.enableWorkspace
                    onCheckedChanged: {
                        Config.options.background.parallax.enableWorkspace = checked;
                    }
                }
                ConfigSwitch {
                    text: Translation.tr("Depends on sidebars")
                    checked: Config.options.background.parallax.enableSidebar
                    onCheckedChanged: {
                        Config.options.background.parallax.enableSidebar = checked;
                    }
                }
            }
            ConfigSpinBox {
                text: Translation.tr("Preferred wallpaper zoom (%)")
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

