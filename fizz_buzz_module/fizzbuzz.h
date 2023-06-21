#ifndef FIZZBUZZ_H
#define FIZZBUZZ_H

#include <QObject>
#include <QProperty>
#include <QtQml/qqmlregistration.h>

class FizzBuzz : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(FizzBuzzObject)

    Q_PROPERTY(int fizz READ getFizz WRITE setFizz BINDABLE bindableFizz NOTIFY fizzChanged FINAL)
    Q_PROPERTY(int buzz READ getBuzz WRITE setBuzz BINDABLE bindableBuzz NOTIFY buzzChanged FINAL)

public:
    explicit FizzBuzz(QObject *parent = nullptr);

    Q_INVOKABLE void postFizzBuzz();

    QBindable<int> bindableFizz(){return &m_fizz;}
    QBindable<int> bindableBuzz(){return &m_buzz;}

    int getFizz() const;
    void setFizz(int newFizz);
    int getBuzz() const;
    void setBuzz(int newBuzz);

    QVector<QVector<QString>> getResulList();

signals:
    void fizzChanged();
    void buzzChanged();

    void preAddValueToModel();
    void postAddValueToModel();
    void preResetModel();
    void postResetModel();

private:
    Q_OBJECT_BINDABLE_PROPERTY(FizzBuzz,
                               int,
                               m_fizz,
                               &FizzBuzz::fizzChanged);

    Q_OBJECT_BINDABLE_PROPERTY(FizzBuzz,
                               int,
                               m_buzz,
                               &FizzBuzz::buzzChanged);

    QVector<QVector<QString>> m_result;
    void addValueToResults(QVector<QString> resultToAdd);
};

#endif // FIZZBUZZ_H
