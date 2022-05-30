import { Inject, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { relative } from 'path';
// import { Camera as CameraEntity } from 'src/typeorm/Camera';
// import { MainDevice as MainDeviceEntity } from 'src/typeorm/MainDevice';
import { User as UserEntity } from 'src/typeorm/User';
import { UserData, UserData as UserDataEntity } from 'src/typeorm/UserData';
import { Repository } from 'typeorm';
import { CreateUserDto } from 'src/users/dto/CreateUser.dto';
import { encodePassword } from 'src/utils/bcrypt';
import { DevicesService } from 'src/devices/services/devices/devices.service';
import { MainDevice } from 'src/typeorm/MainDevice';
// import { SerializedUserData, UserData } from 'src/users/types';

@Injectable()
export class UsersService {
    constructor(
        @InjectRepository(UserEntity) private readonly userRepository: Repository<UserEntity>,
        @InjectRepository(UserDataEntity) private readonly userDataRepository: Repository<UserDataEntity>,
        // @Inject('DEVICE_SERVICE') private readonly devicesService: DevicesService
    ) { }




    async createUser(createUserDto: CreateUserDto, mainDevice: MainDevice) {


        const newUser = this.userRepository.create(
            {
                state: createUserDto.state,
                city: createUserDto.city,
                streetAddress: createUserDto.streetAddress,
                mainDevice: mainDevice,
            });
        await this.userRepository.save(newUser);

        const password = encodePassword(createUserDto.password);
        const newUserData = this.userDataRepository.create(
            {
                emailAddress: createUserDto.emailAddress,
                password: password,
            });
        //Nes userData turi fk
        newUserData.user = newUser;
        return this.userDataRepository.save(newUserData);
    }

    getUsers() {
        return this.userRepository.find();
    }


    async getUserByEmail(email: string) {
        const userDataa = await this.findUserDataByEmail(email);

        return this.userRepository.findOne({
            where: {
                userData: userDataa
            }
        });
    }


    findUserByDevice(device: MainDevice) {
        return this.userRepository.findOne({
            where: {
                mainDevice: device,
            }
        });
    }

    deleteUserById(id: number) {
        return this.userRepository.delete(id);
    }

    async deleteAllUsers() {

        const allUsers = await this.userRepository.find();
        // const allUsersId[] = allUsers.map(user => ({ value: user.id}));
        allUsers.forEach(user => {
            this.userRepository.delete(user);
        });
        return allUsers;
    }

    /////////// Device ///////////////

   
    // async getDeviceByUser(userr: UserEntity) {
    //     const device = await this.devicesService.findDeviceByUser(userr);

    //     return device;
    // }

    /////////////// User data ////////////////////

    findUserDataByEmail(email: string) {
        return this.userDataRepository.findOne({
            where: {
                emailAddress: email
            }
        });
    }

    getUsersData() {

        return this.userDataRepository.find();
    }

    getUserDataById(id: number) {

        const userData = this.userDataRepository.findOne({
            where: {
                id: id
            }
        });
        return userData;
    }

    ////Testiniai sketch apacioj

    //never do in real app
    // async onetoOne_toDb() {
    //     const user = this.userRepository.create({
    //         state: 'Lietuva',
    //         city: 'Kaunas',
    //         streetAddress: 'Gatve 123',
    //     });
    //     await this.userRepository.save(user); // issaugo i db

    //     const userData = this.userDataRepository.create(
    //         {
    //             emailAddress: 'user@gmail.com',
    //             password: '123',
    //         });

    //     //Sulinkinu user su userData 
    //     //per userData.user lauka
    //     userData.user = user;
    //     //issaugau userData i db
    //     await this.userDataRepository.save(userData);
    // }

    // async oneToMany_toDB() {
    //     //#1
    //     //vienas prietaisas turi daug kameru
    //     const mainDev = this.mainDeviceRepository.create();

    //     const cam1 = this.cameraRepository.create();
    //     const cam2 = this.cameraRepository.create();
    //     const cam3 = this.cameraRepository.create();

    //     //priskiriu kameras
    //     mainDev.cameras = [cam1, cam2, cam3];

    //     //issaugau prietaisa i DB
    //     await this.mainDeviceRepository.save(mainDev);

    //     //#2
    //     //Pridedu prie jau esanciu objektu
    //     const mainDev2 = this.mainDeviceRepository.create();
    //     await this.mainDeviceRepository.save(mainDev2);

    //     const cam4 = this.cameraRepository.create({ mainDevice: mainDev2 });
    //     await this.cameraRepository.save(cam4);
    //     const cam5 = this.cameraRepository.create({ mainDevice: mainDev2 });
    //     await this.cameraRepository.save(cam5);
    //     const cam6 = this.cameraRepository.create({ mainDevice: mainDev2 });
    //     await this.cameraRepository.save(cam6);
    // }

    // async oneToMany_fromDB() {

    //     //get mainDevice with all cameras
    //     const deviceAndCameras = await this.mainDeviceRepository.find({ relations: ["cameras"] });

    //     //get camera and device it belengs to
    //     //["mainDevice", "kazkas", "kazkas"] - galima pridet kiek nori traukiamu duomenu is susijusiu lenteliu
    //     const cameraAndDevice = await this.cameraRepository.find({ relations: ["mainDevice"] });
    // }
}
