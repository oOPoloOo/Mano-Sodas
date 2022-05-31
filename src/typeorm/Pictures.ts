import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn, OneToMany, ManyToMany, ManyToOne } from 'typeorm';
import { Camera } from './Camera';
// import { Camera } from './Camera';
// import { MainDevice } from './MainDevice';

//Duomenu bazes klase
//pagal sia klase kuriama db lentele ir keiciamasi duomenimis
@Entity({name: 'pictures'})
export class Pictures {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'picture_id', // kaip pavadins DB

    })
    id: number;

    @Column({
        name: 'picture_link',
        nullable: false,
        default: '',
    })
    pictureLink: string;

    @Column({
        name: 'date',
        nullable: false,
        default: '',
    })
    data: string; // paziuret del formato

    @Column()
    camSerialNumber: string;
   
    @Column({
        name: 'is_seen',
        nullable: false,
        default: false,
    })
    isSeen: boolean;

    //Vienas irenginys turi daug kameru
    //kei kamera pasalinama is db pasalinamos ir jos nuotraukos
    @ManyToOne(() => Camera, camera => camera.pictures, {onDelete: 'CASCADE'})
    @JoinColumn()
    camera: Camera;
}