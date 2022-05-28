// import { Module } from '@nestjs/common';
// import { CamerasController } from './controllers/cameras/cameras.controller';
// import { CamerasService } from './services/cameras/cameras.service';
// import { TypeOrmModule } from '@nestjs/typeorm';
// import { Camera } from 'src/typeorm/Camera';
// import { Plant } from 'src/typeorm/Plant';
// import { UsersService } from 'src/users/services/users/users.service';
// import { User } from 'src/typeorm/User';
// import { UserData } from 'src/typeorm/UserData';
// import { MainDevice } from 'src/typeorm/MainDevice';
// import { DevicesService } from 'src/devices/services/devices/devices.service';
// import { OrchardInfo } from 'src/typeorm/OrchardInfo';



// @Module({
//   imports: [TypeOrmModule.forFeature([Camera,MainDevice, Plant])],
//   controllers: [CamerasController],
//   providers: [
//     {
//       provide: "CAMERA_SERVICE",
//       useClass: CamerasService,
//     },  
//     // {
//     //   provide: "USER_SERVICE",
//     //   useClass: UsersService,
//     // },
//     {
//       provide: "DEVICE_SERVICE",
//       useClass: DevicesService,
//     },
//   ]
// })
// export class CamerasModule {}
