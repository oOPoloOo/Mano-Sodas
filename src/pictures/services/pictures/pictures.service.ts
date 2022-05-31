import { Injectable } from '@nestjs/common';
import { Pictures } from 'src/typeorm/Pictures';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { CreatePictureDto } from 'src/pictures/dto/createPicture.dto';

@Injectable()
export class PicturesService {

    constructor(
        @InjectRepository(Pictures) private readonly pictureRepository: Repository<Pictures>,
        
        // @Inject('CAMERA_SERVICE') private readonly camerasService: CamerasService
    ) { }

    async createPicture(pictureUrl: string, date: string) {

        //array of type camera entity
        

        const newPicture = this.pictureRepository.create(
            {
                 pictureLink: pictureUrl,
                 data: date
            });
            
            console.log('newPicture')
            console.log(newPicture);
        return this.pictureRepository.save(newPicture);
    }
}
