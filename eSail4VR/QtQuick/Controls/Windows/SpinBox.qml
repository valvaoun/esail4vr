/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
**
******************************************************************************/

import QtQuick
import QtQuick.Templates as T
import QtQuick.NativeStyle as NativeStyle

T.SpinBox {
    id: control

    property bool nativeIndicators: up.indicator.hasOwnProperty("_qt_default")
                                    && down.indicator.hasOwnProperty("_qt_default")

    implicitWidth: Math.max(contentItem.implicitWidth + leftInset + rightInset,
                            90 /* minimum */ )
    implicitHeight: Math.max(contentItem.implicitHeight, up.implicitIndicatorHeight + down.implicitIndicatorHeight)
                    + topInset + bottomInset

    spacing: 2

    leftPadding: 0
    topPadding: 0
    rightPadding: rightInset
    bottomPadding: 0

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    contentItem: TextField {
        text: control.displayText
        font: control.font
        color: control.palette.text
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter

        topPadding: 0
        bottomPadding: 0
        leftPadding: 10
        rightPadding: 10

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints

        // Since the indicators are embedded inside the TextField we need to avoid that
        // the TextField consumes mouse events for that area.
        // We achieve that by setting a containmentMask
        containmentMask: Item { height: contentItem.height; width: contentItem.width - upAndDown.width }
    }

    NativeStyle.SpinBox {
        id: upAndDown
        control: control
        subControl: NativeStyle.SpinBox.Up
        visible: nativeIndicators
        x: up.indicator.x
        y: up.indicator.y
        //implicitHeight: contentItem.implicitHeight-2
        height: parent.height-2
        useNinePatchImage: false
        z:99
    }

    up.indicator: Item {
        x: parent.width - width - 2
        y: 1
        height: upAndDown.height >> 1
        implicitWidth: upAndDown.implicitWidth
        implicitHeight: (upAndDown.implicitHeight >> 1)
        property bool _qt_default
    }

    down.indicator: Item {
        x: parent.width - width - 2
        y: up.indicator.y + (upAndDown.height >> 1)
        height: upAndDown.height - up.indicator.height
        implicitWidth: upAndDown.implicitWidth
        implicitHeight: upAndDown.implicitHeight >> 1
        property bool _qt_default
    }

    background: Item {} // No background, the TextField will cover the whole control
}