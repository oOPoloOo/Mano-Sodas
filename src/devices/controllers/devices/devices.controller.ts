import { Body, Controller, Delete, Inject, Post, Req, UsePipes, ValidationPipe } from '@nestjs/common';
// import { CamerasService } from 'src/cameras/services/cameras/cameras.service';
import { CreateDeviceCameraDto } from 'src/devices/dto/CreateDeviceCamera.dto';
import { DeviceAlreadyExists } from 'src/devices/exceptions/DeviceAlreadyExists.exception';
import { DevicesService } from 'src/devices/services/devices/devices.service';
import { Request } from 'express';

@Controller('device')
export class DevicesController {

    constructor(
        @Inject('DEVICE_SERVICE')
        private readonly deviceService: DevicesService,
        // @Inject('CAMERA_SERVICE')
        // private readonly camerasService: CamerasService,
    ) { }

    @Post('create')
    @UsePipes(ValidationPipe)
    async createDevice(@Body() createDeviceCameraDto: CreateDeviceCameraDto) {

        const deviceInDB = await this.deviceService.findDeviceBySerial(createDeviceCameraDto.serialNumber);

        if (!deviceInDB) {
            return this.deviceService.createDevice(createDeviceCameraDto);
        } else {
            throw new DeviceAlreadyExists();
        }
    }


    @Post('all')
    getAllDevices() {
        return this.deviceService.findAllDevices();
    }

    //Testavimui
    @Delete('delete/all')
    deleteAllDevices() {
        return this.deviceService.deleteAllDevices();
    }

    /////////// CAMERA ///////////////////

    @Delete('camera/delete/all')
    deleteAllCameras() {
        return this.deviceService.deleteAllCameras();
    }

    @Post('camera/all')
    getAllCameras() {
        return this.deviceService.findAllCmeras();
    }

    @Post('camera/all/user/serial')
    getAllUserCamerasBySerial(@Req() req: Request) {

        const stringFromJson = req.body['serialNumber'];
        const userDeviceCameras = this.deviceService.findAllUserCmeras(stringFromJson);
        return userDeviceCameras;
    }
    
}
