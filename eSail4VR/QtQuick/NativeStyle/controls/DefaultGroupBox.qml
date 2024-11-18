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
import QtQuick.Controls
import QtQuick.Templates as T
import QtQuick.NativeStyle as NativeStyle

T.GroupBox {
    id: control

    readonly property bool __nativeBackground: background instanceof NativeStyle.StyleItem

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding,
                            implicitLabelWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    label: Rectangle {
        color: control.palette.window
        property point labelPos : control.__nativeBackground
                                  ? background.labelPos
                                  : Qt.point(0,0)
        x: labelPos.x + background.x
        y: labelPos.y + background.y - (__nativeBackground ? background.groupBoxPadding.top : 0)
        width: children[0].implicitWidth
        height: children[0].implicitHeight
        Text {
            width: parent.width
            height: parent.height
            text: control.title
            font: control.font
            color: control.palette.windowText
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
    }

    leftPadding: __nativeBackground ? background.contentPadding.left : 0
    rightPadding: __nativeBackground ? background.contentPadding.right : 0
    topPadding: __nativeBackground ? background.contentPadding.top : 0
    bottomPadding: __nativeBackground ? background.contentPadding.bottom : 0

    leftInset: __nativeBackground ? background.groupBoxPadding.left : 0
    topInset: __nativeBackground ? background.groupBoxPadding.top : 0

    background: NativeStyle.GroupBox {
        control: control
        contentWidth: contentItem.implicitWidth
        contentHeight: contentItem.implicitHeight
    }
}