const isValidName = (name: string): boolean => {
    let regex = /^[a-zA-Z\s]+$/;
    return regex.test(name);
};

export default isValidName;