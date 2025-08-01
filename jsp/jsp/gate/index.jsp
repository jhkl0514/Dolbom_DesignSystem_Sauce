<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="theme-color" content="#000000">
    <meta name="description" content="#">
    <script src="/html/page/gate/assets/js/jquery-1_11_3_min.js"></script>
	<script type="text/javascript" src="/html/page/gate/assets/js/common.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <title>이로움</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap');

        @font-face {
            font-family: 'NanumSquareNeo';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: #eee;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            scroll-behavior: smooth;
        }

        body {
            overflow: hidden;
            background: black;
            color: white;
        }

        .eroum__title {
            position: absolute;
            display: flex;
            left: 50%;
            top: 0;
            transform: translateX(-50%);
            z-index: 5;
            justify-content: center;
            align-items: center;
            height: 30vh;
            width: 100%;
            flex-direction: column;
        }

        .eroum__title strong {
            font-family: 'Roboto';
            font-size: 8rem;
            font-weight: 900;
            text-transform: uppercase;
            white-space: nowrap;
            background: linear-gradient(135deg, #E63535 0%, #FFC324 100%);
            background-clip: text;
            transition: all 1s ease;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .eroum__title strong.ani {
            animation: titleani 3s ease;
            letter-spacing: 7rem;
            margin-left: 7rem;
            opacity: 1;
            filter: blur(0px);
            z-index: 2;
        }

        .eroum__title strong.ani:nth-child(4) {
            font-family: 'Roboto';
            font-size: 8rem;
            font-weight: 900;
            text-transform: uppercase;
            white-space: nowrap;
            color: #00000050;
            transition: all 1s ease;
            position: absolute;
            background: none;
            padding: 3rem 0 0 0;
            filter: blur(12px) !important;
            opacity: 0 !important;
            -webkit-text-fill-color: black;
            z-index: 1;
        }

        .eroum__title em {
            font-style: normal;
            font-family: 'NanumSquareNeo';
            font-weight: 500;
            letter-spacing: 1rem;
            margin-left: 1rem;
            font-size: 2rem;
            opacity: 0;
        }

        .eroum__title em.ani {
            letter-spacing: 0.1rem;
            margin-left: 0.1rem;
            animation: titleani2 3s ease;
            opacity: 1;
            filter: blur(0px);
            z-index: 2;
        }

        .eroum__title em.ani:nth-child(2) {
            letter-spacing: 0.1rem;
            margin-left: 0.1rem;
            animation: titleani2 3s ease;
            color:#00000050;
            filter: blur(8px) !important;
            opacity:0 !important;
            -webkit-text-fill-color: black;
            z-index: 1;
            position: absolute;
            margin-top: -10rem;
            margin-left: 0;
        }

        .eroum__title em.ani.show {
            margin-top: -7rem;
            margin-left: 2rem;
            filter: blur(8px);
            opacity: 0.3 !important;
            transition: 1s ease;
        }

        .eroum__title strong.ani.show {
            padding: 10rem 0 0 6rem;
            filter: blur(12px);
            opacity: 0.3 !important;
            transition: 1s ease;
        }

        @keyframes titleani {
            0%{
                letter-spacing: 15rem;
                margin-left: 15rem;
                opacity: 0;
                filter: blur(10px);
                transform: scale(1.2);
            }
            100%{
                letter-spacing: 7rem;
                margin-left: 7rem;
                opacity: 1;
                filter: blur(0px);
                transform: scale(1);
            }
        }
        @keyframes titleani2 {
            0% {
                letter-spacing: 1rem;
                margin-left: 1rem;
                opacity: 0;
                filter: blur(10px);
                }
            100% {
                letter-spacing: 0.1rem;
                margin-left: 0.1rem;
                opacity: 1;
                filter: blur(0px);
            }
        }

        .eroum__brand {
            display: flex;
            width: 100%;
            height: 100%;
            background: url(/html/page/gate/assets/images/back_brand.jpg) no-repeat center center / cover;
        }

        .txt_box {
            display: flex;
            flex-direction: column;
            pointer-events: none;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .txt_box * {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .txt_box > strong {
            font-family: 'NanumSquareNeo';
            font-size: 2.25rem;
            font-weight: 500;
            font-variation-settings: "wght" 500;
            transition: all 0.5s ease !important;
        }

        .txt_box > em {
            font-family: roboto;
            font-style: normal;
            text-transform: uppercase;
            font-size: 0.75rem;
            font-weight: 400;
            line-height: 2rem;
            transition: all 0.5s ease !important;
            letter-spacing: 0.1rem;
        }

        .eroum__market {
            display: flex;
            width: 100%;
            height: 100%;
            background: url(/html/page/gate/assets/images/back_market.jpg) no-repeat center center / cover;
        }

        .eroum__members {
            display: flex;
            width: 100%;
            height: 100%;
            background: url(/html/page/gate/assets/images/back_partners.jpg) no-repeat center center / cover;
        }

        .eroum__footer {
            position: absolute;
            bottom:0;
            width:100vw;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #333;
        }

        .eroum__footer em {
            font-family: roboto;
            font-size: 0.75rem;
            font-style: normal;
            font-weight: 500;
            color:rgba(255,255,255,0.3);
        }

        .eroum__footer em span {
            color:rgba(255,255,255,0.7);
        }

        .container {
            display: flex;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }

        .container > div {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 33.33%;
            height: calc(100% - 60px);
            transition: all 0.5s ease-in-out;
            padding-top: 20vh;
        }

        .container.on > div.on {
            width: 40%;
            z-index: 2;
            box-shadow: 0px 0px 50px 50px rgba(0,0,0,0.2);
            filter: saturate(1.2);
            opacity: 1;
            transition: all 0.5s ease-in-out;
        }

        .container.on > div {
            width: 30%;
            z-index: 1;
            filter: saturate(25%);
            opacity: 0.8;
            transition: all 0.5s ease-in-out;
        }

        .container.on > div > * {
            opacity: 0.8;
            transition: opacity 0.5s ease, text-shadow 0.5s ease;
        }

        .container.on > div.on > * {
            opacity: 1;
            transition: opacity 0.5s ease, text-shadow 0.5s ease;
        }

        .container.on > div.on .txt_box > strong {
            letter-spacing: 1rem;
            margin-left: 1rem;
            transition: all 2s ease !important;
            pointer-events: none;
        }

        .container.on > div.on .txt_box > em {
            letter-spacing: 0.4rem;
            margin-left: 0.4rem;
            transition: all 2s ease !important;
            pointer-events: none;
        }

        .eroum__brand .txt_box > i {width:120px; height:120px; background-position: center center; background-size: 70px 60px; background-repeat: no-repeat; display: flex;}
        .eroum__brand .txt_box > i {background-image: url("data:image/svg+xml,%0A%3Csvg width='70px' height='60px' viewBox='0 0 70 60' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Cg id='Page-1' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E%3Cg id='Group-2' transform='translate(-277.000000, -581.000000)' fill='%23FFFFFF'%3E%3Cpath d='M291.801668,611.29943 C302.492679,606.793242 315.676498,609.45734 318.515988,614.161602 C319.668293,616.069717 317.343873,619.555822 313.87045,618.364076 C310.390424,617.17233 308.561264,618.096676 307.075484,619.60204 C305.44773,621.25926 303.763846,626.425696 310.624847,629.287868 C315.887809,631.486491 324.954367,631.268609 331.812066,624.48787 C335.460481,620.886221 335.688301,617.28127 337.451426,615.541519 C340.039985,612.986362 343.411054,613.372606 345.395395,615.699978 C345.86094,616.241381 346.154794,616.848808 346.31988,617.502453 C347.369831,621.655409 342.981829,627.69337 340.244692,630.720604 C337.075029,634.226517 329.26643,640.61441 318.667868,640.980847 C308.062702,641.340682 300.845114,636.560492 295.479799,632.513176 C290.117784,628.472462 283.989768,622.64578 277,625.408915 C277,625.408915 281.051226,615.960776 291.554038,611.411672 C291.639883,611.372057 291.719125,611.335744 291.801668,611.29943 Z M291.642855,608.267574 C291.966425,594.788626 299.517488,580.306101 313.12723,581.025771 C328.760011,581.856098 329.117549,597.131833 329.121139,598.352563 L329.121038,598.4103 C329.12094,598.423274 329.120824,598.42989 329.120824,598.42989 L329.061393,598.515722 C332.756032,598.552035 344.219648,599.723974 346.217197,612.545977 C344.90971,611.555606 343.371103,610.981191 341.743349,610.911865 C339.451946,610.81943 337.213371,611.733873 335.430435,613.493432 C334.327657,614.58284 333.726741,615.909937 333.092809,617.312962 C332.340014,618.973484 331.560805,620.693428 329.791076,622.443084 C324.059268,628.108006 316.412454,628.586685 311.733899,626.632353 C310.433016,626.09095 308.821771,625.1567 308.547727,623.79329 C308.359528,622.862341 308.831676,621.918187 309.12553,621.621076 C309.822196,620.91131 310.485844,620.24446 312.93573,621.086276 C315.709185,622.033731 318.532167,621.264542 320.301896,619.075823 C321.857012,617.151202 322.131056,614.58284 320.982053,612.674725 C316.769042,605.695911 301.699933,604.507466 291.642855,608.267574 Z' id='Fill-2473'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); transition: 1s ease;}
        .eroum__brand.on .txt_box > i {background-image: url("data:image/svg+xml,%0A%3Csvg width='70px' height='60px' viewBox='0 0 70 60' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Cg id='Page-1' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E%3Cg id='Artboard-Copy' transform='translate(-277.000000, -581.000000)'%3E%3Cg id='Group-9' transform='translate(277.000000, 581.000000)'%3E%3Cpath d='M69.3198805,36.5024533 C69.1547938,35.8488085 68.8609396,35.241381 68.3953953,34.6999782 C66.4110538,32.3726065 63.0399846,31.9863618 60.4514261,34.5415188 C58.6883008,36.2812705 58.4604812,39.8862207 54.8120665,43.4878697 C47.9543674,50.2686095 38.8878091,50.4864911 33.624847,48.2878676 C26.7638462,45.4256955 28.4477299,40.2592604 30.0754842,38.6020397 C31.561264,37.0966759 33.390424,36.1723297 36.8704503,37.364076 C40.3438733,38.5558224 42.6682932,35.0697167 41.5159884,33.161602 C38.6764982,28.45734 25.4926791,25.7932421 14.8016682,30.2994299 C14.7191249,30.3357435 14.6398833,30.3720572 14.5540382,30.411672 C4.05122616,34.9607759 0,44.4089147 0,44.4089147 C6.98976837,41.6457798 13.1177845,47.4724622 18.4797986,51.5131756 C23.8451144,55.5604915 31.0627023,60.340682 41.6678681,59.9808472 C52.2664305,59.6144099 60.0750286,53.2265173 63.2446921,49.7206042 C65.9818286,46.6933703 70.3698315,40.6554088 69.3198805,36.5024533' id='Fill-2472' fill='%2399DB3E'%3E%3C/path%3E%3Cpath d='M43.9820527,31.6747251 C45.1310557,33.5828398 44.8570119,36.1512017 43.3018957,38.0758226 C41.5321669,40.2645424 38.7091854,41.0337305 35.9357298,40.0862756 C33.485844,39.2444603 32.8221957,39.9113101 32.1255301,40.6210759 C31.8316759,40.9181872 31.3595281,41.8623409 31.5477269,42.7932896 C31.8217707,44.1567002 33.4330163,45.0909501 34.733899,45.6323529 C39.4124544,47.5866849 47.0592676,47.1080056 52.7910758,41.4430838 C54.5608046,39.6934285 55.3400135,37.9734843 56.0928086,36.3129623 C56.7267413,34.9099368 57.3276567,33.5828398 58.4304355,32.4934317 C60.2133712,30.7338727 62.451946,29.8194302 64.7433486,29.9118648 C66.3711029,29.9811908 67.9097104,30.5556059 69.2171966,31.5459768 C67.2196482,18.7239743 55.7560319,17.5520354 52.0613929,17.5157218 L52.120824,17.4298896 C52.120824,17.4298896 52.4113765,0.89069483 36.1272303,0.0257708701 C22.5174876,-0.693898684 14.9664247,13.7886258 14.6428549,27.2675744 C24.699933,23.507466 39.7690416,24.6959111 43.9820527,31.6747251' id='Fill-2470' fill='%23FF8F15'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); transition: 1s ease;}

        .eroum__market .txt_box > i {width:120px; height:120px; background-position: center center; background-size: 120px 120px; background-repeat: no-repeat; display: flex;}
        .eroum__market .txt_box > i {background-image: url("data:image/svg+xml,%0A%3Csvg width='120px' height='120px' viewBox='0 0 120 120' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Cg id='Page-1' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E%3Cg id='Artboard-Copy' transform='translate(-902.000000, -554.000000)' fill='%23FFFFFF' fill-rule='nonzero'%3E%3Cg id='icon' transform='translate(902.000000, 554.000000)'%3E%3Cpath d='M40.7920533,97.0229337 C40.1374145,97.3715976 39.3196944,97.2723424 38.3388929,96.725168 L32.8211807,92.6564668 C31.9768453,92.0972522 31.440633,91.5655332 31.212544,91.0613096 C30.9844549,90.557086 30.9399442,89.8050335 31.0790117,88.805152 L35.4269721,45.6292535 C35.5025575,44.8822484 35.7981954,44.3400509 36.3138859,44.0026609 C36.8295765,43.6652709 37.4395506,43.6149728 38.1438082,43.8517664 L45.8414859,46.2047205 C45.2428715,46.2047205 44.7965896,46.3861446 44.5026401,46.748993 C44.2086907,47.1118414 44.0714986,47.6506519 44.0910637,48.3654247 L41.9627381,94.7950898 C41.8369204,95.9316552 41.4466921,96.6742698 40.7920533,97.0229337 Z M80.2383119,41.6465957 C81.8654161,41.2543162 83.2195957,41.4331268 84.3008509,42.1830276 C85.382106,42.9329284 85.964329,44.0971031 86.0475198,45.6755519 L90.5516966,85.2449196 C90.8405975,87.8483527 90.4614395,89.7910919 89.4142226,91.0731372 C88.3670057,92.3551825 86.4870099,93.1781908 83.7742351,93.5421621 L41.7586693,98.0244648 C43.3445997,97.8759063 44.5367507,97.3436552 45.3351224,96.4277114 C46.133494,95.5117677 46.5326798,94.2182582 46.5326798,92.5471829 L45.9009642,48.3030282 C45.894751,47.6722345 46.0214728,47.2080031 46.2811295,46.9103338 C46.5407862,46.6126645 46.9808144,46.4271764 47.6012141,46.3538694 Z M57.4560488,73.7818925 L57.3267993,73.7934487 C56.6768887,73.8847877 56.2117583,74.4538415 56.2364341,75.0958269 L56.2479904,75.2250765 C57.0761304,81.117599 62.5243039,85.2230922 68.4168264,84.3949521 L79.0861822,82.895472 C79.7794201,82.7980437 80.2624193,82.1570821 80.164991,81.4638442 C80.0675628,80.7706063 79.4266012,80.2876071 78.7333633,80.3850353 L68.1044984,81.8788248 C63.5760893,82.5152512 59.3917106,79.3783043 58.758427,74.8722576 C58.6609988,74.1790197 58.0200372,73.6960205 57.3267993,73.7934487 Z M74.8934006,52.1310666 L74.7641511,52.1426229 L64.0947953,53.6421031 C58.2022728,54.4702431 54.0967796,59.9184165 54.9249196,65.810939 C55.7530597,71.7034615 61.2012331,75.8089547 67.0937556,74.9808147 L77.7631114,73.4813345 C78.4563494,73.3839063 78.9393485,72.7429447 78.8419203,72.0497067 C78.7444921,71.3564688 78.1035305,70.8734696 77.4102925,70.9708978 L66.7814277,72.4646874 C62.2530185,73.1011138 58.0686399,69.9641668 57.4353563,65.4581202 C56.8020727,60.9520735 59.9596959,56.7832755 64.488105,56.1468491 L75.1169699,54.6530595 C75.8102079,54.5556313 76.2932071,53.9146697 76.1957788,53.2214318 C76.0983506,52.5281938 75.457389,52.0451947 74.7641511,52.1426229 Z M76.2164714,61.5452041 L76.0872218,61.5567604 L64.7902568,63.1444452 C64.0970189,63.2418735 63.6140197,63.8828351 63.7114479,64.576073 C63.8027869,65.2259836 64.3718407,65.691114 65.0138261,65.6664382 L65.1430757,65.6548819 L76.4400407,64.067197 L76.5674687,64.0426796 C77.1913862,63.8894444 77.6101885,63.2854798 77.5188496,62.6355693 C77.4214213,61.9423313 76.7804598,61.4593321 76.0872218,61.5567604 Z M66.7594982,19.023839 C72.7725435,19.023839 77.4022732,23.8812029 77.3952849,30.5491343 L77.3882649,36.6742457 C77.3882649,37.5357537 76.7578933,38.2676852 75.9068915,38.3972616 C74.8492679,38.5583566 73.8932042,37.7353714 73.8932042,36.6672416 L73.8932042,30.5491343 C73.8967063,28.1257055 73.0842273,25.9824418 71.6063559,24.5010684 C70.317596,23.2088064 68.640107,22.5259038 66.7594982,22.5259038 C61.3418039,22.5259038 56.3933863,27.9821208 56.3828801,33.9706517 L56.3828801,39.8576227 C56.3828801,40.7226327 55.7490063,41.4580663 54.8945025,41.5876427 C53.8368789,41.7487377 52.8808152,40.9257524 52.8808152,39.8576227 L52.8843173,33.9636475 C52.8983256,26.0454789 59.4156682,19.023839 66.7594982,19.023839 Z M55.839236,18 C56.796487,18 57.4810735,18.729673 57.4810735,19.6475155 C57.4810735,20.5379841 56.7125817,21.295031 55.839236,21.295031 C50.4215417,21.295031 47.1197126,25.7160788 47.1127084,31.7046097 L47.1127084,37.6579139 C47.1127084,38.526426 46.4753326,39.2618596 45.6173268,39.391436 C44.5667073,39.5455269 43.6141457,38.7330478 43.6141457,37.661416 L43.6141457,31.6976056 C43.6281539,23.779437 48.4989081,18 55.839236,18 Z' id='Shape-Copy'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); transition: 1s ease;}
        .eroum__market.on .txt_box > i {background-image: url("/html/page/gate/assets/images/icon-market@x3.png");background-size: 120px 120px;  transition: 1s ease;}

        .eroum__members .txt_box > i {width:120px; height:120px; background-position: center center; background-size: 65px 65px; background-repeat: no-repeat; display: flex;}
        .eroum__members .txt_box > i {background-image: url("data:image/svg+xml,%0A%3Csvg width='65px' height='65px' viewBox='0 0 65 65' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Cg id='Page-1' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E%3Cg id='Artboard' transform='translate(-1567.000000, -579.000000)' fill='%23FFFFFF' fill-rule='nonzero'%3E%3Cg id='Group-6' transform='translate(1280.000000, 0.000000)'%3E%3Cpath d='M313.918125,579 L311.375,592.463125 L311.375,595.436875 C311.375,598.323958 308.848125,600.666667 305.958333,600.666667 C303.068542,600.666667 300.541667,598.323958 300.541667,595.434167 L300.541667,592.463125 L308.655833,579 L313.918125,579 Z M305.652292,579 L297.833333,592.463125 L297.833333,595.436875 C297.833333,598.323958 295.306458,600.666667 292.416667,600.666667 C289.526875,600.666667 287,598.323958 287,595.434167 L287,592.463125 L300.200417,579 L305.652292,579 Z M352,595.434167 C352,598.323958 349.470417,600.666667 346.583333,600.666667 C343.69625,600.666667 341.166667,598.139792 341.166667,595.25 L341.166667,592.27625 L333.347708,579 L338.802292,579 L352,592.463125 L352,595.434167 Z M324.916667,592.270833 L324.916667,595.244583 C324.916667,598.131667 322.387083,600.666667 319.5,600.666667 C316.610208,600.666667 314.083333,598.139792 314.083333,595.25 L314.083333,592.27625 L316.918958,579 L322.078333,579 L324.916667,592.270833 Z M338.452917,592.547083 L338.452917,595.520833 C338.452917,598.410625 335.92875,600.666667 333.041667,600.666667 C330.154583,600.666667 327.625,598.139792 327.625,595.25 L327.625,592.27625 L325.081875,579 L330.344167,579 L338.452917,592.547083 Z M349.291667,606.083333 L349.292176,613.924751 C348.350958,613.318114 347.132487,612.894948 345.555133,612.811167 L345.276284,612.801268 L345.001415,612.801159 C339.45298,612.897333 336.380999,618.960496 336.245237,624.615949 C340.603304,622.986569 347.133251,623.501561 348.958889,626.525714 C349.456791,627.352564 349.338038,628.465521 348.664155,629.299523 C347.897272,630.247968 346.67398,630.581283 345.47215,630.170719 C344.410532,629.805933 344.122951,630.094901 343.821063,630.402466 C343.693726,630.531214 343.489129,630.940348 343.570682,631.343759 C343.689434,631.93457 344.38764,632.339412 344.951356,632.57402 C346.109718,633.057892 347.687978,633.197583 349.291441,632.77056 L349.291177,634.048632 C347.474885,634.455617 345.72398,634.248277 344.470767,633.724743 C341.497667,632.484468 342.22735,630.24568 342.93271,629.527551 C343.576548,628.875226 344.369184,628.474676 345.877195,628.9911 C347.382345,629.507523 348.389594,627.996877 347.890262,627.170028 C346.659816,625.131514 340.946828,623.977072 336.314056,625.929753 C336.278287,625.945489 336.243949,625.961225 336.20675,625.978391 C331.655531,627.94967 329.9,632.043863 329.9,632.043863 C332.9289,630.846505 335.584373,633.3714 337.907913,635.122376 C340.232883,636.876213 343.360504,638.947629 347.956076,638.7917 C348.41366,638.77588 348.859243,638.734158 349.292032,638.670349 L349.291667,644 L289.708333,644 L289.708333,606.083333 L349.291667,606.083333 Z M305.814453,614.516406 L304.412891,614.516406 C303.549609,614.516406 302.864062,614.686523 302.35625,615.026758 C301.848437,615.366992 301.594531,616.024609 301.594531,616.999609 L301.594531,634.671484 C301.594531,635.534766 301.7875,636.177148 302.173437,636.598633 C302.559375,637.020117 303.057031,637.230859 303.666406,637.230859 C304.296094,637.230859 304.801367,637.017578 305.182227,636.591016 C305.563086,636.164453 305.753516,635.524609 305.753516,634.671484 L305.753516,619.254297 L309.333594,633.483203 C309.455469,633.950391 309.574805,634.399805 309.691602,634.831445 C309.808398,635.263086 309.968359,635.656641 310.171484,636.012109 C310.374609,636.367578 310.658984,636.65957 311.024609,636.888086 C311.390234,637.116602 311.837109,637.230859 312.365234,637.230859 C313.066016,637.230859 313.614453,637.053125 314.010547,636.697656 C314.406641,636.342188 314.67832,635.948633 314.825586,635.516992 C314.972852,635.085352 315.163281,634.407422 315.396875,633.483203 L318.976953,619.254297 L318.976953,634.671484 C318.976953,635.524609 319.169922,636.164453 319.555859,636.591016 C319.941797,637.017578 320.434375,637.230859 321.033594,637.230859 C321.673437,637.230859 322.183789,637.017578 322.564648,636.591016 C322.945508,636.164453 323.135937,635.524609 323.135937,634.671484 L323.135937,616.999609 C323.135937,616.024609 322.882031,615.366992 322.374219,615.026758 C321.866406,614.686523 321.180859,614.516406 320.317578,614.516406 L318.916016,614.516406 C318.073047,614.516406 317.461133,614.592578 317.080273,614.744922 C316.699414,614.897266 316.417578,615.171484 316.234766,615.567578 C316.051953,615.963672 315.84375,616.608594 315.610156,617.502344 L312.365234,629.735547 L309.120312,617.502344 C308.886719,616.608594 308.678516,615.963672 308.495703,615.567578 C308.312891,615.171484 308.031055,614.897266 307.650195,614.744922 C307.269336,614.592578 306.657422,614.516406 305.814453,614.516406 Z' id='Shape'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); transition: 1s ease;}
        .eroum__members.on .txt_box > i {background-image: url("data:image/svg+xml,%0A%3Csvg width='65px' height='65px' viewBox='0 0 65 65' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Cdefs%3E%3ClinearGradient x1='17.6601562%25' y1='16.53125%25' x2='80.7851562%25' y2='81.1054688%25' id='linearGradient-rerk9hpsg6-1'%3E%3Cstop stop-color='%238CD0B9' offset='0%25'%3E%3C/stop%3E%3Cstop stop-color='%2332ACC9' offset='100%25'%3E%3C/stop%3E%3C/linearGradient%3E%3C/defs%3E%3Cg id='Page-1' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E%3Cg id='Artboard-Copy' transform='translate(-1567.000000, -579.000000)'%3E%3Cg id='Group-6' transform='translate(1280.000000, 0.000000)'%3E%3Cg id='Group-7' transform='translate(287.000000, 579.000000)'%3E%3Crect id='Rectangle' fill='%23FFFFFF' x='11' y='31' width='51.2897949' height='32'%3E%3C/rect%3E%3Cpath d='M26.918125,0 L24.375,13.463125 L24.375,16.436875 C24.375,19.3239583 21.848125,21.6666667 18.9583333,21.6666667 C16.0685417,21.6666667 13.5416667,19.3239583 13.5416667,16.4341667 L13.5416667,13.463125 L21.6558333,0 L26.918125,0 Z M18.6522917,0 L10.8333333,13.463125 L10.8333333,16.436875 C10.8333333,19.3239583 8.30645833,21.6666667 5.41666667,21.6666667 C2.526875,21.6666667 0,19.3239583 0,16.4341667 L0,13.463125 L13.2004167,0 L18.6522917,0 Z M65,16.4341667 C65,19.3239583 62.4704167,21.6666667 59.5833333,21.6666667 C56.69625,21.6666667 54.1666667,19.1397917 54.1666667,16.25 L54.1666667,13.27625 L46.3477083,0 L51.8022917,0 L65,13.463125 L65,16.4341667 Z M37.9166667,13.2708333 L37.9166667,16.2445833 C37.9166667,19.1316667 35.3870833,21.6666667 32.5,21.6666667 C29.6102083,21.6666667 27.0833333,19.1397917 27.0833333,16.25 L27.0833333,13.27625 L29.9189583,0 L35.0783333,0 L37.9166667,13.2708333 Z M51.4529167,13.5470833 L51.4529167,16.5208333 C51.4529167,19.410625 48.92875,21.6666667 46.0416667,21.6666667 C43.1545833,21.6666667 40.625,19.1397917 40.625,16.25 L40.625,13.27625 L38.081875,0 L43.3441667,0 L51.4529167,13.5470833 Z M62.2916667,27.0833333 L62.2921762,34.9247509 C61.3509583,34.3181136 60.1324867,33.8949477 58.5551331,33.8111674 L58.2762836,33.8012683 L58.0014152,33.8011593 C52.4529802,33.8973333 49.3809995,39.9604959 49.2452371,45.6159489 C53.6033043,43.9865686 60.1332514,44.5015615 61.9588895,47.5257142 C62.4567908,48.3525639 62.3380385,49.4655208 61.6641548,50.2995231 C60.8972723,51.2479684 59.6739803,51.5812832 58.4721496,51.1707194 C57.4105324,50.8059328 57.1229515,51.094901 56.8210631,51.4024662 C56.6937262,51.5312145 56.4891288,51.9403477 56.5706816,52.3437588 C56.689434,52.9345701 57.3876404,53.3394117 57.9513563,53.5740196 C59.109718,54.0578919 60.6879783,54.1975832 62.2914408,53.7705598 L62.291177,55.0486322 C60.4748849,55.455617 58.7239796,55.2482772 57.470767,54.7247426 C54.4976667,53.4844681 55.2273496,51.2456795 55.9327098,50.5275505 C56.5765477,49.8752262 57.3691837,49.4746762 58.8771952,49.9910996 C60.3823451,50.507523 61.3895937,48.9968772 60.8902616,48.1700275 C59.6598159,46.131514 53.9468276,44.9770716 49.3140562,46.929753 C49.2782875,46.9454889 49.2439494,46.9612248 49.2067499,46.9783912 C44.6555313,48.9496695 42.9,53.043863 42.9,53.043863 C45.9288996,51.8465046 48.5843733,54.3714003 50.9079127,56.1223761 C53.2328829,57.876213 56.3605043,59.9476289 60.9560762,59.7917005 C61.4136603,59.7758798 61.8592432,59.7341576 62.2920324,59.6703495 L62.2916667,65 L2.70833333,65 L2.70833333,27.0833333 L62.2916667,27.0833333 Z M18.8144531,35.5164063 L17.4128906,35.5164063 C16.5496094,35.5164063 15.8640625,35.6865234 15.35625,36.0267578 C14.8484375,36.3669922 14.5945313,37.0246094 14.5945313,37.9996094 L14.5945313,55.6714844 C14.5945313,56.5347656 14.7875,57.1771484 15.1734375,57.5986328 C15.559375,58.0201172 16.0570313,58.2308594 16.6664063,58.2308594 C17.2960938,58.2308594 17.8013672,58.0175781 18.1822266,57.5910156 C18.5630859,57.1644531 18.7535156,56.5246094 18.7535156,55.6714844 L18.7535156,40.2542969 L22.3335938,54.4832031 C22.4554688,54.9503906 22.5748047,55.3998047 22.6916016,55.8314453 C22.8083984,56.2630859 22.9683594,56.6566406 23.1714844,57.0121094 C23.3746094,57.3675781 23.6589844,57.6595703 24.0246094,57.8880859 C24.3902344,58.1166016 24.8371094,58.2308594 25.3652344,58.2308594 C26.0660156,58.2308594 26.6144531,58.053125 27.0105469,57.6976563 C27.4066406,57.3421875 27.6783203,56.9486328 27.8255859,56.5169922 C27.9728516,56.0853516 28.1632813,55.4074219 28.396875,54.4832031 L31.9769531,40.2542969 L31.9769531,55.6714844 C31.9769531,56.5246094 32.1699219,57.1644531 32.5558594,57.5910156 C32.9417969,58.0175781 33.434375,58.2308594 34.0335938,58.2308594 C34.6734375,58.2308594 35.1837891,58.0175781 35.5646484,57.5910156 C35.9455078,57.1644531 36.1359375,56.5246094 36.1359375,55.6714844 L36.1359375,37.9996094 C36.1359375,37.0246094 35.8820313,36.3669922 35.3742188,36.0267578 C34.8664063,35.6865234 34.1808594,35.5164063 33.3175781,35.5164063 L31.9160156,35.5164063 C31.0730469,35.5164063 30.4611328,35.5925781 30.0802734,35.7449219 C29.6994141,35.8972656 29.4175781,36.1714844 29.2347656,36.5675781 C29.0519531,36.9636719 28.84375,37.6085938 28.6101563,38.5023438 L25.3652344,50.7355469 L22.1203125,38.5023438 C21.8867188,37.6085938 21.6785156,36.9636719 21.4957031,36.5675781 C21.3128906,36.1714844 21.0310547,35.8972656 20.6501953,35.7449219 C20.2693359,35.5925781 19.6574219,35.5164063 18.8144531,35.5164063 Z' id='Shape' fill='url(%23linearGradient-rerk9hpsg6-1)' fill-rule='nonzero'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E"); transition: 1s ease;}

        .container div span.desc {display: inline-block;flex-direction: column;opacity: 0;transition: 1s ease;height: auto;position: relative;margin-left:2rem;margin-top: 1rem;margin-bottom: 3rem;padding-left:0.3rem;line-height: 1.4rem;font-family: 'NanumSquareNeo';font-weight: 100;min-height: 4rem;font-variation-settings: "wght" 100;}
        .container div.eroum__brand span.desc::before {display: none;}
        .container div span.desc strong {font-weight: 500;font-variation-settings: "wght" 700;}
        .container .ani.on span.desc {opacity: 1; transition: 0.5s ease;}
        .container div span.desc * {display: inline;}
        span.desc::before {content: ''; position: absolute; left:0; top:0; border-right:0.5px solid #fff; height:100%; width:0;}
        .container div.txt_box a {display: flex;position: relative;width: 200px;height: 38px;border-radius: 19px;border: 0.5px solid #fff;color: #fff;text-decoration: none; font-family: 'NanumSquareNeo'; font-weight: 200;font-variation-settings: "wght" 200; font-size:12px; pointer-events: all; transition: 0.5s ease; backdrop-filter: blur(5px); opacity: 0;}
        .container > div.on > div.txt_box a {opacity: 1; transition: 1s ease;}
        .container div.txt_box a strong {position: relative; left:-10px; opacity: 0; transition: 0.5s ease;}
        .container div.txt_box a i {display: flex; position: absolute; left:50%; top:50%; transform: translate(-50%,-50%); width:30px; height: 20px; transition: 1s ease;}
        .container div.txt_box a i span {transform-origin: left; width:7px; height:0; position: absolute; border-top:0.5px solid #fff; top:50%;}
        .container div.txt_box a i span:nth-child(1) {transform: rotate(-135deg); left:20px;}
        .container div.txt_box a i span:nth-child(2) {transform: rotate(-180deg); width:11px; left:20px;}
        .container div.txt_box a i span:nth-child(3) {transform: rotate(135deg); left:20px;}
        .container div.txt_box a:hover {background-color: #fff; transition: 1s ease;}
        .container div.txt_box a:hover strong {opacity: 1; left:0; transition: 1s ease; color:#333;}
        .container div.txt_box a:hover i {left:65%; transition: 0.5s ease;}
        .container div.txt_box a:hover i span:nth-child(1) {transform: rotate(-135deg); left:30px;border-top:0.5px solid #333; animation: sline-o 1s ease;}
        .container div.txt_box a:hover i span:nth-child(2) {transform: rotate(-180deg); width:11px; left:30px;border-top:0.5px solid #333; animation: sline-c 1s ease;}
        .container div.txt_box a:hover i span:nth-child(3) {transform: rotate(135deg); left:30px;border-top:0.5px solid #333; animation: sline-o 1s ease;}

        .container div.eroum__brand a.btn {top:-6rem;}

        .container > div::after {content:'';position: absolute; left:0; right:0; bottom:0; height:80%; background-image: linear-gradient(178deg, rgba(0,0,0,0.00) 9%, rgba(0,0,0,0.60) 80%); z-index: 0; opacity: 0; transition: 0.5s ease;}
        .container > div.on::after {opacity: 1; transition: 1s ease;}

        @keyframes sline-c {
            0% {width:11px; left:20px;border-top:0.5px solid #fff;}
            60% {width:21px; left:30px;border-top:0.5px solid #333;}
            100% {width:11px; left:30px;border-top:0.5px solid #333;}
        }
        @keyframes sline-o {
            0% {width:7px; left:20px;border-top:0.5px solid #fff;}
            60% {width:5px; left:30px;border-top:0.5px solid #333;}
            100% {width:7px; left:30px;border-top:0.5px solid #333;}
        }

        @media (max-width: 768px) {
            body {overflow-y: scroll; overflow-x: hidden;}
            .eroum__title em:nth-child(2),
            .eroum__title strong:nth-child(4) {display: none;}
            .eroum__title strong.ani {letter-spacing: 5rem;animation: titleani-m 3s ease; margin-left: 5rem;}
            @keyframes titleani-m {
            0%{letter-spacing: 15rem;margin-left:15rem;opacity: 0;filter: blur(10px);transform: scale(1.2);}
            100%{letter-spacing: 5rem;margin-left:5rem;opacity: 1;filter: blur(0px);transform: scale(1);}
            }
            .eroum__title em {font-size: 3rem; white-space: nowrap;}
            .eroum__title {transform: scale(0.3) translate(-50%,-50%); margin:-2rem -9rem;}
            .EroumApp {width:100vw;overflow: hidden;}
            .txt_box {position: absolute;left: 50%;transform: translate(-50%, -50%) scale(0.3); width:100vw; opacity: 0; transition: 1s ease;}
            div.eroum__brand .txt_box {top:80%;}
            div.eroum__market .txt_box {top:65%;}
            div.eroum__members .txt_box {top:40%;}
            .container.on div.eroum__brand.on .txt_box {top:80%;}
            .container.on div.eroum__market.on .txt_box {top: 50%;}
            .container.on div.eroum__members.on .txt_box {top: 52%;}
            .container > div .txt_box {transition: 1s ease;}
            .container.on > div.on .txt_box {top:55%; transition: 1s ease;}
            .container {flex-direction: column;}
            .container > div {width:100% !important; height:0vh; padding-top:0;}
            .container.on > div.on {width:100% !important;}
            .container > div.eroum__members .txt_box {top:70%;}
            .container > div.eroum__brand {height:calc(90vh);}
            .container div span.desc {margin-left: -4rem;}
            .container.on > div.eroum__brand.on {width:100% !important;filter:none !important; height:calc(100vh - 50vh - 110px);}
            .container.on > div * {opacity: 1;}
            .eroum__brand {background: url(/html/page/gate/assets/images/back_brand.jpg) no-repeat center 50% / 100% auto;}
            .eroum__market {background: url(/html/page/gate/assets/images/back_market.jpg) no-repeat center 75% / 100% auto;}
            .eroum__members {background: url(/html/page/gate/assets/images/back_partners.jpg) no-repeat center 10% / 100% auto;}
            .eroum__footer {height:40px;}
            .txt_box > em {line-height: 2rem; font-size: 1rem; font-weight: 300;font-variation-settings: "wght" 300;}
            .txt_box > strong {font-weight: 500;font-variation-settings: "wght" 500;}
            .txt_box > a.btn {margin:-1rem auto 0 auto;}
            .eroum__footer {position: relative; bottom:auto;}
            .txt_box.ani {transform: translate(-50%, -50%) scale(0.65);opacity: 1;}
            .container > div {transition:all 2s ease;}
            .container > div.eroum__brand.ani {height: calc(100vh - 50vh - 110px);}
            .container > div.eroum__market.ani {height: calc(35vh);}
            .container > div.eroum__members.ani {height:calc(35vh);}
            .container.on > div.on {background-size: 120% auto;transition: all 2s ease;}
            .container.on > div.eroum__brand.on .txt_box {top: 79%;transition: 1s ease;}
            .eroum__title em.ani.show {margin-top: -1rem;margin-left: 3rem;}
            .eroum__title strong.ani.show {padding:15rem 0 0 7rem;}
            .eroum__title em.ani:nth-child(2) {filter: blur(12px) !important;}
            .eroum__title strong.ani:nth-child(4) {filter: blur(20px) !important;}
            .container > div.eroum__brand .txt_box {top:90%;}
            .container div.eroum__brand a.btn {top: -6rem;}
            .container div.on a.btn {transform: scale(1.3); transition: 1s ease;}
            .eroum__brand .txt_box > i,
            .eroum__market .txt_box > i,
            .eroum__members .txt_box > i {height:90px;}

            .container.on div.on div.txt_box a {background-color: #fff; transition: 1s ease;}
            .container.on div.on div.txt_box a strong {opacity: 1; left:0; transition: 2s ease; color:#333;}
            .container.on div.on div.txt_box a i {left:65%; transition: 2s ease;}
            .container.on div.on div.txt_box a i span:nth-child(1) {transform: rotate(-135deg); left:30px;border-top:0.5px solid #333; animation: sline-o 1.5s ease;}
            .container.on div.on div.txt_box a i span:nth-child(2) {transform: rotate(-180deg); width:11px; left:30px;border-top:0.5px solid #333; animation: sline-c 1.5s ease;}
            .container.on div.on div.txt_box a i span:nth-child(3) {transform: rotate(135deg); left:30px;border-top:0.5px solid #333; animation: sline-o 1.5s ease;}
        }
    </style>
    <script>
        $(document).ready(function() {
            $('.container, .container > div').on('mouseover mouseenter', function() {
                $(this).addClass('on');
            });

            $('.container, .container > div').on('mouseout mouseleave', function() {
                $(this).removeClass('on');
            });

            $('.container > div').addClass('ani');

            $('.container > div.eroum__brand').on('transitionend animationend',function(){
                $('.eroum__brand .txt_box').addClass('ani');
                setTimeout(function() {
                    $('.eroum__market .txt_box').addClass('ani');
                },200)
                setTimeout(function() {
                    $('.eroum__members .txt_box').addClass('ani');
                },400)
            });

            $('.eroum__title em').one('transitionend animationend',function() {
                $('.eroum__title > em:nth-child(2),.eroum__title > strong:nth-child(4)').addClass('show');
            });
        });
    </script>
</head>
<body>
    <div class="EroumApp">
        <div class="header">
            <div class="eroum__title">
                <em class="ani">시니어 라이프 케어 플랫폼</em>
                <em class="ani">시니어 라이프 케어 플랫폼</em>
                <strong class="ani">e・roum</strong>
                <strong class="ani">e・roum</strong>
            </div>
        </div>
        <div class="container">
            <div class="eroum__brand">
                <div class="txt_box">
                    <strong>이&nbsp;&nbsp;로&nbsp;&nbsp;움</strong>
                    <em>e・roum brand</em>
                    <i></i>
                    <span class="desc"></span>
                    <a class="btn" href="/brand">
                        <span class="rbtn"><strong>바로가기</strong> <i><span></span><span></span><span></span></i></span>
                    </a>
                </div>
            </div>
            <div class="eroum__market">
                <div class="txt_box">
                    <strong>이로움 마켓</strong>
                    <em>e・roum market</em>
                    <i></i>
                    <span class="desc">
                        복지용구 <strong>사업소와 수급자 매칭</strong>부터<br>
                        시니어를 위한 제품과 정보를 <strong>편리하고 신속하게 찾아주는</strong><br>
                        <strong>국내 유일 시니어 전문 마켓</strong>입니다.
                    </span>
                    <a class="btn" href="/market">
                        <span class="rbtn"><strong>바로가기</strong> <i><span></span><span></span><span></span></i></span>
                    </a>
                </div>
            </div>
            <div class="eroum__members">
                <div class="txt_box">
                    <strong>이로움 멤버스</strong>
                    <em>e・roum members</em>
                    <i></i>
                    <span class="desc">
                        <strong>시니어의 가치를 높이고</strong><br>
                        건강하고 능동적인 삶을 위하여<br>
                        다양한 분야의 <strong>2,000여개 파트너</strong>가 이로움과 함께하고 있습니다.
                    </span>
                    <a class="btn" href="/members">
                        <span class="rbtn"><strong>바로가기</strong> <i><span></span><span></span><span></span></i></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="eroum__footer">
                <em>COPYRIGHT ⓒ <span>E&middot;ROUM</span>. ALL RIGHTS RESERVED.</em>
            </div>
        </div>
    </div>
    <div style="display: block; width:0; height:0; overflow: hidden;z-index: -1;left:-10000px; top:-10000px;">
        <img src="/html/page/gate/assets/images/icon-market@x3.png" alt="">
    </div>
</body>
</html>