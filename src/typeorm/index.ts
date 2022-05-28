//Failas skirtas visiem typeorm aplanko entities importuoti

// import { Camera } from './Camera';
import { Camera } from './Camera';
import { MainDevice } from './MainDevice';
import { OrchardInfo } from './OrchardInfo';
import { Pictures } from './Pictures';
import { Plant } from './Plant';
import { User } from './User';
import { UserData } from './UserData';

//Cia sudedami visi entities
const allEntities = [User, UserData,MainDevice,OrchardInfo,Pictures,Plant,Camera];

//Exportuojami visi entities
export default allEntities;