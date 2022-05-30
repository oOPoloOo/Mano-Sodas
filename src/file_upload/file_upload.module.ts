import { Module } from '@nestjs/common';
import { FileUploadController } from './controllers/fileupload/fileupload.controller';
import { FileUploadService } from './services/fileupload/fileupload.service';

@Module({
  controllers: [FileUploadController],
  providers: [FileUploadService]
})
export class FileUploadModule {}
