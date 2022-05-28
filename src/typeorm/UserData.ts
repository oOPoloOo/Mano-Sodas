import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from 'typeorm';
import { User } from './User';
import { Exclude } from 'class-transformer';

//Duomenu bazes klase
//pagal sia klase kuriama db lentele ir keiciamasi duomenimis
@Entity({ name: 'user_data' })
export class UserData {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'userdata_id', // kaip pavadins DB

    })
    id: number;

    @Column({
        name: 'email_address',
        nullable: false,
        default: '',
    })
    emailAddress: string;

    
    @Column({
        nullable: false,
        default: '',
    })   
    password: string;

    // @OneToOne(()=> User) // one directional UserData -> User
    // bidirectional, reikia pridet kreipinei ir i User
    // CASCADE - kai istrinam User issitrina ir UserData laukas
     // JoinColumn -Tell where is realationship id created, now this is Fk key

    @OneToOne(() => User, user => user.userData, { onDelete: 'CASCADE' })   
    @JoinColumn()
    user: User;    
}