import { Inject, Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
// import { CamerasService } from 'src/cameras/services/cameras/cameras.service';
import { CreateDeviceCameraDto } from 'src/devices/dto/CreateDeviceCamera.dto';
// import { Camera } from 'src/typeorm/Camera';
import { MainDevice } from 'src/typeorm/MainDevice';
import { Repository } from 'typeorm';
import { Camera, Camera as CameraEntity } from 'src/typeorm/Camera';
import { Plant as PlantEntity } from 'src/typeorm/Plant';
import { User } from 'src/typeorm/User';

@Injectable()
export class DevicesService {

    constructor(
        @InjectRepository(CameraEntity) private readonly cameraRepository: Repository<CameraEntity>,
        @InjectRepository(PlantEntity) private readonly plantRepository: Repository<PlantEntity>,
        @InjectRepository(MainDevice) private readonly deviceRepository: Repository<MainDevice>,
        // @Inject('CAMERA_SERVICE') private readonly camerasService: CamerasService
    ) { }

    async createDevice(createDeviceCameraDto: CreateDeviceCameraDto) {

        //array of type camera entity
        let newCameras: Array<Camera> = [];

        //Creating multiple camera/plant entities
        for (let camSerial of createDeviceCameraDto.camSerialNumber) {
            let camera = await this.createCameraPlant(camSerial);
            newCameras.push(camera);
        }

        const newDevice = this.deviceRepository.create(
            {
                serialNumber: createDeviceCameraDto.serialNumber,
            });
        newDevice.cameras = newCameras;
        return this.deviceRepository.save(newDevice);
    }

    findDeviceBySerial(serial: string) {

        return this.deviceRepository.findOne({
            where: {
                serialNumber: serial
            }
        });

        // return this.deviceRepository.findOne(v => v.serialNumber == serial)
    }

    findDeviceByUser(userr: User) {

        return this.deviceRepository.findOne({
            where: {
                user: userr
            }
        });
    }

    findAllDevices() {
        return this.deviceRepository.find();
    }

    async deleteAllDevices() {

        const allDevices = await this.deviceRepository.find();
        // const allUsersId[] = allUsers.map(user => ({ value: user.id}));
        allDevices.forEach(device => {
            this.deviceRepository.delete(device);
        });
        return allDevices;
    }

    /////////////////////// CAMERA /////////////////////////////

    async createCameraPlant(camSerialNumber: string) {

        // const mainDevice = this.devicesService.findDeviceBySerial()
        const newCamera = this.cameraRepository.create(
            {
                camSerialNumber: camSerialNumber,
            });
        // newCamera.mainDevice
        const savedCamera = await this.cameraRepository.save(newCamera);

        //const password = encodePassword(createUserDto.password);
        const newPlant = this.plantRepository.create({});
        //Nes userData turi fk
        newPlant.camera = newCamera;
        this.plantRepository.save(newPlant);
        return savedCamera;
    }

    async deleteAllCameras() {

        const allCameras = await this.cameraRepository.find();
        // const allUsersId[] = allUsers.map(user => ({ value: user.id}));
        allCameras.forEach(camera => {
            this.cameraRepository.delete(camera);
        });
        return allCameras;
    }


    findAllCmeras() {
        return this.cameraRepository.find();
    }


    findAllCamerasByDevice(device: MainDevice) {

        return this.cameraRepository.find({
            where: {
                mainDevice: device
            }
        });
    }


    async findAllUserCmerasBySerial(deviceSerial: string) {

        const userDevice = await this.findDeviceBySerial(deviceSerial);
        const allDeviceCameras = await this.findAllCamerasByDevice(userDevice);
        return allDeviceCameras;
    }

    findCameraBySerial(camSerial: string) {

        return this.cameraRepository.findOne({
            where: {
                camSerialNumber: camSerial
            }
        });

        // return this.deviceRepository.findOne(v => v.serialNumber == serial)
    }

    //Dirbu
    async UpdateCameraName(camSerial: string, name: string) {

        const camera = await this.cameraRepository.findOne({
            where: {
                camSerialNumber: camSerial
            }

        });
        camera.camName = name;
        const updatedCam = await this.cameraRepository.save(camera);
        Logger.debug('kamera pervadinta', [updatedCam.camName,
        updatedCam.assigned,
        updatedCam.camSerialNumber]);
        // return this.deviceRepository.findOne(v => v.serialNumber == serial)
    }

    async SetCameraActive(camSerial: string) {

        const camera = await this.cameraRepository.findOne({
            where: {
                camSerialNumber: camSerial
            }

        });
        camera.assigned = true;
        const updatedCam = await this.cameraRepository.save(camera);
        Logger.debug('kamera pervadinta', [updatedCam.camName,
            updatedCam.assigned,
            updatedCam.camSerialNumber]);
        // return this.deviceRepository.findOne(v => v.serialNumber == serial)
    }

    async SetCameraInactive(camSerial: string) {

        const camera = await this.cameraRepository.findOne({
            where: {
                camSerialNumber: camSerial
            }

        });
        camera.assigned = false;
        const updatedCam = await this.cameraRepository.save(camera);
        Logger.debug('kamera pervadinta', [updatedCam.camName,
            updatedCam.assigned,
            updatedCam.camSerialNumber]);
        // return this.deviceRepository.findOne(v => v.serialNumber == serial)
    }


}

