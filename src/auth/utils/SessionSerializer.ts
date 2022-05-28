import { Inject } from "@nestjs/common";
import { PassportSerializer } from "@nestjs/passport";
import { UserData } from "src/typeorm/UserData";
import { UsersService } from "src/users/services/users/users.service";

export class SessionSerializer extends PassportSerializer {

    //inject user.service, for getting user
    constructor(
        @Inject('USER_SERVICE') private readonly userService: UsersService
    ) {
        super();
    }

    //done method  - tells how to serialize to db
    serializeUser(userData: UserData, done: (err, user: UserData) => void) {
        console.log('SerializeUser');
        done(null, userData);
    }

    async deserializeUser(userData: UserData, done: (err, userData: UserData) => void) {
        console.log('DeserializeUser');
        //surinda vart pagal db
        const userDB = await this.userService.getUserDataById(userData.id);
        //grazina jei suranda userDB  negrazina klaidos ir grazina userDB
        //Jei suranda grazina null null
        return userDB ? done(null, userDB) : done(null, null);
    }
}

//pridet kaip provideri auth.module klasej
//Klase igalina sessiju veikima su passport