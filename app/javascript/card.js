const pay = () => {
    //環境変数をもとに公開鍵を復号
    const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
    //elementsインスタンスを生成
    const elements = payjp.elements();
    //入力欄ごとにelementインスタンスを生成
    const numberElement = elements.create('cardNumber')
    const cvcElement = elements.create('cardCvc')
    const expiryElement = elements.create('cardExpiry')
    //入力欄をDOM上に表示
    numberElement.mount('#number')
    cvcElement.mount('#cvc')
    expiryElement.mount('#exp-date')
    //フォームの要素を取得
    const form = document.getElementById("charge-form");
    //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
    form.addEventListener("submit", (e) => {
        e.preventDefault();
        payjp.createToken(expiryElement).then((response) => {
            if (response.error) {}
            const token = response.id;
            const renderDom = document.getElementById("charge-form");
            const tokenObj = `<input value=${token} name='token' type="hidden"> `;
            renderDom.insertAdjacentHTML("beforeend", tokenObj);
            document.getElementById("charge-form").submit();
        });
    });
};

window.addEventListener("load", pay);

/* payjp v1終了に伴い、v2APIへ切り替えの為

const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵, 環境変数にて処理
    const submit = document.getElementById("button"); //送信ボタンの要素を取得
    submit.addEventListener("click", (e) => {
        e.preventDefault();

        const formResult = document.getElementById("charge-form");
        const formData = new FormData(formResult);

        // 生成したFormDataオブジェクトから、クレジットカードに関する情報を取得し、変数cardに代入するオブジェクトとして定義
        const card = {
            number: formData.get("credit_card_payment[number]"),
            cvc: formData.get("credit_card_payment[cvc]"),
            exp_month: formData.get("credit_card_payment[exp_month]"),
            exp_year: `20${formData.get("credit_card_payment[exp_year]")}`
        };
        //// 生成したFormDataオブジェクトから、クレジットカードに関する情報を取得し、変数cardに代入するオブジェクトとして定義

        // カードの情報をトークン化 
        Payjp.createToken(card, (status, response) => {
            if (status == 200) {
                // HTTPステータスコードが200のとき(うまく処理が完了したときだけ)、トークンの値を取得
                const token = response.id;
                const renderDom = document.getElementById("charge-form");
                const tokenObj = `<input value=${token} name='token' type="hidden"> `;
                renderDom.insertAdjacentHTML("beforeend", tokenObj);
            }
            //// カードの情報をトークン化

            // フォームに存在するクレジットカードの各情報を削除
            document
                .getElementById("credit_card_payment_number")
                .removeAttribute("name");
            document
                .getElementById("credit_card_payment_cvc")
                .removeAttribute("name");
            document
                .getElementById("credit_card_payment_exp_month")
                .removeAttribute("name");
            document
                .getElementById("credit_card_payment_exp_year")
                .removeAttribute("name");
            //// フォームに存在するクレジットカードの各情報を削除

            document.getElementById("charge-form").submit(); //フォームの情報をサーバーサイドに送信

        });
    });
};

window.addEventListener("load", pay);

*/