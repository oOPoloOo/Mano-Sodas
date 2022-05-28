import { HttpException, HttpStatus } from "@nestjs/common";

export class UserNotFoundException extends HttpException{
    constructor(msg?: string, status?: HttpStatus){
        //galima parametrus perduot paciam arba grazina nustatytus
        super(msg || 'User not found!', status || HttpStatus.BAD_REQUEST);
    }
}