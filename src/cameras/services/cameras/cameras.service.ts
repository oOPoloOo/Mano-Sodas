// import { Inject, Injectable } from '@nestjs/common';
// import { InjectRepository } from '@nestjs/typeorm';
// import { DevicesService } from 'src/devices/services/devices/devices.service';
// // import { CreateDeviceCameraDto } from 'src/devices/dto/CreateDeviceCamera.dto';
// // import { CreateCameraDto } from 'src/cameras/dto/createCamera.dto';
// // import { DevicesService } from 'src/devices/services/devices/devices.service';
// import { Camera, Camera as CameraEntity } from 'src/typeorm/Camera';
// import { Plant as PlantEntity } from 'src/typeorm/Plant';
// import { UsersService } from 'src/users/services/users/users.service';
// // import { UsersService } from 'src/users/services/users/users.service';
// import { Repository } from 'typeorm';

// @Injectable()
// export class CamerasService {
//     constructor(
//         @InjectRepository(CameraEntity) private readonly cameraRepository: Repository<CameraEntity>,
//         @InjectRepository(PlantEntity) private readonly plantRepository: Repository<PlantEntity>,
//         @Inject('DEVICE_SERVICE') private readonly deviceService: DevicesService,
//         ) { }

//         async createCameraPlant(camSerialNumber: string) {
           
//             // const mainDevice = this.devicesService.findDeviceBySerial()
//             const newCamera = this.cameraRepository.create(
//                 {
//                     camSerialNumber: camSerialNumber,
//                 });
//                 // newCamera.mainDevice
//             const savedCamera = await this.cameraRepository.save(newCamera);
    
//             //const password = encodePassword(createUserDto.password);
//             const newPlant = this.plantRepository.create({});
//             //Nes userData turi fk
//             newPlant.camera = newCamera;
//              this.plantRepository.save(newPlant);
//              return savedCamera;
//         }

//         async deleteAllCameras() {

//             const allCameras = await this.cameraRepository.find();
//             // const allUsersId[] = allUsers.map(user => ({ value: user.id}));
//             allCameras.forEach(camera => {
//                 this.cameraRepository.delete(camera);
//             });
//             return allCameras;
//         }

        
//         findAllCmeras() {
//             return this.cameraRepository.find();
//         }

//         //is req asimsiiu user pga pasta, tada surasius main device pagal 
//         //user main device lauka, tada visas jam priklasancias kameras 
        
//         async findAllUserCmeras(deviceSerial: string){

//             const userDevice = await this.deviceService.findDeviceBySerial(deviceSerial);
//             console.log(userDevice);
//         //     let newCameras: Array<Camera> = []; 
            
//         //     for (let camSerial of createDeviceCameraDto.camserialNumber) {
//         //         let camera =  await this.camerasService.createCameraPlant(camSerial); 
//         //        newCameras.push(camera);
//         //    }

//             // return req.json;
//             return userDevice;
//         }

//         // findDeviceBySerial(serial: string) {

//         // return this.deviceRepository.findOne({
//         //     where: {
//         //         serialNumber: serial
//         //     }
//         // });
//     }

//         //Creating multiple camera/plant entities
        

