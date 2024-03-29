#ifndef HPC_MANAGER_H
#define HPC_MANAGER_H

#include <QObject>
#include <QDebug>

class hpc_manager : public QObject
{
    Q_OBJECT

private:
    bool occupiedOne = false;
    bool occupiedTwo = false;
    bool occupiedThree = false;
    int occupiedSlots = 0;

    enum SELECTED_CHARGER{
        CCS1,
        CCS2,
        AC
    };

    SELECTED_CHARGER ACTIVE_CHARGER;

public:
    explicit hpc_manager(QObject *parent = nullptr);
    Q_INVOKABLE bool chargerIsOccupied();
    Q_INVOKABLE SELECTED_CHARGER getActiveCharger();


signals:

public slots:
    void setCurrentCharger(int cs);

};

#endif // HPC_MANAGER_H
