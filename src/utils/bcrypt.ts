import * as bcrypt from 'bcrypt';

//galima paciam apsirasyt druska
//const SALT = 10;

export function encodePassword(rawPassword: string) {

    //taip pat galima generuot random
    const SALT = bcrypt.genSaltSync();
    //kai naudoji sync kvieciant nereikia naudot await
    return bcrypt.hashSync(rawPassword, SALT);
}

export function comparePasswords(rawPassword: string, hash: string) {
    return bcrypt.compareSync(rawPassword, hash);
}