import { Req, Res, Injectable,Logger } from '@nestjs/common';
// import * as multer from 'multer';
// import * as AWS from 'aws-sdk';
// import * as multerS3 from 'multer-s3';
import { S3 } from 'aws-sdk';




const AWS_S3_BUCKET_NAME = 'mano-sodas-api-dev-serverlessdeploymentbucket-kp1pz0ybch8k';
// const s3 = new AWS.S3();
// AWS.config.update({
//   accessKeyId: 'AKIAUIJZS3SS2LORSWUR',
//   secretAccessKey: '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' ,
// });

@Injectable()
export class FileUploadService {
    constructor() {}

    async upload(file) {
      const { originalname } = file;
      const bucketS3 = AWS_S3_BUCKET_NAME;
      await this.uploadS3(file.buffer, bucketS3, originalname);
  }

  async uploadS3(file, bucket, name) {
      const s3 = this.getS3();
      const params = {        
          Bucket: bucket,
          Key: String(name),
          Body: file,
      };
      return new Promise((resolve, reject) => {
          s3.upload(params, (err, data) => {
          if (err) {
              Logger.error(err);
              reject(err.message);
          }
          resolve(data);
          });
      });
  }

  getS3() {
      return new S3({
          accessKeyId: 'AKIAUIJZS3SS2LORSWUR',
          secretAccessKey: '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',
      });
  }

    ///////////////////////////////////////////

    // async fileupload(@Req() req, @Res() res) {
    //   try {
    //     this.upload(req, res, function(error) {
    //       if (error) {
    //         console.log(error);
    //         return res.status(404).json(`Failed to upload image file: ${error}`);
    //       }
    //       return res.status(201).json(req.files[0].location);
    //     });
    //   } catch (error) {
    //     console.log(error);
    //     return res.status(500).json(`Failed to upload image file: ${error}`);
    //   }
    // }
  
    // upload = multer({
    //   storage: multerS3({
    //     s3: s3,
    //     bucket: AWS_S3_BUCKET_NAME,
    //     acl: 'public-read',
    //     key: function(request, file, cb) {
    //       cb(null, `${Date.now().toString()} - ${file.originalname}`);
    //     },
    //   }),
    // }).array('upload', 1); // failo pavadinimas upload, ikeliamu failu kiekis
}
