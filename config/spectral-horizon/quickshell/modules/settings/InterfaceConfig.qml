import QtQuick
import QtQuick.Layouts
import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets

ContentPage {
    forceWidth: true
    
    // Dock Section
    ContentSection {
        title: Translation.tr("Dock")
        ConfigSwitch {
            text: Translation.tr("Enable")
            checked: Config.options.dock.enable
            onCheckedChanged: { Config.options.dock.enable = checked; }
        }
        ConfigRow {
            uniform: true
            ConfigSwitch {
                text: Translation.tr("Hover to reveal")
                checked: Config.options.dock.hoverToReveal
                onCheckedChanged: { Config.options.dock.hoverToReveal = checked; }
            }
            ConfigSwitch {
                text: Translation.tr("Pinned on startup")
                checked: Config.options.dock.pinnedOnStartup
                onCheckedChanged: { Config.options.dock.pinnedOnStartup = checked; }
            }
        }
        ConfigSwitch {
            text: Translation.tr("Tint app icons")
            checked: Config.options.dock.monochromeIcons
            onCheckedChanged: { Config.options.dock.monochromeIcons = checked; }
        }
    }

    // Sidebars Section
    ContentSection {
        title: Translation.tr("Sidebars")
        ConfigSwitch {
            text: Translation.tr('Keep right sidebar loaded')
            checked: Config.options.sidebar.keepRightSidebarLoaded
            onCheckedChanged: { Config.options.sidebar.keepRightSidebarLoaded = checked; }
            StyledToolTip {
                content: Translation.tr("When enabled keeps the content of the right sidebar loaded to reduce the delay when opening,\nat the cost of around 15MB of consistent RAM usage. Delay significance depends on your system's performance.\nUsing a custom kernel like linux-cachyos might help")
            }
        }

        ContentSubsection {
            title: Translation.tr("Corner open")
            tooltip: Translation.tr("Allows you to open sidebars by clicking or hovering screen corners regardless of bar position")
            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: Translation.tr("Enable")
                    checked: Config.options.sidebar.cornerOpen.enable
                    onCheckedChanged: { Config.options.sidebar.cornerOpen.enable = checked; }
                }
                ConfigSwitch {
                    text: Translation.tr("Hover to trigger")
                    checked: Config.options.sidebar.cornerOpen.clickless
                    onCheckedChanged: { Config.options.sidebar.cornerOpen.clickless = checked; }
                    StyledToolTip { content: Translation.tr("When this is off you'll have to click") }
                }
            }
            ConfigRow {
                uniform: true
                ConfigSwitch {
                    text: Translation.tr("Place at bottom")
                    checked: Config.options.sidebar.cornerOpen.bottom
                    onCheckedChanged: { Config.options.sidebar.cornerOpen.bottom = checked; }
                    StyledToolTip { content: Translation.tr("Place the corners to trigger at the bottom") }
                }
                ConfigSwitch {
                    text: Translation.tr("Value scroll")
                    checked: Config.options.sidebar.cornerOpen.valueScroll
                    onCheckedChanged: { Config.options.sidebar.cornerOpen.valueScroll = checked; }
                    StyledToolTip { content: Translation.tr("Brightness and volume") }
                }
            }
            ConfigSwitch {
                text: Translation.tr("Visualize region")
                checked: Config.options.sidebar.cornerOpen.visualize
                onCheckedChanged: { Config.options.sidebar.cornerOpen.visualize = checked; }
                StyledToolTip { content: "When this is off you'll have to click" }
            }
            ConfigRow {
                ConfigSpinBox {
                    text: Translation.tr("Region width")
                    value: Config.options.sidebar.cornerOpen.cornerRegionWidth
                    from: 1
                    to: 300
                    stepSize: 1
                    onValueChanged: { Config.options.sidebar.cornerOpen.cornerRegionWidth = value; }
                }
                ConfigSpinBox {
                    text: Translation.tr("Region height")
                    value: Config.options.sidebar.cornerOpen.cornerRegionHeight
                    from: 1
                    to: 300
                    stepSize: 1
                    onValueChanged: { Config.options.sidebar.cornerOpen.cornerRegionHeight = value; }
                }
            }
        }
    }

    // On-screen display
    ContentSection {
        title: Translation.tr("On-screen display")
        ConfigSpinBox {
            text: Translation.tr("Timeout (ms)")
            value: Config.options.osd.timeout
            from: 100
            to: 3000
            stepSize: 100
            onValueChanged: { Config.options.osd.timeout = value; }
        }
    }

    // Screenshot tool
    ContentSection {
        title: Translation.tr("Screenshot tool")
        ConfigSwitch {
            text: Translation.tr('Show regions of potential interest')
            checked: Config.options.screenshotTool.showContentRegions
            onCheckedChanged: { Config.options.screenshotTool.showContentRegions = checked; }
            StyledToolTip {
                content: Translation.tr("Such regions could be images or parts of the screen that have some containment.\nMight not always be accurate.\nThis is done with an image processing algorithm run locally and no AI is used.")
            }
        }
    }

    // Language Section
    ContentSection {
        title: Translation.tr("Language")
        ContentSubsection {
            title: Translation.tr("Interface Language")
            tooltip: Translation.tr("Select the language for the user interface.\n\"Auto\" will use your system's locale.")

            ConfigSelectionArray {
                id: languageSelector
                currentValue: Config.options.language.ui
                configOptionName: "language.ui"
                onSelected: newValue => {
                    Config.options.language.ui = newValue;
                    reloadNotice.visible = true;
                }
                options: {
                    var baseOptions = [{ displayName: Translation.tr("Auto (System)"), value: "auto" }];
                    for (var i = 0; i < Translation.availableLanguages.length; i++) {
                        var lang = Translation.availableLanguages[i];
                        baseOptions.push({ displayName: lang.replace('_', '-'), value: lang });
                    }
                    return baseOptions;
                }
            }

            NoticeBox {
                id: reloadNotice
                visible: false
                Layout.topMargin: 8
                Layout.fillWidth: true
                text: Translation.tr("Language setting saved. Please restart Quickshell (Ctrl+Super+R) to apply the new language.")
            }
        }
    }
}

