import { HttpException, HttpStatus } from "@nestjs/common";

export class UserAlreadyExists extends HttpException{
    constructor(msg?: string, status?: HttpStatus){
        //galima parametrus perduot paciam arba grazina nustatytus
        super(msg || 'User already exists!', status || HttpStatus.CONFLICT);
    }
}