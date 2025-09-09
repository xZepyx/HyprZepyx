import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Qt.labs.platform 1.1 as Platform
import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets

ContentPage {
    forceWidth: true
    /* ------------------- Dotfiles Section ------------------- */
    ContentSection {
        title: Translation.tr("Dotfiles")

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20
            Layout.topMargin: 10
            Layout.bottomMargin: 10
            
            IconImage {
                implicitSize: 80
                source: Quickshell.iconPath(SystemInfo.logo)  // dynamic logo
            }

            // Dotfiles Info
            ColumnLayout {
                Layout.alignment: Qt.AlignVCenter
                StyledText {
                    text: Translation.tr("HyprZepyx | Spectral-Horizon")
                    font.pixelSize: Appearance.font.pixelSize.title
                }
                StyledText {
                    text: "https://github.com/xZepyx/HyprZepyx"
                    font.pixelSize: Appearance.font.pixelSize.normal
                    textFormat: Text.MarkdownText
                    onLinkActivated: (link) => {
                        Qt.openUrlExternally(link)
                    }
                    PointingHandLinkHover {}
                }
            }
        }

        Flow {
            Layout.fillWidth: true
            spacing: 5

            RippleButtonWithIcon {
                materialIcon: "auto_stories"
                mainText: Translation.tr("Documentation")
                onClicked: {
                    Qt.openUrlExternally("https://github.com/xZepyx/HyprZepyx/wiki")
                }
            }
            RippleButtonWithIcon {
                materialIcon: "adjust"
                materialIconFill: false
                mainText: Translation.tr("Issues")
                onClicked: {
                    Qt.openUrlExternally("https://github.com/xZepyx/HyprZepyx/issues")
                }
            }
            RippleButtonWithIcon {
                materialIcon: "forum"
                mainText: Translation.tr("Discussions")
                onClicked: {
                    Qt.openUrlExternally("https://github.com/xZepyx/HyprZepyx/discussions")
                }
            }
            RippleButtonWithIcon {
                materialIcon: "favorite"
                mainText: Translation.tr("Donate")
                onClicked: {
                    Qt.openUrlExternally("https://github.com/sponsors/xZepyx")
                }
            }
        }
    }
}

