import { Module } from '@nestjs/common';
import { DevicesService } from './services/devices/devices.service';
import { DevicesController } from './controllers/devices/devices.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MainDevice } from 'src/typeorm/MainDevice';
// import { CamerasService } from 'src/cameras/services/cameras/cameras.service';
import { Camera } from 'src/typeorm/Camera';
import { Plant } from 'src/typeorm/Plant';
// import { UsersService } from 'src/users/services/users/users.service';
// import { User } from 'src/typeorm/User';
// import { UserData } from 'src/typeorm/UserData';

@Module({
  imports: [TypeOrmModule.forFeature([MainDevice, Camera, Plant])],
  controllers: [DevicesController],
  providers: [
    {
      provide: "DEVICE_SERVICE",
      useClass: DevicesService,
    },
    // {
    //   provide: "CAMERA_SERVICE",
    //   useClass: CamerasService,
    // },
    //Reikia user service, nes camera naudoju users, o sitas turi camera ?
    // {
    //   provide: "USER_SERVICE",
    //   useClass: UsersService,
    // },
  ]
})
export class DevicesModule {}
