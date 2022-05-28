import { Exclude } from 'class-transformer';
import { User } from 'src/typeorm/User';

export interface UserData {
    id: number;
    emailAddress: string;
    password: string;


}

//serializations - preventing 
//passwords to be sent as a response
export class SerializedUserData {
    id: number;

    emailAddress: string;

    //issima is grazinamu
    @Exclude()
    password: string;


    constructor(partial: Partial<SerializedUserData>) {
        Object.assign(this, partial);
    }    
}