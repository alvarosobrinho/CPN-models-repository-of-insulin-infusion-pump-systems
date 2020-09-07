Each fold represents a set of evidence related to a set of solutions.

In folder [Model-Checking-Low](https://github.com/alvarosobrinho/mbacpn/tree/master/Evidence-Examples/Model-Checking-Low), the result of the formal verification using ASKCTL of the following property is presented:
    **If the cartridge level is less than the administered insulin dosage, then the state of the pump should be STOP**

In folder [Model-Checking-Zero](https://github.com/alvarosobrinho/mbacpn/tree/master/Evidence-Examples/Model-Checking-Zero), the result of the formal verification using ASKCTL of the following property is presented:
    **If the cartridge level equals 0, then the cartridge status should become EMPTY and the state of the pump should be STOP**

Both properties are checked for standard basal mode and personalized basal mode.