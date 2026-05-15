import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Slide {
        Text {
            anchors.centerIn: parent
            text: "Установка началась. OkakOS готовится..."
            font.pixelSize: 24
            color: "cyan"
        }
    }
    Slide {
        Text {
            anchors.centerIn: parent
            text: "Копируем пасхалки на жесткий диск...\nЦифра 67 уже летит в систему."
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            color: "cyan"
        }
    }
    Slide {
        Text {
            anchors.centerIn: parent
            text: "Спойлер: systemd на месте, но зато с красивым ASCII артом."
            font.pixelSize: 24
            color: "cyan"
        }
    }
}
