import qs
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import "./quickToggles/"
import "./wifiNetworks/"
import "./bluetoothDevices/"
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Hyprland

Item {
    id: root
    property int sidebarWidth: Appearance.sizes.sidebarWidth
    property int sidebarPadding: 12
    property string settingsQmlPath: Quickshell.shellPath("settings.qml")
    property bool showWifiDialog: false
    property bool showBluetoothDialog: false

    Connections {
        target: GlobalStates
        function onSidebarRightOpenChanged() {
            if (!GlobalStates.sidebarRightOpen) {
                root.showWifiDialog = false;
                root.showBluetoothDialog = false;
            }
        }
    }

    implicitHeight: sidebarRightBackground.implicitHeight
    implicitWidth: sidebarRightBackground.implicitWidth

    StyledRectangularShadow {
        target: sidebarRightBackground
    }
    Rectangle {
        id: sidebarRightBackground

        anchors.fill: parent
        implicitHeight: parent.height - Appearance.sizes.hyprlandGapsOut * 2
        implicitWidth: sidebarWidth - Appearance.sizes.hyprlandGapsOut * 2
        color: Appearance.colors.colLayer0
        border.width: 1
        border.color: Appearance.colors.colLayer0Border
        radius: Appearance.rounding.screenRounding - Appearance.sizes.hyprlandGapsOut + 1

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: sidebarPadding
            spacing: sidebarPadding

            RowLayout {
                Layout.fillHeight: false
                spacing: 10
                Layout.margins: 10
                Layout.topMargin: 5
                Layout.bottomMargin: 0


                StyledText {
                    font.pixelSize: Appearance.font.pixelSize.normal
                    color: Appearance.colors.colOnLayer0
                    text: ("Uptime: %1").arg(DateTime.uptime)
                    textFormat: Text.MarkdownText
                }

                Item {
                    Layout.fillWidth: true
                }

                ButtonGroup {
                    QuickToggleButton {
                        toggled: false
                        buttonIcon: "lock"
                        onClicked: {
                            Quickshell.execDetached(["bash", "-c", "~/.scripts/spectral-horizon/hyprlock.sh"])
                        }
                        StyledToolTip {
                            content: ("Lock-Screen")
                        }
                    }
                    QuickToggleButton {
                        toggled: false
                        buttonIcon: "settings"
                        onClicked: {
                            GlobalStates.sidebarRightOpen = false;
                            Quickshell.execDetached(["qs", "-p", root.settingsQmlPath]);
                        }
                        StyledToolTip {
                            content: ("Settings")
                        }
                    }
                    QuickToggleButton {
                        toggled: false
                        buttonIcon: "power_settings_new"
                        onClicked: {
                            GlobalStates.sessionOpen = true;
                        }
                        StyledToolTip {
                            content: ("Session")
                        }
                    }
                }
            }

            ButtonGroup {
                Layout.alignment: Qt.AlignHCenter
                spacing: 5
                padding: 5
                color: Appearance.colors.colLayer1

                NetworkToggle {
                    altAction: () => {
                        Network.enableWifi();
                        Network.rescanWifi();
                        root.showWifiDialog = true;
                    }
                }
                BluetoothToggle {
                    altAction: () => {
                        Bluetooth.defaultAdapter.enabled = true;
                        Bluetooth.defaultAdapter.discovering = true;
                        root.showBluetoothDialog = true;
                    }
                }
                NightLight {}
                IdleInhibitor {}
                EasyEffectsToggle {}
                CloudflareWarp {}
            }

            CenterWidgetGroup {
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    onShowWifiDialogChanged: if (showWifiDialog) wifiDialogLoader.active = true;
    Loader {
        id: wifiDialogLoader
        anchors.fill: parent

        active: root.showWifiDialog || item.visible
        onActiveChanged: {
            if (active) {
                item.show = true;
                item.forceActiveFocus();
            }
        }

        sourceComponent: WifiDialog {
            onDismiss: {
                show = false
                root.showWifiDialog = false
            }
            onVisibleChanged: {
                if (!visible && !root.showWifiDialog) wifiDialogLoader.active = false;
            }
        }
    }

    onShowBluetoothDialogChanged: {
        if (showBluetoothDialog) bluetoothDialogLoader.active = true;
        else Bluetooth.defaultAdapter.discovering = false;
    }
    Loader {
        id: bluetoothDialogLoader
        anchors.fill: parent

        active: root.showBluetoothDialog || item.visible
        onActiveChanged: {
            if (active) {
                item.show = true;
                item.forceActiveFocus();
            }
        }

        sourceComponent: BluetoothDialog {
            onDismiss: {
                show = false
                root.showBluetoothDialog = false
            }
            onVisibleChanged: {
                if (!visible && !root.showBluetoothDialog) bluetoothDialogLoader.active = false;
            }
        }
    }
}
