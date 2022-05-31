import { Body, Controller, Delete, Inject, Post, Req, UsePipes, ValidationPipe } from '@nestjs/common';
import { CreatePictureDto } from 'src/pictures/dto/createPicture.dto';
import { PicturesService } from 'src/pictures/services/pictures/pictures.service';

@Controller('pictures')
export class PicturesController {

    constructor(
        @Inject('PICTURE_SERVICE')
        private readonly pictureService: PicturesService,

    ) { }

    //@Post('create')
    //@UsePipes(ValidationPipe)
    // async createDevice() {

    //     //return this.pictureService.createPicture( pictureUrl: string, date: string);

    // }
}
