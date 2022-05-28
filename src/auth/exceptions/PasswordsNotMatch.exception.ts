import { HttpException, HttpStatus } from "@nestjs/common";

export class PasswordsNotMatchException extends HttpException{
    constructor(msg?: string, status?: HttpStatus){
        //galima parametrus perduot paciam arba grazina nustatytus
        super(msg || 'Passwords do not match!', status || HttpStatus.BAD_REQUEST);
    }
}