import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import QtQuick.Dialogs as QQD
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_imagePath: imagePathField.text
    property alias cfg_appName: appNameField.text

    RowLayout {
        Kirigami.FormData.label: i18n("PNG image:")
        Layout.fillWidth: true

        QQC2.TextField {
            id: imagePathField
            Layout.fillWidth: true
            placeholderText: i18n("/path/to/icon.png")
        }

        QQC2.Button {
            icon.name: "document-open"
            text: i18n("Browse…")
            onClicked: fileDialog.open()
        }
    }

    QQD.FileDialog {
        id: fileDialog
        title: i18n("Choose an image")
        nameFilters: [i18n("PNG images (*.png)")]
        onAccepted: {
            let path = selectedFile.toString();
            imagePathField.text = path.replace(/^file:\/\//, "");
        }
    }

    QQC2.TextField {
        id: appNameField
        Kirigami.FormData.label: i18n("Command to launch:")
        placeholderText: i18n("e.g. firefox, or dolphin --new-window")
    }
}
