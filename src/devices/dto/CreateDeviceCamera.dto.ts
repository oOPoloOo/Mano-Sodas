
//schema of how requst payload is gona look like

import { IsNotEmpty, MinLength } from "class-validator";


export class CreateDeviceCameraDto{       
   
    // @MinLength(6)
    @IsNotEmpty()
    serialNumber: string;

    @IsNotEmpty()
    camSerialNumber: string[];

    //vardai neturi sutapti su typeorm/User, bet jei nesutampa neveik?!
}