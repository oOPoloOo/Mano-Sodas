import { HttpException, HttpStatus } from "@nestjs/common";

export class DeviceNotFoundException extends HttpException{
    constructor(msg?: string, status?: HttpStatus){
        //galima parametrus perduot paciam arba grazina nustatytus
        super(msg || 'Device not found!', status || HttpStatus.BAD_REQUEST);
    }
}