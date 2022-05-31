import { Req, Res, Injectable, Logger, Inject } from '@nestjs/common';
// import * as multer from 'multer';

//Trecias bandymas
import * as AWS from 'aws-sdk';
// import * as multerS3 from 'multer-s3';


//Antras bandymas 
import { S3 } from 'aws-sdk';
import { plainToInstance } from 'class-transformer';
import { FileUploadData } from 'src/file_upload/model/fileUploadInfo';
import { PicturesService } from 'src/pictures/services/pictures/pictures.service';

// @Injectable()
// export class FileData {
//   private _data: S3.ManagedUpload.SendData;

//    getFileDataObject(): FileUploadData {    

//     const jsonData = JSON.stringify(this._data);
//     let dataInstance = plainToInstance(FileUploadData, jsonData);

//     return dataInstance;
//   }

//    setFileData(info : S3.ManagedUpload.SendData) {
//      this._data = info;
//   }
// }

// @Injectable()
// export class FileData {
//   private _data: S3.ManagedUpload.SendData;

//    getFileDataObject(): FileUploadData {    

//     const jsonData = JSON.stringify(this._data);
//     let dataInstance = plainToInstance(FileUploadData, jsonData);

//     return dataInstance;
//   }

//    setFileData(info : S3.ManagedUpload.SendData) {
//      this._data = info;
//   }
// }

//2 bandymas
const AWS_S3_BUCKET_NAME = 'mano-sodas-api-dev-serverlessdeploymentbucket-kp1pz0ybch8k';

@Injectable()
export class FileUploadService {
  constructor(
    @Inject('PICTURE_SERVICE') private readonly pictureService: PicturesService
  ) { }



  AWS_S3_BUCKET = 'mano-sodas-api-dev-serverlessdeploymentbucket-kp1pz0ybch8k';
  s3 = new AWS.S3
    ({
      accessKeyId: 'AKIAUIJZS3SS2LORSWUR',
      secretAccessKey: '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',
    });

  async uploadFile(file) {
    const { originalname } = file;

    await this.s3_upload(file.buffer, this.AWS_S3_BUCKET, originalname, file.mimetype);
  }

  async s3_upload(file, bucket, name, mimetype) {
    const params =
    {
      Bucket: bucket,
      Key: String(name),
      Body: file,
      ACL: "public-read",
      ContentType: mimetype,
      ContentDisposition: "inline",
      CreateBucketConfiguration:
      {
        LocationConstraint: "ap-south-1"
      }
    };

    console.log(params);

    try {

      let s3Response = await this.s3.upload(params).promise().then((data) => {
        // console.log(data.Location) veikia
        //return data.Location; neveikia, negalima cia returnint
        //kviest metoda reik kuris saugo irasa
        this.pictureService.createPicture(data.Location, '2022-05-31');
      })
        .catch(err => console.log(err))

    }
    catch (e) {
      console.log(e);
    }
  }

}









  ///Veikia be response 

  //   async upload(file) {
  //     const { originalname } = file;
  //     const bucketS3 = AWS_S3_BUCKET_NAME;
  //     await this.uploadS3(file.buffer, bucketS3, originalname);
  // }

  // async uploadS3(file, bucket, name) {
  //     const s3 = this.getS3();
  //     const params = {
  //         Bucket: bucket,
  //         Key: String(name),
  //         Body: file,
  //     };
  //     return new Promise((resolve, reject) => {
  //         s3.upload(params, (err, data) => {
  //         if (err) {
  //             Logger.error(err);
  //             reject(err.message);
  //         }
  //         console.log(data);
  //         resolve(data);
  //         });
  //     });
  // }

  // getS3() {
  //     return new S3({
  //         accessKeyId: 'AKIAUIJZS3SS2LORSWUR',
  //         secretAccessKey: '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',
  //     });
  // }




  //  Neveikia
  ///////////////////////////////////////////
  // const AWS_S3_BUCKET_NAME = 'mano-sodas-api-dev-serverlessdeploymentbucket-kp1pz0ybch8k';

  // const s3 = new AWS.S3();
  // AWS.config.update({
  //   accessKeyId: 'AKIAUIJZS3SS2LORSWUR',
  //   secretAccessKey: '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' ,
  // });

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