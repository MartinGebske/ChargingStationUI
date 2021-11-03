#include "hpc_manager.h"

hpc_manager::hpc_manager(QObject *parent) : QObject(parent)
{

}

bool hpc_manager::chargerIsOccupied()
{
    if(occupiedOne && occupiedTwo)
        return true;
    else if(occupiedOne && occupiedThree)
        return true;
    else if(occupiedTwo && occupiedThree)
        return true;
    else
        return false;
}


void hpc_manager::setCurrentCharger(int cs)
{
    switch (cs) {
       case 1:
           occupiedOne = true;
           ++occupiedSlots;
           qDebug() << "Charger 1 occupied!";
           break;
       case 2:
           occupiedTwo = true;
           ++occupiedSlots;
           qDebug() << "Charger 2 occupied!";
           break;
       case 3:
           occupiedThree = true;
           ++occupiedSlots;
           qDebug() << "Charger 3 occupied!";
           break;
       default:
           qDebug() << "No valid Charger selected!";
           break;
       }
}
