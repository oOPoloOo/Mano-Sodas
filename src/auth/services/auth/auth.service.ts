import { Inject, Injectable, UsePipes, ValidationPipe } from '@nestjs/common';
import { PasswordsNotMatchException } from 'src/auth/exceptions/PasswordsNotMatch.exception';
import { CreateUserDto } from 'src/users/dto/CreateUser.dto';
import { UsersService } from 'src/users/services/users/users.service';
import { comparePasswords } from 'src/utils/bcrypt';

@Injectable()
export class AuthService {

    //inject user service, kad gauciau prieiga prie naudotoju
    // kad ta padaryt reikia importuot users i auth.module
    constructor(@Inject('USER_SERVICE') private readonly userService: UsersService) {

    }

    //Login
    async validateUser(email: string, password: string) {

        const userInDB = await this.userService.findUserDataByEmail(email);
        console.log('inside validateUser : auth.services');
        //Jei user yra rastas DB, tikrina slaptazodi
        if (userInDB) {

            //lygina slaptazodi su hash slapt in DB
            const matched = comparePasswords(password, userInDB.password);

            if (matched) {
                console.log('User validation success');
                return userInDB;
            } else {
                console.log('Passwords do not match')

                throw new PasswordsNotMatchException();

            }

        }
        console.log('User validation faild');
        return null;
    }
}