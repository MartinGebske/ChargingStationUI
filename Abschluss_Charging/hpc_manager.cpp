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

hpc_manager::SELECTED_CHARGER hpc_manager::getActiveCharger()
{
    qDebug() << ACTIVE_CHARGER;
    return ACTIVE_CHARGER;
}



void hpc_manager::setCurrentCharger(int cs)
{
    switch (cs) {
       case 1:
           occupiedOne = true;
           ACTIVE_CHARGER = SELECTED_CHARGER::CCS1;
           qDebug() << "Charger " << getActiveCharger() << " occupied";
           ++occupiedSlots;
           break;
       case 2:
           occupiedTwo = true;
           ACTIVE_CHARGER = SELECTED_CHARGER::CCS2;
           qDebug() << "Charger " << getActiveCharger() << " occupied";
           ++occupiedSlots;
           break;
       case 3:
           occupiedThree = true;
           ACTIVE_CHARGER = SELECTED_CHARGER::AC;
           qDebug() << "Charger " << getActiveCharger() << " occupied";
           ++occupiedSlots;
           break;
       default:
           qDebug() << "No valid Charger selected!";
           break;
       }
}
