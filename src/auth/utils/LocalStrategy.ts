import { Inject, Injectable, UnauthorizedException, UsePipes, ValidationPipe } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { Strategy } from "passport-local";
import { CreateUserDto } from "src/users/dto/CreateUser.dto";
import { AuthService } from "../services/auth/auth.service";

//
@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {

    //Naudojamas AUTH_SERVICE tagas, o ne pati klase
    constructor(@Inject('AUTH_SERVICE') private readonly authService: AuthService) {
       
       // super();
       
       //Galima persivadint username ir kitus laukus
       //Dabar ieskos email json pakete (postman) [ir kode?]
       //pasiziuret parametrus desinys peles:
       //-> Strategy -> IStrategyOptiosWithRequestInterface
       super(
           {
               usernameField: 'emailAddress', // will look for email inside the request body
           }
       );
    }

     async validate(email: string, password: string) { //ORGINALAS
       // async validate(createUserDto: CreateUserDto) { taip meta serverio klaida 500
        console.log('local str validate');
        console.log(email);
        console.log(password);
         const userData = await this.authService.validateUser(email, password);
        //const userData = await this.authService.validateUser(createUserDto);


        if (!userData) { 
            throw new UnauthorizedException();
        }
        return userData;

    }   
    
}