
/*:
# Higher-order Functions
## aka Avoiding For-Loops

> a higher-order function is a function that does at least one of the following:

* takes one or more functions as an input
* outputs a function

~ [Wikipedia](http://en.wikipedia.org/wiki/Higher-order_function)

This playground will explore a few popular higher-order functions built into Swift
*/

// The data source
struct Song {
    let title: String
    let album: String
}


let tSwiftSongs = [
    Song(title: "Blank Space", album: "1989"),
    Song(title: "All You Had to Do Was Stay", album: "Red"),
    Song(title: "Back to December", album: "Speak Now"),
    Song(title: "All You Had to Do Was Stay", album: "1989"),
    Song(title: "Begin Again", album: "Red"),
    Song(title: "Clean", album: "1989"),
    Song(title: "Love Story", album: "Fearless"),
    Song(title: "Shake It Off", album: "1989"),
    Song(title: "Bad Blood", album: "1989")
]

/*:
## Map
*/

// let's create an array of (not nearly) all Taylor Swift songs... 
// Normally, you'd do this using a loop

var mutableSongs = [String]()
for song in tSwiftSongs {
    mutableSongs.append(song.title)
}

// Let's take a look at the songs
mutableSongs
mutableSongs.count

// But this is not ideal... Someone can come along and add more songs later in the code...
for song in tSwiftSongs {
    mutableSongs.append(song.title)
}

// and now you have double the songs!!!
mutableSongs.count

// We can use map instead to prevent these types of accidental bugs:
let immutableSongs = tSwiftSongs.map { song in song.title }

// And since this is Swift, we can use the nice $0 shorthand for the song instead:
let immutableSongsShort = tSwiftSongs.map { $0.title }
immutableSongsShort

// Try adding another song to prettySongs...
// immutableSongsShort.append("Red")

/*:
### Task: Create an array of songs, but this time, add "I 💖 Taylor Swift:" in front of every song title!
*/

// :)

/*:
## Filter
*/

// let's get songs from only the 1989 album
// Just like with map, you can do that with a for-loop. Try it out below!

var songs = [Song]()
for song in tSwiftSongs {
    // get ony the songs from the 1989 album
}


// Now, let's do it the fun Swift way :)
let tSwift1989songs = tSwiftSongs.filter { $0.album == "1989" }
tSwift1989songs

/*:
### Task: get all the songs from the "Red" album
*/

// let tSwiftRedSongs =

/*: 
## FlatMap
*/

// FlatMap can take in a nested array, and join it together into one array with each element transformed (if you'd like). It's really powerful!

let tSwiftFearlessSongs = tSwiftSongs.filter { $0.album == "Fearless" }
let songsByAlbum = [tSwift1989songs, tSwiftFearlessSongs]

let joinedTransformedSongTitles = songsByAlbum.flatMap { album in
    album.map { song in
        "\(song.title) - 💖 T.Swift" }
}
joinedTransformedSongTitles

// You can of course use the shortcut $0 to make this a one-liner:
// Note that the first $0 refers to the album, and the second one refers to the song - again, this is a shortcut for the code above
let joinedTransformedSongTitlesShort = songsByAlbum.flatMap { $0.map { "\($0.title) - 💖 T.Swift" } }
joinedTransformedSongTitlesShort

/*:
### Task: Create a flattened array of elements from the nested array with 13 added to each element
*/

// let plus13FlattenedArray =

/*:
Another HUGE use-case for flatMap in Swift is to deal with unwrapping mutliple optionals in an array
*/

let optionalSongs: [String?] = ["Blank Space", nil, "All You Had to Do Was Stay", nil, "All You Had to Do Was Stay", "Begin Again", "Clean", nil, "Shake It Off", nil]

let unwrappedSongs = optionalSongs.flatMap { $0 }
unwrappedSongs
// notice that only the existing songs are there now, with no nil values!
// Read more about flatMap on my blog here: http://natashatherobot.com/swift-2-flatmap/

/*:
## Challenge: Create your own higher-order function
*/

// you got this, captain!!!!






