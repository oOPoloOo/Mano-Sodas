
//schema of how requst payload is gona look like

import { IsEmail, IsNotEmpty, MinLength } from "class-validator";


export class CreateUserDto{   

    @MinLength(8)
    @IsNotEmpty()
    password: string;

    @IsNotEmpty()
    @IsEmail()  // tikrina ar tinka pasto formata
    emailAddress: string;

    @IsNotEmpty()
    state: string;

    @IsNotEmpty()
    city: string;

    @IsNotEmpty()
    streetAddress: string;
    
    @IsNotEmpty()
    serialNumber: string;

    //vardai neturi sutapti su typeorm/User, bet jei nesutampa neveik?!
}