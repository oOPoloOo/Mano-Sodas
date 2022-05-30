
import { Controller, Post, Req, Res, UseInterceptors, UploadedFile } from '@nestjs/common';
import { FileUploadService } from 'src/file_upload/services/fileupload/fileupload.service';
import { Request, Response,Express } from 'express';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller('fileupload')
export class FileUploadController {
  constructor(private readonly fileUploadService: FileUploadService) { }

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
    
    
    let reaponseData = await this.fileUploadService.uploadFile(file)
    const imgLocation = reaponseData;
    return reaponseData;
  }

}
