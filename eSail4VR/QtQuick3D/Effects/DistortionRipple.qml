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
    property real radius: 100.0             // 0 - 100
    property real distortionWidth: 10.0     // 2 - 100
    property real distortionHeight: 10.0    // 0 - 100
    property real distortionPhase: 0.0      // 0 - 360
    property vector2d center: Qt.vector2d(0.5, 0.5)

    Shader {
        id: distortionVert
        stage: Shader.Vertex
        shader: "qrc:/qtquick3deffects/shaders/distortion.vert"
    }

    Shader {
        id: distortionFrag
        stage: Shader.Fragment
        shader: "qrc:/qtquick3deffects/shaders/distortionripple.frag"
    }

    passes: [
        Pass {
            shaders: [ distortionVert, distortionFrag ]
        }
    ]
}