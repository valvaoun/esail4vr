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
import QtQuick.Window
import QtQuick.Templates as T
import QtQuick.Controls.Universal
import QtQuick.Controls.Universal.impl

T.ApplicationWindow {
    id: window

    color: Universal.background

    FocusRectangle {
        parent: window.activeFocusControl
        width: parent ? parent.width : 0
        height: parent ? parent.height : 0
        visible: parent && !!parent.useSystemFocusVisuals && !!parent.visualFocus
    }
}