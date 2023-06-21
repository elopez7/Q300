#include "enumconverters.h"
#include "fizzbuzztablemodel.h"

fizzBuzzTableModel::fizzBuzzTableModel(QObject *parent)
    : m_fizzBuzz{new FizzBuzz(this)}
    , QAbstractTableModel{parent}
{

}

FizzBuzz *fizzBuzzTableModel::getFizzBuzz() const
{
    return m_fizzBuzz;
}

void fizzBuzzTableModel::setFizzBuzz(FizzBuzz *newFizzBuzz)
{
    beginResetModel();
    if(m_fizzBuzz && m_isConnectedToSignals){
        m_fizzBuzz->disconnect(this);
    }

    m_fizzBuzz = newFizzBuzz;
    emit fizzBuzzChanged();

    connect(m_fizzBuzz, &FizzBuzz::preResetModel, this, [=](){
        beginResetModel();
    });
    connect(m_fizzBuzz, &FizzBuzz::postResetModel, this, [=](){
        endResetModel();
    });

    connect(m_fizzBuzz, &FizzBuzz::preAddValueToModel, this, [=](){
        const int index = m_fizzBuzz->getResulList().count();
        beginInsertRows(QModelIndex(), index, index);
    });

    connect(m_fizzBuzz, &FizzBuzz::postAddValueToModel, this, [=](){
        endInsertRows();
    });

    endResetModel();
}


int fizzBuzzTableModel::rowCount(const QModelIndex &parent) const
{
    return m_fizzBuzz->getResulList().count();
}

int fizzBuzzTableModel::columnCount(const QModelIndex &parent) const
{
    return 6;
}

QVariant fizzBuzzTableModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    if(index.row() >= m_fizzBuzz->getResulList().size() || index.row() < 0)
        return QVariant();

    if(role==+FizzBuzzRoles::DataRole){
        return m_fizzBuzz->getResulList().at(index.row()).at(index.column());
    }else if(role==+FizzBuzzRoles::FizzRole){
        return QString("fizz");
    }else if(role==+FizzBuzzRoles::BuzzRole){
        return QString("buzz");
    }
    else if(role==+FizzBuzzRoles::FizzBuzz){
        return QString("fizzbuzz");
    }
    else if(role==+FizzBuzzRoles::IntRole){
        return QString("int");
    }
    return QVariant();
}

QHash<int, QByteArray> fizzBuzzTableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[+FizzBuzzRoles::DataRole] = "tableData";
    roles[+FizzBuzzRoles::FizzRole] = "fizz";
    roles[+FizzBuzzRoles::BuzzRole] = "buzz";
    roles[+FizzBuzzRoles::FizzBuzz] = "fizzbuzz";
    roles[+FizzBuzzRoles::IntRole] = "int";
    return roles;
}
