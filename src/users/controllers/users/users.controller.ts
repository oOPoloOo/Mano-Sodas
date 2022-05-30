import { Body, ClassSerializerInterceptor, Controller, Delete, Get, Inject, Param, ParseIntPipe, Post, Req, UseGuards, UseInterceptors, UsePipes, ValidationPipe } from '@nestjs/common';
import { AuthenticatedGuard } from 'src/auth/utils/LocalGuard';
import { DevicesService } from 'src/devices/services/devices/devices.service';

import { UserData as UserDataEntity } from 'src/typeorm/UserData';
import { CreateUserDto } from 'src/users/dto/CreateUser.dto';
import { DeviceInUseException } from 'src/users/exceptions/DeviceInUse.exception';
import { DeviceNotFoundException } from 'src/users/exceptions/DeviceNotFound.exception';

import { UserAlreadyExists } from 'src/users/exceptions/UserAlreadyExists.exception';
import { UserNotFoundException } from 'src/users/exceptions/UserNotFound.exception';
import { UsersService } from 'src/users/services/users/users.service';
import { SerializedUserData, UserData } from 'src/users/types';

//Su cloud veikia tik post metodai, juos naudot vietoj get
//IsCloud negrazina cokkies!
@Controller('users')
export class UsersController {
    constructor(
        @Inject('USER_SERVICE')
        private readonly userService: UsersService,
        @Inject('DEVICE_SERVICE')
        private readonly devicesService: DevicesService,
    ) { }

    @Post('create')
    @UsePipes(ValidationPipe)
    async createUser(@Body() createUserDto: CreateUserDto) {

        const userInDB = await this.userService.findUserDataByEmail(createUserDto.emailAddress);
        const deviceInDB = await this.devicesService.findDeviceBySerial(createUserDto.serialNumber);
        const deviceInUse = await this.userService.findUserByDevice(deviceInDB);
         console.log('createUser : deviceInUse');
         console.log(deviceInUse);
        if (!userInDB){
            if(deviceInDB)
            {
                if(!deviceInUse){
                    return this.userService.createUser(createUserDto, deviceInDB);
                } else {
                    throw new DeviceInUseException();
                }
                 
                
            } else {
                throw new DeviceNotFoundException();
            }

            
        } else {
            throw new UserAlreadyExists();
        }       
    }

    //UseGuards - neprisijunges neturi prieigos
    //@UseGuards(AuthenticatedGuard)
    @Post('all')
    getUsers() {
        return this.userService.getUsers();
    }

    // //Neveik - reik userData[] naudot su SerializedUserData?!
    // @Get('data')
    // @UseInterceptors(ClassSerializerInterceptor)
    // async getUsersData() {
    //     const data = await this.userService.getUsersData();
    //    let  dataS :  UserDataEntity[]
    //    dataS.add(data.forEach((value)=>new SerializedUserData(value)));
    //     //console.log(users); 

    //   //  if (users) return {users: users.forEach((value)=>new SerializedUserData(value))};        
    // }

    //Testavimui
    //@UseGuards(AuthenticatedGuard)
    @Post('data')
    @UseInterceptors(ClassSerializerInterceptor)
    async getUsersData() {

        const data = await this.userService.getUsersData();
        return data;
    }


    //@UseGuards(AuthenticatedGuard)
    @Post('data/id/:id')
    @UseInterceptors(ClassSerializerInterceptor)
    async getUserDataById(@Param('id', ParseIntPipe) id: number) {
        const userData = await this.userService.getUserDataById(id);
        console.log(userData);

        if (userData) return new SerializedUserData(userData);
        else {
            throw new UserNotFoundException();

        }

    }

    //@UseGuards(AuthenticatedGuard)
    @Delete('id/:id')
    deleteUserById(@Param('id', ParseIntPipe) id: number) {

        const userForDeletion = this.userService.deleteUserById(id);
        console.log(userForDeletion);
        return userForDeletion;

    }

    //Testavimui
    @Delete('delete/all')
    deleteAllUsers() {
        return this.userService.deleteAllUsers();
    }

    //Dirbu
    @Post('camera/all')
    async getAllUserCamerasByEmail(@Req() req: Request) {

        const stringFromJson = req.body['emailAddress'];
       
        const user = await this.userService.getUserByEmail(stringFromJson);
        const device = await this.userService.getDeviceByUser(user);
        const userCameras = this.devicesService.findAllCamerasByDevice(device);
        return userCameras;
    }
}
