#ifndef FIZZBUZZTABLEMODEL_H
#define FIZZBUZZTABLEMODEL_H

#include <QObject>
#include <qqml.h>
#include <QAbstractTableModel>
#include "fizzbuzz.h"

class fizzBuzzTableModel : public QAbstractTableModel
{
    Q_OBJECT
    QML_NAMED_ELEMENT(FizzBuzzModel)
    Q_PROPERTY(FizzBuzz* fizzBuzz READ getFizzBuzz WRITE setFizzBuzz NOTIFY fizzBuzzChanged FINAL)
public:
    enum class FizzBuzzRoles{
        DataRole = Qt::UserRole + 1,
        FizzRole,
        BuzzRole,
        FizzBuzz,
        IntRole
    };
    Q_ENUM(FizzBuzzRoles);

    explicit fizzBuzzTableModel(QObject *parent = nullptr);

    FizzBuzz *getFizzBuzz() const;
    void setFizzBuzz(FizzBuzz *newFizzBuzz);

signals:
    void fizzBuzzChanged();

private:
    FizzBuzz *m_fizzBuzz;
    bool m_isConnectedToSignals;

    // QAbstractItemModel interface
    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
};

#endif // FIZZBUZZTABLEMODEL_H
