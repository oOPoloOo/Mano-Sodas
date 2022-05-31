
import { Controller, Post, Req, Res, UseInterceptors, UploadedFile, Inject } from '@nestjs/common';
import {  FileUploadService } from 'src/file_upload/services/fileupload/fileupload.service';
import { Request, Response,Express } from 'express';
import { FileInterceptor } from '@nestjs/platform-express';
import { FileUploadData } from 'src/file_upload/model/fileUploadInfo';
import { plainToClass, plainToInstance } from 'class-transformer';

@Controller('fileupload')
export class FileUploadController {
  constructor(
    @Inject('UPLOAD_SERVICE')
    private readonly uploadService: FileUploadService
  ) { }


  // @Post()
  // async create(@Req() request: Request, @Res() response: Response) {
  //   try {
  //     await this.fileUploadService.fileupload(request, response);
  //   } catch (error) {
  //     return response
  //       .status(500)
  //       .json(`Failed to upload image file: ${error.message}`);
  //   }
  // }

  @Post('upload')
  //Parametro pavadinimas, kuris kaiko nuotrauka - file
  @UseInterceptors(FileInterceptor('file'))
  async upload(@UploadedFile() file /*file: Express.Multer.File*/) {
    
    let fileUrlLocation = await this.uploadService.uploadFile(file)
   
    //let reaponseData =  this.fileData.getFileDataObject();
     

    //  console.log('fileUrlLocation');
    //  console.log(reaponseData.Location);
    //  console.log('reaponseData:');
    //  console.log(reaponseData);
    //  console.log('readableData');
    // console.log(jsonData);
    //const imgLocation = reaponseData;
    //return reaponseData;
    // let imageUrl = await this.fileUploadService.uploadFile(file);
   // const imageURL =  imageLocationInfo['Bucket']; taip neveik 
   //const imageURL =  imageLocationInfo.valueOf('');
    // console.log(imageUrl);
    //console.log(imageURL);

    // const imgLocation = reaponseData;
    // return reaponseData;
  }

}
