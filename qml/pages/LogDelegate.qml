/*
 * Copyright 2014 Aleksi Suomalainen <suomalainen.aleksi@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
*/

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import org.nemomobile.contacts 1.0
import org.nemomobile.commhistory 1.0
import QtQuick.Layouts 1.0

Item {
    width: parent.width
    height: 72

    RowLayout {
        anchors.fill: parent
        spacing: 10
        Label {
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: model.isMissedCall ? 'missed' : (model.direction == CommCallModel.Inbound ? 'received' : 'initiated')
        }
        Label {
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: model.remoteUid
        }
        Button {
            Layout.fillWidth: false
            Layout.fillHeight: true
            width: 40
            text: "Delete"
            onClicked: {
                pageItem.pageStack.pop()
                commCallModel.deleteAt(model.index)
                telephone.dial(telephone.defaultProviderId, model.remoteUid)
            }
        }
    }
}
