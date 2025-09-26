import QtQuick
import QtMultimedia

Rectangle {
    id: root
    color: "black"

    property bool started: false

    Image {
        id: background
        cache: false
        source: "images/start.png"
    }

    MediaPlayer {
        id: player
        source: "video/YoRHaSplash.mp4"
        videoOutput: videoOutput
        onPlaybackStateChanged: {
            if(root.started) {
                background.source = "images/end.png"
            } else {
                root.started = true
            }
        }
    }

    VideoOutput {
        id: videoOutput
        fillMode: VideoOutput.PreserveAspectCrop
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: root.width
        height: root.height
    }

    Component.onCompleted: {
        player.play()
    }
}
