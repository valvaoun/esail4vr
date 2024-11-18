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
import QtQuick.Controls.Imagine
import QtQuick.Controls.Imagine.impl

T.PageIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: background ? background.topPadding : 0
    leftPadding: background ? background.leftPadding : 0
    rightPadding: background ? background.rightPadding : 0
    bottomPadding: background ? background.bottomPadding : 0

    topInset: background ? -background.topInset || 0 : 0
    leftInset: background ? -background.leftInset || 0 : 0
    rightInset: background ? -background.rightInset || 0 : 0
    bottomInset: background ? -background.bottomInset || 0 : 0

    delegate: Image {
        source: Imagine.url + "pageindicator-delegate"
        ImageSelector on source {
            states: [
                {"disabled": !control.enabled},
                {"pressed": pressed},
                {"current": index === control.currentIndex},
                {"mirrored": control.mirrored},
                {"hovered": control.enabled && control.hovered} // ### TODO: context property
            ]
        }
    }

    contentItem: Row {
        spacing: control.spacing

        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }

    background: NinePatchImage {
        source: Imagine.url + "pageindicator-background"
        NinePatchImageSelector on source {
            states: [
                {"disabled": !control.enabled},
                {"mirrored": control.mirrored},
                {"hovered": control.enabled && control.hovered}
            ]
        }
    }
}