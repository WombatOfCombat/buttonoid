import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasma5support as Plasma5Support

PlasmoidItem {
    id: root

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground
    preferredRepresentation: fullRepresentation

    Plasma5Support.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: (sourceName) => disconnectSource(sourceName)
        function exec(cmd) {
            connectSource(cmd)
        }
    }

    fullRepresentation: MouseArea {
        id: mouseArea
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        Layout.minimumWidth: 16
        Layout.minimumHeight: 16
        Layout.preferredWidth: 48
        Layout.preferredHeight: 48

        onClicked: {
            const cmd = Plasmoid.configuration.appName;
            if (cmd && cmd.length > 0) {
                executable.exec(cmd);
            }
        }

        Image {
            id: appImage
            anchors.fill: parent
            source: Plasmoid.configuration.imagePath
            ? "file://" + Plasmoid.configuration.imagePath
            : ""
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            asynchronous: true

            sourceSize.width: width
            sourceSize.height: height

            opacity: mouseArea.pressed ? 0.7 : 1.0
            Behavior on opacity { NumberAnimation { duration: 100 } }
        }
    }
}
