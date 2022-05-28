import { HttpException, HttpStatus } from "@nestjs/common";

export class DeviceAlreadyExists extends HttpException{
    constructor(msg?: string, status?: HttpStatus){
        //galima parametrus perduot paciam arba grazina nustatytus
        super(msg || 'Device already exists!', status || HttpStatus.CONFLICT);
    }
}