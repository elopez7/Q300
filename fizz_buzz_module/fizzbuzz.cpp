#include "fizzbuzz.h"

FizzBuzz::FizzBuzz(QObject *parent)
    : QObject{parent}
{

}

void FizzBuzz::postFizzBuzz()
{
    if(!m_result.empty()){
        emit preResetModel();
        m_result.clear();
        emit postResetModel();
    }

    bool isFizz;
    bool isBuzz;

    int num = 0;
    for(auto i = 0; i <= 50; i++ ){
        QVector<QString> rowValues;
        for(auto j = 0; j < 6; j++){
            isFizz = (num % m_fizz == 0);
            isBuzz = (num % m_buzz == 0);
            if(isFizz && isBuzz){
                rowValues.append("FizzBuzz");
            }else if(isFizz){
                rowValues.append("Fizz");
            }else if(isBuzz){
                rowValues.append("Buzz");
            }else{
                rowValues.append(QString::number(num));
            }
            ++num;
        }
        addValueToResults(rowValues);
    }
}

int FizzBuzz::getFizz() const
{
    return m_fizz;
}

void FizzBuzz::setFizz(int newFizz)
{
    m_fizz = newFizz;
}

int FizzBuzz::getBuzz() const
{
    return m_buzz;
}

void FizzBuzz::setBuzz(int newBuzz)
{
    m_buzz = newBuzz;
}

QVector<QVector<QString>> FizzBuzz::getResulList()
{
    return m_result;
}

void FizzBuzz::addValueToResults(QVector<QString> resultToAdd)
{
    emit preAddValueToModel();
    m_result.append(resultToAdd);
    emit postAddValueToModel();
}
