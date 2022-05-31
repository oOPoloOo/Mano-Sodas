import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Pictures } from 'src/typeorm/Pictures';
import { PicturesController } from './controller/pictures/pictures.controller';
import { PicturesService } from './services/pictures/pictures.service';

@Module({
  imports: [TypeOrmModule.forFeature([Pictures])],
  controllers: [PicturesController],
  providers: [
    {
      provide: "PICTURE_SERVICE",
      useClass: PicturesService,
    }]
})
export class PicturesModule { }
