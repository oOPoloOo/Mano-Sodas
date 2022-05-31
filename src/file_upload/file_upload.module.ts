import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DevicesService } from 'src/devices/services/devices/devices.service';
import { PicturesService } from 'src/pictures/services/pictures/pictures.service';
import { Camera } from 'src/typeorm/Camera';
import { MainDevice } from 'src/typeorm/MainDevice';
import { Pictures } from 'src/typeorm/Pictures';
import { Plant } from 'src/typeorm/Plant';
import { FileUploadController } from './controllers/fileupload/fileupload.controller';
import {  FileUploadService } from './services/fileupload/fileupload.service';

@Module({
  imports: [TypeOrmModule.forFeature([Pictures,MainDevice, Camera, Plant])],
  controllers: [FileUploadController],
  providers: [
    {
      provide: "UPLOAD_SERVICE",
      useClass: FileUploadService,
    },
    {
      provide: "PICTURE_SERVICE",
      useClass: PicturesService,
    },
    {
      provide: "DEVICE_SERVICE",
      useClass: DevicesService,
    }
   ]
})
export class FileUploadModule {}
