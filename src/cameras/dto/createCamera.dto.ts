
// //schema of how requst payload is gona look like

// import { IsEmail, IsEnum, IsNotEmpty, MinLength } from "class-validator";

// export enum PlantType {
//     APPLE = 'Obelis',
//     PLUM = 'Slyva',
//     PEAR = 'Kriause',
//     CHERRY = 'Vysnia'
//   }
//   export enum VegetationStage {
//     SLEEPINGBUDS = 'Neprabude_Pumpurai',
//     WAKINGBUDS = 'Kraunasi_Ziedai',
//     AFTERBLOOMING = 'Baigesi_Zydejimas',
//     BEGGININGOFFRUITS =  'Uzmegsti_Vaisiai',
//     GROWNFRUITS =  'Uzauge_Vaisiai',
//     RIPEFRUITS =  'Sunoke_Vaisiai',
//   }

// export class CreateCameraDto{   

    
//     @IsNotEmpty()
//     assigned: boolean;

//     @IsEnum(PlantType)
//     @IsNotEmpty()
//      // tikrina ar tinka pasto formata
//     plantType: PlantType;

//     @IsEnum(VegetationStage)
//     @IsNotEmpty()
//     vegetationStage: VegetationStage;

//     @IsNotEmpty()
//     serialNumber: string;
   

//     //vardai neturi sutapti su typeorm/User, bet jei nesutampa neveik?!
// }
