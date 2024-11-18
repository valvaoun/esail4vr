/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick 3D.
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
******************************************************************************/

import QtQuick
import QtQuick3D
import QtQuick3D.Effects

Effect {
    property real redStrength: 1.0      // 0 - 2
    property real greenStrength: 1.5    // 0 - 2
    property real blueStrength: 1.0     // 0 - 2
    property real saturation: 0.0       // -1 - 1

    Shader {
        id: colormaster
        stage: Shader.Fragment
        shader: "qrc:/qtquick3deffects/shaders/colormaster.frag"
    }

    passes: [
        Pass {
            shaders: colormaster
        }
    ]
}
