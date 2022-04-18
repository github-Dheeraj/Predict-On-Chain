//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// We need to import the helper functions from the contract that we copy/pasted.
import {Base64} from "./libraries/Base64.sol";

contract MyShitNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string svgPartOne =
        "<svg xmlns='http://www.w3.org/2000/svg' width='300.000000pt' height='300.000000pt' viewBox='0 0 1920.000000 1920.000000' preserveAspectRatio='xMidYMid meet'> <rect width='100%' height='100%' fill='";

    string svgPartTwo =
        "'/> <text x='25%' y='25%' dominant-baseline='middle' text-anchor='middle' style='fill:black;font-family:serif;font-size:80px'><tspan x='25%' y='25%'>Its me</tspan><tspan x='25%' y='30%'>ur shit</tspan></text><g transform='translate(0.000000,1920.000000) scale(0.100000,-0.100000)' fill='#000000' stroke='none'><path d='M10238 16587 c-171 -64 -366 -283 -693 -777 -300 -453 -550 -892-809 -1420 -217 -443 -372 -828 -453 -1126 l-38 -141 -99 -54 c-55 -30 -165-97 -245 -150 -592 -388 -990 -897 -1146 -1464 -101 -371 -96 -762 14 -1107l29 -88 -37 -31 c-20 -17 -91 -85 -158 -152 l-123 -120 -132 1 c-340 3 -695101 -968 267 l-60 37 2 951 3 952 660 5 c650 5 661 5 718 27 166 63 284 181339 340 l23 68 0 1180 0 1180 -28 69 c-71 177 -217 304 -396 342 -101 21-3544 20 -3646 -1 -190 -40 -337 -172 -400 -358 l-25 -76 0 -1158 c0 -1257 -2-1202 56 -1320 39 -81 140 -183 223 -227 126 -66 125 -66 834 -66 l637 0 0-1573 c0 -1756 -6 -1624 71 -1711 22 -25 65 -57 97 -73 l57 -28 275 0 275 057 28 c32 16 75 48 97 73 72 81 71 77 71 636 0 333 3 498 10 498 6 0 43 -1682 -36 234 -118 530 -198 806 -220 50 -3 92 -8 92 -10 0 -3 -22 -35 -49 -72-467 -643 -556 -1464 -231 -2115 223 -446 621 -817 1188 -1105 553 -282 1322-489 2112 -568 91 -9 171 -18 178 -20 9 -3 12 -164 12 -764 l0 -760 -32 -14c-48 -20 -79 -58 -85 -105 l-6 -41 -121 0 c-375 0 -676 -137 -676 -307 0 -5417 -87 67 -134 51 -47 82 -66 160 -95 276 -104 673 -88 913 37 157 81 190 151190 396 0 127 -3 152 -20 189 -25 50 -68 74 -134 74 l-46 0 0 756 0 755 88 -8c111 -10 1020 -10 1090 0 l52 8 0 -726 0 -725 -40 0 c-32 0 -48 -7 -77 -33-43 -40 -51 -80 -52 -256 -1 -154 21 -232 85 -295 75 -76 229 -138 409 -16699 -16 324 -13 427 5 428 75 551 329 234 485 -133 66 -251 91 -453 97 l-173 60 31 c0 63 -65 126 -130 126 -20 0 -20 3 -20 729 l0 730 43 5 c23 3 110 13192 21 1246 131 2256 516 2851 1088 199 191 340 383 450 612 197 409 236 899107 1360 -97 351 -286 682 -570 1001 l-85 94 54 -20 c527 -206 1001 -569 1301-997 124 -178 229 -384 300 -588 47 -138 51 -155 33 -155 -9 0 -40 -9 -71 -21-105 -39 -166 -125 -144 -203 10 -36 72 -99 108 -111 20 -6 21 -12 16 -49 -8-53 11 -184 36 -252 45 -119 141 -212 243 -235 186 -41 356 163 356 428 0 146-40 265 -120 355 -45 52 -128 98 -174 98 l-31 0 -53 163 c-65 199 -136 358-238 526 -280 466 -680 831 -1204 1095 -166 85 -384 173 -524 213 -86 25 -9630 -91 48 62 222 76 314 82 520 6 214 -10 356 -62 559 -167 654 -661 1237-1389 1640 l-120 66 -27 75 c-93 256 -302 572 -617 937 -49 57 -201 227 -337378 -136 151 -300 338 -365 416 -335 399 -496 687 -530 946 -11 78 -9 103 10225 42 256 7 381 -127 460 -55 32 -174 42 -235 20z m131 -261 c12 -25 11 -47-9 -173 -18 -113 -22 -166 -17 -246 11 -183 77 -378 202 -591 158 -272 324-479 860 -1072 198 -219 355 -403 457 -534 172 -223 309 -464 363 -640 15 -4730 -91 34 -99 4 -8 49 -36 101 -63 317 -165 550 -330 770 -544 216 -210 362-407 475 -639 226 -463 255 -973 80 -1398 -25 -62 -48 -119 -51 -127 -3 -1022 -37 78 -80 119 -93 411 -388 497 -503 207 -277 341 -564 400 -854 26 -12726 -202 1 -323 -151 -718 -786 -1287 -1820 -1631 -1398 -464 -3470 -463 -48632 -1032 345 -1667 917 -1816 1636 -26 127 -26 165 0 299 59 310 220 644 445924 91 115 317 339 437 434 53 43 97 83 97 88 0 5 -15 45 -34 88 -169 383-173 863 -11 1281 209 542 685 1027 1318 1345 84 42 107 59 107 75 0 39 60270 106 406 97 289 215 566 409 958 241 486 505 943 787 1365 223 335 373 522482 606 67 51 94 53 115 10z m-3718 -1202 c66 -31 114 -78 146 -142 l28 -57 0-1150 0 -1150 -24 -45 c-32 -61 -76 -107 -136 -138 l-50 -27 -1795 0 -1795 0-49 24 c-63 31 -113 82 -142 146 l-24 52 0 1142 c0 1132 0 1143 20 1189 24 5380 116 125 140 80 42 28 41 1880 39 l1770 -2 46 -21z m-1571 -4505 c0 -1049-3 -1557 -10 -1570 -10 -18 -24 -19 -245 -19 -199 0 -236 2 -249 16 -14 14-16 170 -16 1570 l0 1554 260 0 260 0 0 -1551z' fill='";

    string svgPartThree =
        "'/><path d='M9188 11390 c-210 -38 -379 -179 -454 -377 -35 -91 -43 -230 -20-327 26 -111 71 -192 156 -277 95 -96 185 -143 318 -166 83 -14 101 -14 184 0132 22 222 70 319 166 116 116 169 244 169 406 0 261 -167 484 -419 559 -6720 -191 28 -253 16z m386 -192 c90 -27 155 -132 143 -233 -11 -106 -111 -195-217 -195 -70 0 -147 43 -184 103 -42 68 -46 138 -13 210 48 104 154 150 271115z m-263 -467 c49 -40 18 -131 -46 -131 -38 0 -75 37 -75 76 0 65 69 97 12155z' fill='";
    string svgPartFour =
        "green'/><path d='M11103 11390 c-216 -39 -383 -188 -459 -410 -30 -87 -26 -263 8 -35279 -209 240 -347 448 -384 283 -51 566 119 656 393 27 82 27 274 0 356 -58178 -214 328 -395 381 -69 20 -191 28 -258 16z m436 -213 c22 -15 53 -46 68-69 25 -36 28 -51 28 -119 0 -70 -3 -82 -30 -121 -20 -28 -49 -52 -84 -70 -93-47 -178 -33 -252 41 -108 107 -83 274 51 344 72 38 156 36 219 -6z m-362-449 c48 -45 13 -128 -54 -128 -32 0 -73 42 -73 75 0 34 42 75 76 75 15 0 38-10 51 -22z' fill='";

    string svgPartFive =
        "green'/><path d='M9270 9350 c-25 -25 -27 -99 -4 -208 70 -341 289 -625 602 -782 670-337 1478 76 1606 819 21 124 20 137 -9 166 l-24 25 -1076 0 c-1062 0 -1075 0-1095 -20z' fill='blue'/></g></svg>";
    string[] firstWords = [
        "Amit",
        "Anchal",
        "Kaustubh",
        "Shivam",
        "Mayank",
        "Pranay"
    ];
    string[] secondWords = [
        "Pondi",
        "Bengluru",
        "Chennai",
        "Pathri",
        "Wani",
        "Pune"
    ];
    string[] thirdWords = ["Love", "Hate", "Lust", "Trust", "Revenge", "Hope"];

    string[] colors = [
        "red",
        "#08C2A8",
        "black",
        "yellow",
        "blue",
        "green",
        "orange",
        "purple"
    ];

    event NewShitNFTMinted(address sender, uint256 tokenId);

    constructor() ERC721("shapeNFT", "shape") {
        console.log("This is MyShitNFT smart contract");
    }

    function pickRandomFirstWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId)))
        );
        rand = rand % firstWords.length;
        return firstWords[rand];
    }

    function pickRandomSecondWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("SECOND_WORD", Strings.toString(tokenId)))
        );
        rand = rand % secondWords.length;
        return secondWords[rand];
    }

    function pickRandomThirdWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("THIRD_WORD", Strings.toString(tokenId)))
        );
        rand = rand % thirdWords.length;
        return thirdWords[rand];
    }

    function picKRandomColorToFill(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("colors", Strings.toString(tokenId)))
        );
        rand = rand % colors.length;
        return colors[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function mintMyShitNFT() public {
        uint256 itemId = _tokenIds.current();

        string memory first = pickRandomFirstWord(itemId);
        string memory second = pickRandomSecondWord(itemId);
        string memory third = pickRandomThirdWord(itemId);
        string memory combinedWord = string(
            abi.encodePacked(first, second, third)
        );

        string memory color = picKRandomColorToFill(itemId);
        string memory color1 = picKRandomColorToFill(itemId);
        string memory color2 = picKRandomColorToFill(itemId);
        string memory finalSvg = string(
            abi.encodePacked(
                svgPartOne,
                color,
                svgPartTwo,
                color1,
                svgPartThree,
                color2,
                svgPartFour,
                color2,
                svgPartFive
            )
        );

        //Get all the JSON Metadata in place
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        // We set the title of our NFT as the generated word.
                        combinedWord,
                        '", "description": "A highly acclaimed collection of words", "image": "data:image/svg+xml;base64,',
                        // We add data:image/svg+xml;base64 and then append our base64 encode our svg.
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        console.log("\n--------------------");
        console.log(
            string(
                abi.encodePacked(
                    "https://nftpreview.0xdev.codes/?code=",
                    finalTokenUri
                )
            )
        );
        console.log("--------------------\n");

        _safeMint(msg.sender, itemId);

        _setTokenURI(itemId, finalTokenUri);

        _tokenIds.increment();

        console.log(
            "An NFT w/ ID %s has been minted to %s",
            itemId,
            msg.sender
        );
        emit NewShitNFTMinted(msg.sender, itemId);
    }
}
