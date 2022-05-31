import { IsNotEmpty, MinLength } from "class-validator";


export class CreatePictureDto{       
   
    // @MinLength(6)
//    // @IsNotEmpty()
//     pictureLink: string;

//     //@IsNotEmpty()
//     data: string;
    
    @IsNotEmpty()
    camSerialNumber: string;
    //vardai neturi sutapti su typeorm/User, bet jei nesutampa neveik?!
}