import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { DevicesModule } from './devices/devices.module';
// import { CamerasModule } from './cameras/cameras.module';
 import allEntities from './typeorm';

import { FileUploadModule } from './file_upload/file_upload.module';
import { PicturesModule } from './pictures/pictures.module';


@Module({
  imports: [
    AuthModule,
    TypeOrmModule.forRoot( {
      type: 'mysql',
      host: 'test-db.c4n3sjfqkk3v.eu-north-1.rds.amazonaws.com',
      port: 3306,
      username: 'Polo',
      password: 'Polodb123',
      database: 'mano-sodas-db',
      entities: allEntities,
      synchronize: true,
    }),    
    
    DevicesModule,
    // CamerasModule,
    UsersModule,
    FileUploadModule,
    PicturesModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule { }
