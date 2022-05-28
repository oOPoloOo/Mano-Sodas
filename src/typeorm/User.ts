import{ Entity, PrimaryGeneratedColumn,Column, OneToOne, JoinColumn} from 'typeorm';
import { MainDevice } from './MainDevice';
import { UserData } from './UserData';

@Entity({name: 'user'})
export class User {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'user_id', // kaip pavadins DB
    })
    id: number;  
    
    @Column({        
        nullable: false,
        default: '',
    })
    state: string;

    @Column({        
        nullable: false,
        default: '',
    })
    city: string;

    @Column({
        name: 'street_adress',
        nullable: false,
        default: '',
    })
    streetAddress: string;

    // @Column({
    //     name: 'device_serial',
    //     nullable: false,
    //     default: '',
    // })
    // mainDeviceSerial: string;
   
    @OneToOne(()=> UserData, userData => userData.user)
    userData : UserData;

    @OneToOne(()=> MainDevice, mainDevice => mainDevice.user)
    @JoinColumn() 
    mainDevice : MainDevice;  
}

//vartotojo_ID
//vartotojoTipas - nera ir nereikia, nes nera admin
//sodoAdresas : streetAddress, city, state
// prietaiso_ID_Fk