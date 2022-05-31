import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PicturesService } from 'src/pictures/services/pictures/pictures.service';
import { Pictures } from 'src/typeorm/Pictures';
import { FileUploadController } from './controllers/fileupload/fileupload.controller';
import {  FileUploadService } from './services/fileupload/fileupload.service';

@Module({
  imports: [TypeOrmModule.forFeature([Pictures])],
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
   ]
})
export class FileUploadModule {}
