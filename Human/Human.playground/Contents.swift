
//00SuperClass
class BodyPart
{
    let infected: Bool
    let vascularized: String
    let hairy: Bool
        
    init(infected: Bool, vascularized: String, hairy: Bool)
    {
        self.infected = infected
        self.vascularized = vascularized
        self.hairy = hairy
    }
    
    func moves()
    {
    }
    func sustainsLife()
    {
    }
    func attractsTheLadies()
    {
    }
}


//Subclasses
//01
class Leg : BodyPart
{
    let bony: String
    let fatty: String
    let fake: Bool
    
    init(bony: String, fatty: String, fake: Bool)
    {
        self.bony = bony
        self.fatty = fatty
        self.fake = fake
    }
    func enablesWalking()
    {
    }
    func kicks()
    {
    }
    func jumps()
    {
    }
}
    

    //02
    class Knee : Leg
    {
        var isBroken: String
        let isMissing: Bool
        let hadSurgery: String
    
    init(isBroken: String, isMissing: Bool, hadSurgery: String)
        {
        self.isBroken = isBroken
        self.isMissing = isMissing
        self.hadSurgery = hadSurgery
        }
        
        func blocksArrows()
        {
        }
        func breaksOften()
        {
        }
        func usedForKneeling()
        {
        }
    }


    //03
    class Foot : Leg
    {
        var isBroken: String
        let isMissing: Bool
        let hadSurgery: String
        
        init(isBroken: String, isMissing: Bool, hadSurgery: String)
        {
            self.isBroken = isBroken
            self.isMissing = isMissing
            self.hadSurgery = hadSurgery
        }
        
        func stands()
        {
        }
        func tickles()
        {
        }
        func smells()
        {
        }
    }
    
        //04
        class Toes : Foot
        {
            let nails = 5
            var fungi = 1
            var stubbed = 0
            
            func balance()
            {
            }
            func pushGround()
            {
            }
            func temporarilyIncreaseHeight()
            {
            }
        }
    
    
//05
class Arms : BodyPart
{
    let elbow = 2
    let hands = 2
    let finger = 10
    
    func holdThings()
    {
    }
    func poke()
    {
    }
    func grab()
    {
    }
}

    
//06
class Face : BodyPart
{
    let ears = 2
    let nose = 1
    let eyes = 2
    
    func seeThings()
    {
    }
    func smellThings()
    {
    }
    func hearThings()
    {
    }
}


//07
class Heart : BodyPart
{
    let superiorVenaCava = 1
    let aorta = 1
    let pulmonaryArtery = 1
    
    func pumpBlood()
    {
    }
    func suppliesHeat()
    {
    }
    func suppliesOxygen()
    {
    }
}

    
//08
class Brain : BodyPart
{
    let frontalLobe = 1
    let parietalLobe = 1
    let occipitalLobe = 1
    
    func thinking()
    {
    }
    func memory()
    {
    }
    func imageProcessing()
    {
    }
}

    
//09
class Neuron : BodyPart
{
    let synapse = 1
    let dendrites: Double
    let nucleus = 1
    
    init(dendrites: Double)
    {
        self.dendrites = dendrites
    }
    
    func transferOfEnergy()
    {
    }
    func actionableThoughts()
    {
    }
    func affectsBehavior()
    {
    }
}
    

//10
class Lung : BodyPart
{
    let superiorLobe = 2
    let middleLobe = 1
    let inferiorLove = 2
    
    func breathing()
    {
    }
    func cough()
    {
    }
    func expand()
    {
    }
}
    

//11
class Mouth : BodyPart
{
    var teeth = 32
    let tongue = 1
    let uvula = 1
    
    func chews()
    {
    }
    func speak()
    {
    }
    func yell()
    {
    }
}

//12
class Buttocks : BodyPart
{
    let cheeks = 2
    let spincter = 1
    let gluteusMaximus = 1
    
    func sits()
    {
    }
    func excretes()
    {
    }
    func attractsMen()
    {
    }
}


//13
class Neck : BodyPart
{
    let trachea = 1
    let spinalCord = 1
    let esophagus = 1
    
    func holdsHead()
    {
    }
    func getsSunburnt()
    {
    }
    func rotates()
    {
    }
}

    
//14
class Shoulder : BodyPart
{
    let supraspinatus = 1
    let bicepsShortHead = 1
    let subscapularis = 1

    func picksUp()
    {
    }
    func swings()
    {
    }
    func hurts()
    {
    }
}

    
//15
class Forearm : BodyPart
{
    let radius = 1
    let ulna = 1
    let styloidProcess = 1
    
    func squeeze()
    {
    }
    func punch()
    {
    }
    func grab()
    {
    }
}


//16
class Shin : BodyPart
{
    let tibia = 1
    let fibula = 1
    let tibialisPosteriorMuscle = 1
    
    func guards()
    {
    }
    func breaks()
    {
    }
    func attacks()
    {
    }
}

    
//17
class Wrist : BodyPart
{
    let trapezoid = 1
    let capitate = 1
    let scaphold = 1
    
    func twists()
    {
    }
    func holds()
    {
    }
    func smacks()
    {
    }
}
    

//18
class Skin : BodyPart
{
    let epidermis = 1
    let dermis = 1
    let subcutaneousTissue = 1
    
    func protectionFromInfection()
    {
    }
    func bleeds()
    {
    }
    func keepsEquilibrium()
    {
    }
}
    

//19
class Chin : BodyPart
{
    let mandible = 1
    let mentalis = 1
    let mentalProtuberance = 1
    
    func protectsJaw()
    {
    }
    func offersDefense()
    {
    }
    func stabilizes()
    {
    }
}

    
//20
class Chest : BodyPart
{
    let deltoid = 1
    let sternum = 1
    let pectoralisMajor = 1
    
    func protectsHeart()
    {
    }
    func feedsBabies()
    {
    }
    func liftsThings()
    {
    }
};}