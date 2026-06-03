import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation {
    id: presentation

    Timer {
        interval: 4000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Slide {
        Text {
            anchors.centerIn: parent
            text: "Установка OkakOS началась.\nГенерируем 67 гигабайт энтропии..."
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            color: "cyan"
        }
    }
    Slide {
        Text {
            anchors.centerIn: parent
            text: "ВНИМАНИЕ! Ваш жесткий диск прямо сейчас\nжестко форматируется под файловую систему Fat67."
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            color: "red"
        }
    }
    Slide {
        Text {
            anchors.centerIn: parent
            text: "Копируем пасхалки... 67% завершено.\nШучу, мы даже не начинали."
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            color: "cyan"
        }
    }
    Slide {
        Text {
            anchors.centerIn: parent
            text: "Сикс Севен одобряет этот дистрибутив.\nВместо systemd мы установили... а нет, всё-таки systemd."
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            color: "cyan"
        }
    }
    Slide {
        Text {
            anchors.centerIn: parent
            text: "Осталось 67 секунд...\nНаверное. Кто вообще верит этим таймерам в установщиках?"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            color: "cyan"
        }
    }
}
