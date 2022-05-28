import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn, OneToMany, PrimaryColumn } from 'typeorm';
import { User } from './User';


import { OrchardInfo } from './OrchardInfo';

import { Camera } from './Camera';

//Duomenu bazes klase
//pagal sia klase kuriama db lentele ir keiciamasi duomenimis
@Entity({name: 'main_device'})
export class MainDevice {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'maindevice_id', // kaip pavadins DB
    })
    device_Id: number;

    @Column()
    serialNumber: string;

    @OneToOne(() => User, user => user.mainDevice)                                 
    user: User;

    @OneToOne(() => OrchardInfo, orchardInfo => orchardInfo.mainDevice)
    orchardInfo: OrchardInfo;

    //Vienas irenginys,  turi daug kameru
    @OneToMany(() => Camera, cameras => cameras.mainDevice)
    cameras: Camera[];


    // //Viena kamera turi viena stebima augala
    // @OneToOne(() => Plant, plant => plant.mainDevice )
    // plant: Plant;

    // //Vienas irenginys, kuris yra kamera turi daug nuotrauku
    // @OneToMany(() => Pictures, pictures => pictures.mainDevice)
    // pictures: Pictures[];
}
