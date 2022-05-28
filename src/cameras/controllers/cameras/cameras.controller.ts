// import { Body, Controller, Delete, Inject, Post, Req, UsePipes, ValidationPipe } from '@nestjs/common';
// // import { CreateCameraDto } from 'src/cameras/dto/createCamera.dto';
// import { CamerasService } from 'src/cameras/services/cameras/cameras.service';
// import { Request } from 'express';
// // import { UsersService } from 'src/users/services/users/users.service';
// // import { DevicesService } from 'src/devices/services/devices/devices.service';

// @Controller('cameras')
// export class CamerasController {
//     constructor(
//         @Inject('CAMERA_SERVICE')
//         private readonly camerasService: CamerasService,
//         // @Inject('USER_SERVICE')
//         // private readonly usersService: UsersService,
//     ) { }

//     // @Post('create')
//     // @UsePipes(ValidationPipe)
//     // async createUser(@Body() createCameraDto: CreateCameraDto) {

//     //    // const cameraInDB = await this.createCameraDto.findCameraByID(createCameraDto.plantType);
//     //     // if (!cameraInDB){
//     //     //     return this.camerasService.createCamera(createCameraDto);
//     //     // } else {
//     //     //     throw new UserAlreadyExists();
//     //     // }       
//     //     return this.camerasService.createCameraPlant(createCameraDto);
//     // }

//     @Delete('delete/all')
//     deleteAllCameras() {
//         return this.camerasService.deleteAllCameras();
//     }

//     @Post('all')
//     getAllCameras() {
//         return this.camerasService.findAllCmeras();
//     }

//     @Post('all/user')
//     getAllUserCameras(@Req() req: Request) {
//         //var objJson1 = JSON.parse(JSON.stringify(req)); // siti du var neveik, nes req.body jau yra json
//         //var objJson1 = JSON.parse(req.body); 
//         var objJson1 = req.body;
//         const userDevice = this.camerasService.findAllUserCmeras(objJson1['serialNumber']);
//         console.log("inside all/user controller");
     
//        // return camerasUser;
//        return userDevice;

//     }


// }
