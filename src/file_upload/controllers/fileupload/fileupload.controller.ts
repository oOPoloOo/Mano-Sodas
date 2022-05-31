
import { Controller, Post, Req, Res, UseInterceptors, UploadedFile, Inject, Body, UsePipes, ValidationPipe } from '@nestjs/common';
import { FileUploadService } from 'src/file_upload/services/fileupload/fileupload.service';
import { Request, Response, Express } from 'express';
import { FileInterceptor } from '@nestjs/platform-express';
import { FileUploadData } from 'src/file_upload/model/fileUploadInfo';
import { plainToClass, plainToInstance } from 'class-transformer';
import { CreatePictureDto } from 'src/file_upload/dto/createPicture.dto';

@Controller('fileupload')
export class FileUploadController {
  constructor(
    @Inject('UPLOAD_SERVICE')
    private readonly uploadService: FileUploadService
  ) { }


// vsrtotojas pildo tik cameraSerialNumber
  @Post('upload')
  //Parametro pavadinimas, kuris kaiko nuotrauka - file
  @UsePipes(ValidationPipe)
  @UseInterceptors(FileInterceptor('file'))
  async upload(@UploadedFile() file, @Body() createPictureDto: CreatePictureDto/*file: Express.Multer.File*/) {

    this.uploadService.uploadFile(file, createPictureDto)

    //  console.log('reaponseData:');
    //  console.log(reaponseData);

  }

}
