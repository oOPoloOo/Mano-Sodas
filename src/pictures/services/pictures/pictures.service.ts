import { Inject, Injectable } from '@nestjs/common';
import { Pictures } from 'src/typeorm/Pictures';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { CreatePictureDto } from 'src/file_upload/dto/createPicture.dto';
import { Camera } from 'src/typeorm/Camera';
import { DevicesService } from 'src/devices/services/devices/devices.service';

@Injectable()
export class PicturesService {

    constructor(
        @InjectRepository(Pictures) private readonly pictureRepository: Repository<Pictures>,

        @Inject('DEVICE_SERVICE') private readonly devicesService: DevicesService
    ) { }

    async createPicture(createPictureDto: CreatePictureDto, pictureUrl: string, datee: string) {
      
        const camera = await this.devicesService.findCameraBySerial(createPictureDto.camSerialNumber);

        const newPicture = this.pictureRepository.create(
            {
                pictureLink: pictureUrl,
                data: datee,
                camSerialNumber: createPictureDto.camSerialNumber
            });

            newPicture.camera = camera;

        console.log('newPicture')
        console.log(newPicture);
        return this.pictureRepository.save(newPicture);
    }

    findUnseenPictureByCamera(cameraa: Camera) {

        return this.pictureRepository.findOneOrFail({
            where: {
                camera: cameraa,
                isSeen: false
            }
        });
    }
}
