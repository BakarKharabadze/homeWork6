import Foundation

// 1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

func isWorkDay(on: WeekDay) {
    switch on {
    case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday :
        print("სამუშაო დღეა")
    case .Saturday, .Sunday:
        print("დასვენების დღეა")
    }
}

isWorkDay(on: .Sunday)

// 2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio
    
    func price() {
        switch self {
        case .MoshishvlebuliMkerdi:
            print("ეს დონე ღირს თვეში 500$")
        case .TsigroviManto:
            print("ეს დონე ღირს თვეში 300$")
        case .TuGapatio:
            print("ეს დონე ღირს თვეში 100$")
        }
    }
}

GialaSquad.TsigroviManto.price()

// 3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(UInt)
    case Cloudy(UInt)
    case Rainy(UInt)
    case Snowy(Int)
    
    func recomendation() {
        switch self {
        case .Cloudy(let celsius):
            if celsius > 10 && celsius < 28 {
                print("შეიძლება მოწვიმოს ამიტომ მოსაცმელიც გაიყოლე")
            } else {
                print("error")
            }
        case .Rainy(let celsius):
            if celsius > 10 && celsius < 19 {
                print("მოსაცმლის თან წაღება არ დაგავიწყდეს")
            } else {
                print("error")
            }
        case .Snowy(let celsius):
            if celsius > 0 && celsius < 10 {
                print("ძალიან თბილად ჩაიცვი")
            } else {
                celsius < 0
                print("დარჩით სახლში")
            }
        case .Sunny(let celsius):
            if celsius > 29 && celsius < 45 {
                print("გაიხადე ყველაფერი")
            } else {
                celsius > 45
                print("ანომოალია")
            }
        }
    }
}

let weather1 = Weather.Cloudy(17)
weather1.recomendation()

let weather2 = Weather.Sunny(40)
weather2.recomendation()

// 4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    let releaseYear: UInt
}

var kanyeArray = [
    Kanye(album: "Yeezus", releaseYear: 2013),
    Kanye(album: "Ye", releaseYear: 2018),
    Kanye(album: "Yandhi", releaseYear: 2019),
    Kanye(album: "Donda", releaseYear: 2021)
]

func filterAlbums(from array: [Kanye], by year: Int) -> [Kanye] {
    var kanyeArray = [Kanye]()
    
    for kanye in array {
        if kanye.releaseYear > year {
            kanyeArray.append(kanye)
        }
    }
    return kanyeArray
}

let filteredAlbums = filterAlbums(from: kanyeArray, by: 2015)
print(filteredAlbums)

// 5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct MyOwnLazy {
    var wrappedValue: String {
        lazy var cachedData: String = {
            "lazy ინიციალიზებულია"
        }()
        return cachedData
    }
}



