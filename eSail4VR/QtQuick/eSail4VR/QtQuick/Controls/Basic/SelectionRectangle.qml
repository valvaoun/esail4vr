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
import QtQuick.Controls.impl
import QtQuick.Shapes
import QtQuick.Templates as T

T.SelectionRectangle {
    id: control

    topLeftHandle: Handle {}
    bottomRightHandle: Handle {}

    component Handle : Rectangle {
        id: handle
        width: 28
        height: width
        radius: width / 2
        color: SelectionRectangle.dragging ? control.palette.light : control.palette.window
        border.width: 1
        border.color: control.enabled ? control.palette.mid : control.palette.midlight
        visible: SelectionRectangle.control.active

        property Item control: SelectionRectangle.control
    }

}