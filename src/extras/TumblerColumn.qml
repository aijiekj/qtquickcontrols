/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Extras module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0

/*!
    \qmltype TumblerColumn
    \inqmlmodule QtQuick.Extras
    \since QtQuick.Extras 1.2
    \ingroup extras
    \brief A column within a tumbler.

    \note TumblerColumn requires Qt 5.3.2 or later.

    TumblerColumn represents a column within a tumbler, providing the interface
    to define the items and width of each column.

    \code
    Tumbler {
        TumblerColumn {
            model: [1, 2, 3]
        }

        TumblerColumn {
            model: ["A", "B", "C"]
            visible: false
        }
    }
    \endcode

    You can create a custom appearance for a Tumbler by assigning a
    \l {QtQuick.Extras.Styles::}{TumblerStyle}.
*/

QtObject {
    id: tumblerColumn

    /*! \internal */
    property Item __tumbler: null

    /*!
        \internal

        The index of this column within the tumbler.
    */
    property int __index: -1

    /*!
        \internal

        The index of the current item, if the PathView has items instantiated,
        or the last current index if it doesn't.
    */
    property int __currentIndex: -1

    Accessible.role: Accessible.ColumnHeader

    /*!
        \qmlproperty readonly int TumblerColumn::currentIndex

        This read-only property holds the index of the current item for this
        column. If the model count is reduced, the current index will be
        reduced to the new count minus one.

        \sa {Tumbler::currentIndexAt}, {Tumbler::setCurrentIndexAt}
    */
    readonly property alias currentIndex: tumblerColumn.__currentIndex

    /*!
        This property holds the model that provides data for this column.
    */
    property var model: null

    /*!
        This property holds the model role of this column.
    */
    property string role: ""

    /*!
        The item delegate for this column.

        If set, this delegate will be used to display items in this column,
        instead of the
        \l {QtQuick.Extras.Styles::TumblerStyle::delegate}{delegate}
        property in \l {QtQuick.Extras.Styles::}{TumblerStyle}.

        The \l {Item::implicitHeight}{implicitHeight} property must be set,
        and it must be the same for each delegate.
    */
    property Component delegate

    /*!
        The highlight delegate for this column.

        If set, this highlight will be used to display the highlight in this
        column, instead of the
        \l {QtQuick.Extras.Styles::TumblerStyle::highlight}{highlight}
        property in \l {QtQuick.Extras.Styles::}{TumblerStyle}.
    */
    property Component highlight

    /*!
        The foreground of this column.

        If set, this component will be used to display the foreground in this
        column, instead of the
        \l {QtQuick.Extras.Styles::TumblerStyle::columnForeground}{columnForeground}
        property in \l {QtQuick.Extras.Styles::}{TumblerStyle}.
    */
    property Component columnForeground

    /*!
        This property holds the visibility of this column.
    */
    property bool visible: true

    /*!
        This read-only property indicates whether the item has active focus.

        See Item's \l {Item::activeFocus}{activeFocus} property for more
        information.
    */
    readonly property bool activeFocus: {
        if (__tumbler === null)
            return null;

        var view = __tumbler.__viewAt(__index);
        return view && view.activeFocus ? true : false;
    }

    /*!
        This property holds the width of this column.
    */
    property real width: TextSingleton.implicitHeight * 4
}