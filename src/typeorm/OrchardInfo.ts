import { Column, Double, Entity, JoinColumn, OneToOne, PrimaryColumn } from "typeorm";
import { MainDevice } from "./MainDevice";

@Entity({name: 'orchard_info'})
export class OrchardInfo {

    @PrimaryColumn({
        type: 'bigint',
        name: 'info_id',
    })
    id: number;

    @Column({
        nullable: false,       
    })
    temperature: number;

    @Column({
        nullable: false,        
    })
    moisture: number;


    //nezinau ar reikia, gal tiesiog sugeneruot pranesima
    // i pranesimu lentele. kei bus
    // @Column({
    //     name: 'is_frost',
    //     nullable: false,
    //     default: ''
    // })
    // isFrost: boolean;

    @Column({
        name: 'date',
        nullable: false,
        default: '',
    })
    data: string; // paziuret del formato

    //Fk key
    @OneToOne(() => MainDevice, mainDevice => mainDevice.orchardInfo)
    @JoinColumn() 
    mainDevice: MainDevice;


}