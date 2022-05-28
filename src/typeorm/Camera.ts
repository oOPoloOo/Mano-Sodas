import{ Entity, PrimaryGeneratedColumn,Column, OneToOne, JoinColumn, ManyToOne, OneToMany} from 'typeorm';
import { MainDevice } from './MainDevice';
import { Pictures } from './Pictures';
import { Plant } from './Plant';


//Duomenu bazes klase
//pagal sia klase kuriama db lentele ir keiciamasi duomenimis
@Entity({name: 'camera'})
export class Camera {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'camera_id', // kaip pavadins DB
    })
    id: number;  
    
    @Column()
    camSerialNumber: string;

    @Column({        
        nullable: false,
        default: false,
    })
    assigned: boolean;

    //NZN as reik!
    // @Column({        
    //     nullable: false,
    //     default: '',
    // })
    // name: string;
    
     // jei istrina pagrindini prietaisa kameras palikt nepriskirtas
    @ManyToOne(()=> MainDevice, mainDevice => mainDevice.cameras, {onDelete: 'SET NULL'})
    @JoinColumn() // fk key
    mainDevice : MainDevice;  

    @OneToMany(()=> Pictures, pictures => pictures.camera)     
    pictures : Pictures[];  

    //Viena kamera turi viena stebima augala
    @OneToOne(() => Plant, plant => plant.camera )
    plant: Plant;
}


//Prototipe nubus atskiru kameru
