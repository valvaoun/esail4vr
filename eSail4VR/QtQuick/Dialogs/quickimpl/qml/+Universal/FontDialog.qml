/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Dialogs module of the Qt Toolkit.
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
import QtQuick.Controls.impl
import QtQuick.Controls.Universal
import QtQuick.Dialogs
import QtQuick.Dialogs.quickimpl
import QtQuick.Layouts
import QtQuick.Templates as T

FontDialogImpl {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding,
                            implicitHeaderWidth,
                            implicitFooterWidth)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding
                             + (implicitHeaderHeight > 0 ? implicitHeaderHeight + spacing : 0)
                             + (implicitFooterHeight > 0 ? implicitFooterHeight + spacing : 0))

    padding: 24
    verticalPadding: 18

    standardButtons: T.Dialog.Ok | T.Dialog.Cancel

    FontDialogImpl.buttonBox: buttonBox
    FontDialogImpl.familyListView: content.familyListView
    FontDialogImpl.styleListView: content.styleListView
    FontDialogImpl.sizeListView: content.sizeListView
    FontDialogImpl.sampleEdit: content.sampleEdit
    FontDialogImpl.writingSystemComboBox: writingSystemComboBox
    FontDialogImpl.underlineCheckBox: content.underline
    FontDialogImpl.strikeoutCheckBox: content.strikeout
    FontDialogImpl.familyEdit: content.familyEdit
    FontDialogImpl.styleEdit: content.styleEdit
    FontDialogImpl.sizeEdit: content.sizeEdit

    background: Rectangle {
        implicitWidth: 600
        implicitHeight: 400
        color: control.Universal.chromeMediumLowColor
        border.color: control.Universal.chromeHighColor
        border.width: 1 // FlyoutBorderThemeThickness
    }

    Overlay.modal: Rectangle {
        color: control.Universal.baseLowColor
    }

    Overlay.modeless: Rectangle {
        color: control.Universal.baseLowColor
    }

    header: Label {
        text: control.title
        elide: Label.ElideRight
        // TODO: QPlatformTheme::TitleBarFont
        font.pixelSize: 20

        leftPadding: 24
        rightPadding: 24
        topPadding: 18
        height: control.title.length > 0 ? implicitHeight : 0

        background: Rectangle {
            x: 1; y: 1 // // FlyoutBorderThemeThickness
            color: control.Universal.chromeMediumLowColor
            width: parent.width - 2
            height: parent.height - 1
        }
    }

    contentItem: FontDialogContent {
        id: content
        rowSpacing: 12
    }

    footer: RowLayout {
        id: rowLayout
        spacing: 24

        Label {
            text: qsTr("Writing System")

            Layout.leftMargin: 24
            Layout.topMargin: 6
            Layout.bottomMargin: 24
        }
        ComboBox{
            id: writingSystemComboBox

            Layout.fillWidth: true
            Layout.topMargin: 6
            Layout.bottomMargin: 24

        }

        DialogButtonBox {
            id: buttonBox
            standardButtons: control.standardButtons
            spacing: 12
            horizontalPadding: 0

            Layout.rightMargin: 24
        }
    }
}
