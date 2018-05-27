import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtGraphicalEffects 1.0

ApplicationWindow {
    id:window
    visible: true
    width: Screen.width
    height: Screen.height
    background: Rectangle{
        color: "black"
    }

    property bool isAllTop: !page1.isTop && !page2.isTop && !page3.isTop

    Item{
        id:page1
        y: 25
        z:0
        width: parent.width
        height: parent.height - 75
        property bool isTop: false
        Rectangle{
            anchors.fill: parent
            color:"#969696"
            radius: 10
        }
        Label{
            anchors.top:parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            color:"gray"
            text:"å·²è®¡åˆ’"
        }

        MouseArea{
            anchors.fill: parent
            onClicked:{
                if(page1.isTop || page2.isTop || page3.isTop){
                    page1.isTop = false
                    page2.isTop = false
                    page3.isTop = false
                }else{
                    parent.isTop = !parent.isTop
                }
            }
        }

    }

    Item{
        id:page2
        y: 75
        z: 1
        width: parent.width
        height: parent.height - 75
        property bool isTop: false
        Rectangle{
            anchors.fill: parent
            color:"#8B6914"
            radius: 10
        }
        Label{
            anchors.top:parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            color:"blue"
            text:"æé†’äº‹é¡¹"
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                if(page1.isTop || page2.isTop || page3.isTop){
                    page1.isTop = false
                    page2.isTop = false
                    page3.isTop = false
                }else{
                    parent.isTop = !parent.isTop
                }
            }
        }
    }

    Item{
        id:page3
        y: 125
        z: 2
        width: parent.width
        height: parent.height - 75
        property bool isTop: false
        Rectangle{
            anchors.fill: parent
            color:"#8B4513"
            radius: 10
        }

        Label{
            anchors.top:parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            color:"yellow"
            text:"æé†’"
        }

        MouseArea{
            anchors.fill: parent
            onClicked:{
                if(page1.isTop || page2.isTop || page3.isTop){
                    page1.isTop = false
                    page2.isTop = false
                    page3.isTop = false
                }else{
                    parent.isTop = !parent.isTop
                }
            }
        }
    }

    StateGroup{
        states: [
            State {
                name: "page1_front"
                when: page1.isTop
                PropertyChanges {
                    target: page1
                    y:25
                }
                PropertyChanges {
                    target: page3
                    y:window.height-25
                }
                PropertyChanges {
                    target: page2
                    y:window.height-30
                }
            },
            State {
                name: "page2_front"
                when: page2.isTop
                PropertyChanges {
                    target: page2
                    y:25
                }
                PropertyChanges {
                    target: page1
                    y:window.height-30
                }
                PropertyChanges {
                    target: page3
                    y:window.height-25
                }
            },
            State {
                name: "page3_front"
                when: page3.isTop
                PropertyChanges {
                    target: page3
                    y:25
                }
                PropertyChanges {
                    target: page1
                    y:window.height-30
                }
                PropertyChanges {
                    target: page2
                    y:window.height-25
                }
            },
            State {
                name: "all_top"
                when: isAllTop
                PropertyChanges {
                    target: page1
                    y:25
                }
                PropertyChanges {
                    target: page2
                    y:75
                }
                PropertyChanges {
                    target: page3
                    y:125
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "*"
                NumberAnimation{
                    properties: "y"; easing.type: Easing.OutCirc
                    duration: 350
                }
            }
        ]
    }
}
