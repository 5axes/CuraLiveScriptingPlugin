// Copyright (c) 2015 Ultimaker B.V.
// Uranium is released under the terms of the AGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.2

import UM 1.1 as UM
import LiveScripting 1.0

Item
{
    id: base
    width: childrenRect.width
    height: childrenRect.height

    Column {
        TextArea {
            id: input
            width: viewportOverlay.width - x - 100
            height: viewportOverlay.height - y - result.height - 100

            font.family: "Courier New"
            wrapMode: TextEdit.NoWrap
            textFormat: TextEdit.PlainText
            text: UM.ActiveTool.properties.getValue("Script")
            onTextChanged: {
                UM.ActiveTool.setProperty("Script", text)
            }
        }
        TextArea {
            id: result
            width: viewportOverlay.width - x - 100
            height: 200

            readOnly: true
            wrapMode: TextEdit.NoWrap
            textFormat: TextEdit.PlainText
            font.family: "Courier New"
            text: UM.ActiveTool.properties.getValue("Result")
        }
    }
}