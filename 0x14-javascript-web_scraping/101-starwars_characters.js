const request = require('request');

if (process.argv.length !== 3) {
    console.error('Usage: ./101-starwars_characters.js <Movie ID>');
    process.exit(1);
}

const movieId = process.argv[2];
const apiUrl = `https://swapi.dev/api/films/${movieId}/`;

request(apiUrl, (error, response, body) => {
    if (error) {
        console.error('Error:', error);
        process.exit(1);
    }

    if (response.statusCode !== 200) {
        console.error('Unexpected status code:', response.statusCode);
        process.exit(1);
    }

    const filmData = JSON.parse(body);
    const characters = filmData.characters;

    characters.forEach(characterUrl => {
        request(characterUrl, (error, response, body) => {
            if (error) {
                console.error('Error:', error);
                process.exit(1);
            }

            if (response.statusCode !== 200) {
                console.error('Unexpected status code:', response.statusCode);
                process.exit(1);
            }

            const characterData = JSON.parse(body);
            console.log(characterData.name);
        });
    });
});
