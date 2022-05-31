import { Body, Controller, Delete, Inject, Post, Req, UsePipes, ValidationPipe } from '@nestjs/common';
import { CreatePictureDto } from 'src/file_upload/dto/createPicture.dto';
import { PicturesService } from 'src/pictures/services/pictures/pictures.service';
import { DevicesService } from 'src/devices/services/devices/devices.service';
import { Request } from 'express';

@Controller('pictures')
export class PicturesController {

    constructor(
        @Inject('PICTURE_SERVICE')
        private readonly pictureService: PicturesService,
        
        //Camera + Device cervice
        @Inject('DEVICE_SERVICE')
        private readonly DevicesService: DevicesService,

    ) { }



    //Dirbu
    @Post('/getOne')
    async getUnseenPictureByCamera(@Req() req: Request) {

       
        const stringCameraSerialNumber = req.body['camSerialNumber'];
        const camera = await this.DevicesService.findCameraBySerial(stringCameraSerialNumber);

        const pictureLink = this.pictureService.findUnseenPictureByCamera(camera);
        return pictureLink;
    }
}
