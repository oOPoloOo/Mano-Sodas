import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn, OneToMany, ManyToMany, ManyToOne } from 'typeorm';
import { Camera } from './Camera';
// import { Camera } from './Camera';
// import { MainDevice } from './MainDevice';


export enum PlantType {
    APPLE = 'Obelis',
    PLUM = 'Slyva',
    PEAR = 'Kriause',
    CHERRY = 'Vysnia'
  }

  export enum VegetationStage {
    SLEEPINGBUDS = 'Neprabude_Pumpurai',
    WAKINGBUDS = 'Kraunasi_Ziedai',
    AFTERBLOOMING = 'Baigesi_Zydejimas',
    BEGGININGOFFRUITS =  'Uzmegsti_Vaisiai',
    GROWNFRUITS =  'Uzauge_Vaisiai',
    RIPEFRUITS =  'Sunoke_Vaisiai',
  }

//Duomenu bazes klase
//pagal sia klase kuriama db lentele ir keiciamasi duomenimis
@Entity({ name: 'plant' })
export class Plant {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'plant_id', // kaip pavadins DB
    })
    id: number;

    //Enum pasiziuret, kaip daryt
    @Column({
        type: 'enum',
        enum: PlantType,
        nullable: false,
        default: PlantType.APPLE,
    })
    plantType: PlantType;

    //Enum pasiziuret, kaip daryt
    @Column({
        type: 'enum',
        enum: VegetationStage,
        nullable: false,
        default: VegetationStage.AFTERBLOOMING,
    })
    vegetationStage: VegetationStage; 


    //Sito nereik, nes ta nusako Vegetation stage
    // @Column({
    //     name: 'is_ripe',
    //     nullable: false,
    //     default: false,
    // })
    // isRipe: boolean;

    
    // //kei kamera pasalinama is db pasalinamos ir jos stebimu augalu duom
    @OneToOne(() => Camera, camera => camera.plant, { onDelete: 'CASCADE' })
    @JoinColumn()
    camera: Camera;


}

