
input = File.read(File.join(File.dirname(__FILE__), "../inputs/day5.txt"))
# input = 'dabAcCaCBAcCcaDA'
# input = 'aabAAB'
# input = 'UtZOzCXcpqHCvnVtXlZLVcQycyCqNdYePqzQYtMdcNNpJZXJmuJZYpUxjukjzvsDYDEVFGrkbtkPJUIEzhCIKOpOixjFTpeesjjLaNfGsTFowkYCfgcWzCkBlzuinpWzAhIFFKeSDKFPeOhQOhmGKRktOGWgphYfeXGDQFOeOhyShUdqzQRYhQydVzmzoryzMAeWJDsMSLJmvhfhwrhzEVNaUjmIQWgtXzwgJbenmALthaiZLDCWRphWhUPraouGhQlekAFBQLVOdApzAGfcApqlEzXOXzRdzLnBRQXscZuhMjoKhErlxDYPeRGEuznzusvmrJmOrhyCYpkoKQPLJkAExzGJSSInZjhsapRJZgipuRGVDapQPzgDAhlSBLkJqFguWzojlEaqimXFXMevWMMeNPnrGMdZfKxiHryfBBZvoLHmPSJHesPeWFeKpEGECtgSIhuOjgFjQiCvHjgABuyJHqgslbfiypBplNosdLQWIYmXaKZLMtwZaewkTfYzJCLWNHMKuisiNfpgRYcWoJolofDHgJuKmYnorckqTlebEFXIPscKtrAETeVHQARmidqhwLqtVKPFVpBVnXeuzFkaxpVtlAdbDbLjAGbkPysMJejUWkGZrFJoyjjzpaWXIWnhDEBvSbULzJLccdOzRzIbQQdqKKGpbEodBQUqiBOFpbYJsPfAPtxnOvlFCetkqcgjtghAozMpRUHjdOgttqASAncUeiBxDQbowPmYzHDinQgnJNQElmiiVTeGoMjxAhaNZaKeydFcnWubaEKDTeGkqNWyirClErcHxHPdhEMVTUDarSpUyrcMtwkPmCCPknEjBueWMVPSIcBiiwDhkuqVItqsJWryTHZXXdziUGfNGlyKdeJUDfdnYEQbthBCaqoSnRLKEmfNDAmRKOKaFRPUbbvlmgVtEnjMHreGLqsVhTLbuWvyZEjRDPwrDEBqLiVrDTYvnUtVMnBmvqsXdFVXIsaCRsdYPhAEAZmngWtKsUtuWLErFYnkEcEGusEGpkPBauKEpvSWoIwJCYoaEgExjgqDOtGngwPoKypwawFOfgpIYNSPdnctWcOKQAymsKKhvXVNKrVhmUAGctCXEnDrKFhiiJGTGIwyKoJlsfspYJCASVUyaYZsVddFkafYsKHZgugXfkEiUskNehMXKVDThmHyhugaYdqISBFXWdvteHxPisrKhJTavMPifqwsTEZgCkFeVQiaaPRnibiKnQIUsotGyLhcfCYHjHmnsnWxFNQVoUwhuwMrACajqcLYJKsxhLATXHElVBwzcNXqOSbpORGwcYVEWtjxfvzGObNdVYVHHSlVruBIQaQIJnUquaGWSlAlbZuGzjvfWnkmbWNVKBOiYwTaVeDVrjOizofexxmiBnIAUswxffiujqiAgZNuoYeuFqAcsTFmNqtZrWIrJmSelJphvuBaqyHTHchnzdZGhxOmhMybDHpJfcFDUhXSvBnexZskCSGeHKVcPRuCTxMsNaPndfuFuMiTCsbthfPtPZfcrpxDjOcbuDDTcjbjRUDnyqFwkggJXgxfZBrPLRnocsPSggbueMMrmbRdRujaPbpCwuHvGMHgRgylyVOBopaXVjPNDXwzvYcybTWZMXjdslSICvEaSTsbshFhzrzinKpSajHwpaUfdrfrxkxYaVNjwTutyfnaBmPJfuxcxCJzvTUnnHOyuyZIQRvKMjFHnokFdtpmSrtdEJGhPFyVwAycOvhFIsCXiaTGbVivkGottBWKeaNozwepQZtYTRbMhXMjmDeWslltrVCEvPCjyQPozPqSXomFavqGNaXzPuPVEbocPXsHHIXwZRJvSofCGwftCAxfvcjCvwgjoTAgwJUxyLBOiYodlrbwEbEPnUAZoXotJaqnZyGOEZGIkPErQlIjbPVZpZSKIcdiksENIKHppAjbgQCSKmOeHwVAASLLOlwUQlpByZjVpHYWdqrfnYPOLRcbKVYIgCqKvKEbGcjmsjfZQREBOJCeajkZrHNTDGdcREwuKweDfdduORzBfxwmlOcJaXQoZjLhixajPfATcGoQpooIkLHSatkouTVFTAxwceVCwncqHwqYDHXHmQnFpODtDXwFSZROXInRWAFjgYdejrMzVUljooLMRWgpskthNeWlRcVazRvWbgcGHApKwoPJHXYqLYttaRTNiiFXLajhrpdKVPtcQswqJdKmhZoGIsjjZmNNdvlrCzjWXyPAVxvOuoMAoqbycQKSMcblPYQuTxEEoGadZLDRaMcJZRBIeKlQEaVwGnuitkLCqnCGYorvrJBNkzWxMPzFwyEqDUjQTaPruDEUWXoeVwZWeIemkkVpjYLsbazLeqrFQhTArKcGXOhUWMNXBjfjNkopGzbYzXfoyVGUtLGwDUVsrHldiZeNgvZmJEwaVxjRYsoILICUOpektHstqCjpkJwtIBlZOuJYSuhslFisqqzjXHFGueZSusaHNsnklZQhsNCivssuvDerWmPwmqIBxfCwOqHPOdEIQeVCdtlrXeyBdepgCfPnawcGqVFKLsALzghRSUrKcpahqOZvohJxKggqmrnTcISWLJIlCdGJAyDBYcFuFeQsvnzKJHYvRcSrSQRwUwwViUScxAPBeJMUsApTsqWxlRiKaxyCwpMemVXaQuubzvqEhpWfpkdtKouvjTCMBqgmqyunvgzlDyZFkHJVaVdjaekOTgaZPZYNdVwnbVgUIoFMUDGCedgVdwslYkZyhJkxnLZGjqsWSyNyAYCvfpBKVzVnynuMoGsIDPPKtNBwYnqRxuIcoizEPAzIedxyiYsbtoFITjkSWURzTQLPPywyycRtMXKGPQaiuvoxZFyuYjXoBUBdyjjxYIygTlJAlskEzxbnSEKqsnouYXSaNCeeHaLEpXLIUnUPWhCAjpEauCfrYHgngWWYlOHaJqYLRZAriGQernrpKzgDGbulwqNHxpOdCMulzWieKtYmmKSVKnlgeqpweZgVVbYXiAnqtHzBckCXEwGPwjHxOYFrASkdsoxdHOBumAKANKWMccSmYSTIrErWIaSAEGweOMqNqHNBQPvDFFeQExEICdoXLbXvsgMeAZQFHKWQwOXOuVGMbSvHVNLNcgScnCYkIBiohgoPEDEpLVyaQEPQmhAKENsQFrOzniVqrtnYYwpZjBrWRlaRqecOTEFwCPiehoAQmfAMGfDoUaceyUkysOzHPvpXdLRzIDMRBCjGmyZAhrImuIVZaEjOZbApGUdlUZefpQIhslPrasezYhPWHIIqBOOutDxMftYafDYkeGdRmeTIXVIIqMHPcIjDbXHdlYlHZrZazBZcrdjGSionRTgSYSFpyRxUCIQlHYmXjkCMLZNPvNvlEkvQrPyjCLxxUwuDJlaGFzkZUcsZNdarSzyygpjSBBaBqLzTXgEFmgVJbshkngfWvPfuldncrdKmsqtmPJIkYBLnfMcXKsypcWDYXysvbulByuzUoMqRXfcKWXBJHMqLhudfRkEkNuSFQsBaCapzLIDMXGdaYMgyBLaHJMCxDulryHNrDwRhVnOcZaeqgRvWQKceGeZrwHJNISqOsPbKmfDtwychCpvAGcENVCSUhqmmusjXDVFiDVmKKlQLmEHFYveCuGRkkpcSfbMHOYTUtirCeUeTeeQVGRcpoxENlzCZHHoDKafvTbpFyfGjbvYUhQkkWBypeHAwaTurVrjhZlVSRRJtqrpFqXoWiNzFQOguQNQExZSBspLYelMXeuFylubIcMQougmSqqOVOyKgsyWoBprqwtjNZaEuovfTECicaoPnPZQVFYIPjcAzIKWcGFuuSqYslwrLRfnfWFxmcoKVCVpuzGGVKPBwPzfghAzbfOdmlHXRLImeoJccoGdpBWorFkREQpYJZWbKrQldMDruVxlEEGwXQPTYBQFhEFtZWMuIAioZhVRgJJKqmUYCkpnqzeSPyNOYKlblkpstEYFceQfNkblBDxxCBsJQQvOWFWTAoTxAyuqLsjshjsHCFXnrwsylsnHVzlPxQRVolXlfGmjzeIkquRbWcVjwCiVbJFTbqRUhyWOcRTqVxelNGogHoPsWEULqybmFIlpxsuAYhyqYBIXhhIbmVPzuYigJcoTKRGEiglSrAbFrTeQXjgfzlWqiMyLFQgRzNpCeDLQRWUVUtsGinpZNEgwnbfUgPNismkNvPnudVnrBwDoirEDrHQcbanaOJrqdvQrBspHLvTPvGIZSEOhXIPzcmkYYMXLrsFjArIHsysaHxifvSiwzMPRmtzLMZEEGYGAlgFVyzArQGvCMMezrPvWSNZLcfyQGeaogSWaxMemNyvaWasotOOpLwTmuxCxtWNVeybkmnLDZEjwFxOCNCRVkcMxQjYKsCWiwZnRSwBkoRTRysCJcARHIvFihyDSVoKhhEYGJkicNzzfzXuPzWnhnOScUdzFAPSHEPVIzyruSybZJzLjxfSnKVQwVSKHyTxhPYRtiRVVdeHaxWRsoLgnDigZhhlSrjVBVNjkALrgHfYmuDBwpIbZPuGSqqRtcmaqfpOnnxNzDxzztUqMIhzxuDFitOfhkBXazfIPyQZFpIloHiBIlafvsusMrepevavEcJgEiVMOiakMCdrgrpyQYkqHQyMsXargIUqjlBheMeOYfaIbRkLwlcfBWxWpqHtJZTBypRbguNqhNXzmcQQiTOsYElcRyGoptSfkPSUgpFAtUfdAUMHeTDpTmzEhtKCYhuJNJUMqVVwLWqtnRnBzWWLSYCnxADZnxNIIamNpelIWoyGJzeVyVSeAezGJMchGzthxIJMBYgVCQISIQRDaJzgEXlwGdKoTlYOifMzHycIrgTRUSWJdJIoHMpcPXWKJwAXezUcmSicalUbciQnGriiwSatnBhBwwrQgWPrKzgruSARScsMJCZmgVPxTHuBVlQEwJClQBOitDghvwSNViForBGBRKrWlmxQjMIWFqqVeDrPxCTHLUNJHQUaFUUFyEVOmiMBnnXkshfGBLUMQeKlHwidMndjhEBMJJynwgshZUAyOIEyOWuIZFCNpnWoFNzcjqHJeFMJIGstKlnExryAFqjhzUoLueBLWSJknDXjvIFeYJgwRiKFUEzRynLCHafVRkooLMVBJejtaZDNZEhSYtUWFlqZiDTMrknihMAQlInkhmZUmosjvlFGSHagirycERLxCQWrtRccwmlSjdlElfXzOKBolshaSIBVBDGNokvNLTovMfUpprdeIjlrzJIOuhOTHuXzYGbZgHyyJKQxcHuwMcsKOGQrAWVQYHxRMxMpBneKgLnrPXrTHfVTRtyCuTsyyCQhQDishyZiwQcPziNRSujwfZNmAZIhgSiTbiSJvqWNLxwKFZtBcyDpIjPtaoENbKRmYpaRUxwqjQFYscKqbYWTfSyqbEoLyAjHNxHCAYKfkDfWYYNNJdEPaywnpYZUwRaaCCSZvUWLDXpZpaamOgeMWEfwShanVWHOpOrhjybXtrhCCUmwqjOwSlJpJYOSgJuAEJAidYDGrNhCBEoYuLvSlzIVJRcTbziBypBsbCStyWQBhnQBzTPDMHuDrPGfPqRSrUcoyCivJgmoASabgFIbaGkxnseZnkpLvyiGZrqnUXMLUgAmVryqppiFybOhNWQMNvtZkmwhYXnbObZEKgTdBwMhBlVIYmZvoUeIdzeonSvuFowjZRWGHJnfGyFUWLNqMFodmdNhiAWzHfNjFuWcXDEzTrJWfxKomOLDXiOpIRwxpFjCbaJgucNQAmcjzYCFcyZJCMaqnCUGjABcJfPXWriPoIxdloMOXFwjRtZedxCwUfJnFhZwaIHnDMDOfmQnlwufYgFNjhgwrzJWOfUVsNOEZDiEuOVzMyivLbHmWbDtGkezBcoBNxHWMKzTVnmqwnHoBYfIPPQYRvMaGulmxuNQRzgIYVlPKNzESNXKgABifGBAsaOMGjVIcYOCuRsrQpFgpRdUhmdptZbqNHbqwYTscBSbPYbIZBtCrjviZLsVlUyOebcHnRgdyDIajeaUjGsoyjPjLsWoJQWMuccHRTxBYJHRoPohwvNAHsWFewmEGoMAAPzPxdlwuVzsccAArWuzyPNWYApeDjnnyywFdKFkyachXnhJaYlOeBQYsFtwyBQkCSyfqJQWXurAPyrkBneOATpJiPdYCbTzfkWXlnwQVjsIBtIsGHizaMnFWJUsrnIZpCqWIzYHSIdqHqcYStUcYTrtvFhtRxpRNlGkENbPmXmrXhyqvwaRqgokSCmWUhCXqkjYYhGzBgyZxUhtoHUoijZRLJiEDRPPuFmVOtlnVKOngdbvbiAHSLObkoZxFLeLDJsLMWCCrTRwqcXlreCYRIGAhsgfLVJSOMuzMHKNiLqamHINKRmtdIzQLfwuTysHezndzATPJEjbvmlOOKrvFAhclNYrZeufkIrWGjyEfiVJxdNKjswlbEUlOuZHJQfaYRXeNLkTSgijmfEjhQJCZnfOwNPncfziUwoYeioYauzHSGWNYjjmbeHJDNmDIWhLkEqmulbgFHSKxNNbNmIMoveYfuufAuqhjnulhtcXpRdEvQQfwimJqXMLwRkrbgbROfIvnsWVHGTIobqLcjWeqLvbUhtXpvGMzcjmSCsrasURGZkRpwGqRWWbHbNTAsWIIRgNqICBuLACIsMCuZExaWjkwxpCPmhOijDjwsurtGRiCYhZmFIoyLtOkDgWLxeGZjAdrqisiqcvGybmjiXHTZgHCmjgZEaEsvYvEZjgYOwiLEPnMAiinXNzdaXNcyslwwZbNIrNTQwlWvvQmujnjUHyckTHeZMtPdtEhmuaDFuTafPGuspKFsTPOgYrCLeySotIqqCMZxnHQnUGBrPYbtzjThQPwXwbFCLWlKrBiAFyoEmEHbLJQuiGRAxSmYqhQKyqYPRGRDcmKAIomvIeGjCeVAVEPERmSUSVFALibIhOLiPfzqYpiFZAxbKHFoTIfdUXZHimQuTZZXdZnXNNoPFQAMCTrQQsgUpzBiPWbdUMyFhGRlaKJnvbvJRsLHHzGIdNGlOSrwXAhEDvvrITrypHXtYhksvWqvkNsFXJlZjzBYsURYZivpehspafZDuCsoNHNwZpUxZFZZnCIKjgyeHHkOvsdYHIfVihraCjcSYrtrOKbWsrNzWIwcSkyJqXmKvrcncoXfWJezdlNMKBYEvnwTXcXUMtWlPooTOSAwAVYnMEmXAwsGOAEgqYFClznswVpRZEmmcVgqRaZYvfGLagygeezmlZTMrpmZWIsVFIXhASYShiRafSRlxmyyKMCZpixHoeszigVptVlhPSbRqVDQRjoANABCqhRydeRIOdWbRNvDUNpVnzKMSInpGuFBNWGenzPNIgSTuvuwrqldEcPnZrGqflYmIQwLZFGJxqEtERfBaRsLsGIegrktOCjGIyUZpvMBiHHxibyQYHyaUSXPLifMBYQluewSpOhGOgnLEXvQtrCowYHurQBtfjBvIcWJvCwBrUQKiEZJMgFLxLOvrqXpLZvhNSLYSWRNxfchSJHSJSlQUYaXtOatwfwoVqqjSbcXXdbLBKnFqECfyeTSPKLBLkyonYpsEZQNPKcyuMQkjjGrvHzOIaiUmwzTfeHfqbypqxWgeLXvURdmDLqRkBwzjyPqerKfROwbPDgOCCjOEMilrxhLMDoFBZaHGFZpWbpkvggZUPvcvkOCMXfwFNFrlRWLSyQsUUfgCwkiZaCJpiyfvqzpNpOACIcetFVOUeAznJTWQRPbOwYSGkYovoQQsMGUOqmCiBULYfUExmLEylPSbszXeqnqUGoqfZnIwOxQfPRQTjrrsvLzHJRvRUtAWahEPYbwKKqHuyVBJgFYfPBtVFAkdOhhzcZLneXOPCrgvqEEtEuEcRITutyohmBFsCPKKrgUcEVyfheMlqbLkkMvBdIfvdxJSUMMQHuscvneCgaVPcHCYWTdFMkBpSoQsinjhWRzEgECkqwVrGQEAzCoNvHrWdRnhYRLUdXcmjhAlbYGmyADgxmdilZPAcAbSqfsUnKeKrFDUHlQmhjbxwkCFxrQmOuZUYbLUBVSYxydwCPYSkxCmFNlbyKijpMTQSMkDRCNDLUFpVwFGNKHSBjvGMfeGxtZlQbAbbsJPGYYZsRADnzSCuzKZfgALjdUWuXXlcJYpRqVKeLVnVpnzlmcKJxMyhLqicuXrYPfsysGtrNOIsgJDRCzbZAzRzhLyLDhxBdJiCphmQiivxitErDgEKydFAyTFmXdUoobQiihwpHyZESARpLSHiqPFEzuLDugPaBzoeAzviUMiRHazYMgJcbrmdiZrlDxPVphZoSYKuYECAuOdFgmaFMqaOHEIpcWfetoCEQrALrwRbJzPWyyNTRQvINZoRfqSnekaHMqpeqAYvlPedepOGHOIbiKycNCsGCnlnvhVsBmgvUoxoWqwkhfqzaEmGSVxBlxODcieXeqEffdVpqbnhQnQmoEWgeasAiwReRitsyMsCCmwknakaMUbohDXOSDKsaRfyoXhJWpgWexcKCbZhTQNaIxyBvvGzEWPQEGLNkvskMMyTkEIwZLUmcDoPXhnQWLUBgdGZkPRNREqgIRazlyQjAhoLywwGNGhyRFcUAePJacHwpuNuilxPelAhEEcnAsxyUONSQkesNBXZeKSLajLtGYiyXJJYDbubOxJyUYfzXOVUIAgkxmTrCYYWYpplqtZruwsKJtifOTBSyIYXDEiZapeZIOCiUXrQNyWbnTkppdiSgOmUNYNvZvkbPFVcyaYnYswSQJgzlNXKjHYzKyLSWDvGDEcgdumfOiuGvBNWvDnyzpzAGtoKEAJDvAvjhKfzYdLZGVNUYQMGQbmctJVUOkTDKPFwPHeQVZBUUqAxvMEmPWcYXAkIrLXwQStPaSumjEbpaXCsuIvWWuWrqsRsCrVyhjkZNVSqEfUfCybdYajgDcLijlwsiCtNRMGGkXjHOVzoQHAPCkRusrHGZlaSlkfvQgCWANpFcGPEDbYExRLTDcvEqieDophQoWcFXbiQMWpMwREdVUSSVIcnSHqzLNSnhASUsEUgfhxJZQQSIfLSHUsyjUozLbiTWjKPJcQTShTKEPouciliOShyrJXvAWejMzVGnEzIDLhRSvudWglTugvYOFxZyBZgPOKnJFJbxnmwuHoxgCkRatHqfRQElZABSlyJPvKKMEiEwzWvEOxwuedURpAtqJudQeYWfZpmXwZKnbjRVROygcNQclKTIUNgWvAeqkEibrzjCmArdlzDAgOeeXtUqypLBCmskqCYBQOamOUoVXvapYxwJZcRLVDnnMzJJLSigOzHMkDjQWSqCTpvkDPRHJAlxfIIntrATTylQyxhjpOWkPahgCGBwVrZAvCrLwEnHTKSPGwrmlOOJLuvZmRJEDyGJfawrNixorzsfWxdTdoPfNqMhxhdyQWhQCNWcvECWXatfvtUOKTAshlKiOOPqOgCtaFnpJAXIHlJzOqxAjCoLMWXFbZroUDDFdEWkUWerCDgdtnhRzKJAEcjoberqzFJSMJCgBekVkQcGiyvkBCrlopyNFRQDwyhPvJzYbPLquWLollsaavWhEoMkscqGBJaPPhkineSKIDCikszPzvpBJiLqRepKigzeogYzNQAjTOxOzauNpeBeWBRLDOyIoblYXujWGatOJGWVcJCVFXacTFWgcFOsVjrzWxihhSxpCOBevpUpZxAngQVAfMOxsQpZOpqYJcpVecvRTLLSwEdMJmxHmBrtyTzOJoqPEWZOnAEkwbTTOKVIvBgtAIxcSifHVoCYaWvYfpHgjeDTRsMPTDfKONhfJmkrqizYUYohNNutVZjcXCXUFjpMbANFYTUtWJnvAyXKXRFRDFuAPWhJAsPkNIZRZHfHBStsAeVcisLSDJxmzwtBYCyVZWxdnpJvxAPObovYLYGrGhmgVhUWcPBpAJUrDrBMRmmEUBGGspSCONrlpRbzFuXGxjGGKWfQYNdurJBJCtddUBCoJdXPRCFzpTpFHTBSctImUfUFDNpAnSmXtcUrpCvkhEgscKSzXENbVsxHudfCFjPhdBYmHMoXHgzDZNHChthYQAbUVHPjLEsMjRiwRzTQnMftSCaQfUEyOUnzGaIQJUIFNFXWSuaNbIMXXEFOZIoJRvdEvAtWyIobkvnwBMKNwFVJZgUzBLaLswgAUQuNjiqAqibURvLshhvyvDnBogZVFXJTwevyCWgroPBsoQxnCZWbvLehxtalHXSkjylCQJAcaRmWUHWuOvqnfXwNSNMhJhycFCHlYgTOSuiqNkIBINrpAAIqvEfKcGzetSWQFIpmVAtjHkRSIpXhETVDwxfbsiQDyAGUHYhMHtdvkxmHEnKSuIeKFxGUGzhkSyFAKfDDvSzySAYuvsacjyPSFSLjOkYWigtgjIIHfkRdNexcTCgauMHvRknvxVHkkSMYqkoCwTCNDpsnyiPGFofWAWPYkOpWGNgTodGJXeGeAOycjWiOwsVPekUAbpKPgeSUgeCzeKNyfRelwUTuSkTwGNMzaeaHpyDSrcASixvfDxSQVMbNmvTuNVytdRvIlQbedRWpdrJezYVwUBltMHvSQlgERhmJNeTvGMLVBBuprfAkokrMadnFMeklrNsOQAcbHTBqWeyNDFdujEDkYLgnFguIZDxxzhtYRwjSQTivQUKHdWIIbCispvmwEUbJeNKpccMpKWTmCRYuPsCRAdutvQmeHDphXhCReLcRIYwnQKgEtdkeABUwNCfDYEkAznHaXJmOgEtvIIMLeqnjNGqNIdhZyMpWOBqdXbIEuCNasaQTTZGoDJhurPmZOaHGTJGCKTEcfLVoNXTpaFpSjyBPfobIQuqbDOeBPgkkQDqqBiZrZoDCCljZluBsVbedHNwixwAPZJJYOjfRzgKwuJEjmSYpKBgaJlBdBDaLTvPXAKfZUExNvbPvfpkvTQlWHQDIMraqhvEteaRTkCSpixfLtQKCRONyMkUjGhdFOLOjOwCyrGPFnISIkmhwlcjZyFtKWEAzWTmlzkAxMyiwFqlwsWDSOnLPbPYIFBLSGQhjYUbaGJhVcIqwJGJoUHisGTcegePkEfwEpEhjspMhlOVzbbFYRhIXkFzDmgREmmwVEmxfxMIQAeLsJOZwUZGfQjKlbsLHadGZpqPAdvgrUPIGzjPASHLylJzNCissjgZXeaKjlpqkOKPycYHRoMjRMVSUZNZUegrEpydXLReHkOJmHUezCSxqrmbNlZDrZxoxZeLQPaCFgaZPaDovlqbfaKLqHgUOARpuHwHPrwcdlzIAHTlaMNEBjGWZxTGwqiMJAnveZHRWHFHVMjlsmSdjwEamZYRZMZvFDYqHyrqZQDuHsYHoEofYWqdgEFyHPGwgoTKrkgMHoqHoEpfkdsEkffiskSHaZwPNIUZLbKcZwCGFcyKWOfStSgFnAlJJSEPtfJXIoPokicHZeiujVpKTBKgfoiOYvedydSVZJKUJXuPyzzjUMjxzjnnCDmnyqkZQpfcMCFEDnQnqCUvTchQPWu'
input = input.split('')
require 'benchmark'

def react(letters)
  more = true
  found = nil
  offset = 0
  while more do
    more = false
    # puts "doing a pass"
    if found
      letters.delete_at(found+1)
      letters.delete_at(found)
      offset = [0, found-2].max
      found = nil
    end

    letters.each_with_index { |l, i|
      if letters[i+1] && l != letters[i+1] && (l.upcase == letters[i+1] || l.downcase == letters[i+1])
        # puts "clearing! #{l} :: #{letters[i+1]}"
        found = i 
        more = true
        break
      end
    }
  end

  letters.length
end

def compare_letters(l, i, ii)
  return !!(l[i] && l[ii] && l[i] != l[ii] && (l[i].upcase == l[ii] || l[i].downcase == l[ii]))
end


def remove_all(letters, remove)
  remove = remove.downcase
  letters.delete_if{|x| x.downcase == remove}
end

def problem2(input)
  best = 1.0/0
  best_letter = nil
  ('a'..'z').each do |l|
    puts "reacting"
    len = react(remove_all(input.dup, l))
    if len < best
      puts "better"
      best = len
      best_letter = l
    end
  end
end

def problem1_slow(input)
  react(input.dup)
end


puts Benchmark.measure {
  puts problem1_slow(input)
}
# puts "#{best_letter} :: #{best}" 
# letters.each {|l| all_letters[l] ||= true}