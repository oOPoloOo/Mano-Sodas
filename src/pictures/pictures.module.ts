import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DevicesService } from 'src/devices/services/devices/devices.service';
import { Camera } from 'src/typeorm/Camera';
import { MainDevice } from 'src/typeorm/MainDevice';
import { Pictures } from 'src/typeorm/Pictures';
import { Plant } from 'src/typeorm/Plant';
import { PicturesController } from './controller/pictures/pictures.controller';
import { PicturesService } from './services/pictures/pictures.service';

@Module({
  imports: [TypeOrmModule.forFeature([Pictures,MainDevice, Camera, Plant])],
  controllers: [PicturesController],
  providers: [
    {
      provide: "DEVICE_SERVICE",
      useClass: DevicesService,
    },
    {
      provide: "PICTURE_SERVICE",
      useClass: PicturesService,
    }]
})
export class PicturesModule { }
