import { HttpException, HttpStatus } from "@nestjs/common";

export class DeviceInUseException extends HttpException{
    constructor(msg?: string, status?: HttpStatus){
        //galima parametrus perduot paciam arba grazina nustatytus
        super(msg || 'Other user already using device!', status || HttpStatus.BAD_REQUEST);
    }
}