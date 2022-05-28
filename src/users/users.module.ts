import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
// import { CamerasService } from 'src/cameras/services/cameras/cameras.service';
import { DevicesService } from 'src/devices/services/devices/devices.service';
import { Camera } from 'src/typeorm/Camera';
import { MainDevice } from 'src/typeorm/MainDevice';
import { Plant } from 'src/typeorm/Plant';
// import { Camera } from 'src/typeorm/Camera';
// import { MainDevice } from 'src/typeorm/MainDevice';
import { User } from 'src/typeorm/User';
import { UserData } from 'src/typeorm/UserData';
import { UsersController } from './controllers/users/users.controller';
import { UsersService } from './services/users/users.service';


@Module({
  imports: [TypeOrmModule.forFeature([User, UserData,MainDevice, Camera, Plant])],
  controllers: [UsersController],
  providers: [
    {
      provide: "USER_SERVICE",
      useClass: UsersService,
    },
    {
      provide: "DEVICE_SERVICE",
      useClass: DevicesService,
    },
    //Reikia inoortint ir camera service, nes device turi camera service ?
    // {
    //   provide: "CAMERA_SERVICE",
    //   useClass: CamerasService,
    // },  
  ]
})
export class UsersModule { }
