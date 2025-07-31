[[Self Attention]]  => english words attend to other english words 
**Cross Attention** => french words attend to english words `for english => french`
- different vocabs for french/english
- use french word decoder queries, but english encoder keys/values
- compute french -> english word similarity
- multiply english values by that similarity
youtu.be/JXY5CmiK3LI?t=9423
This also works for text-token vs image-token cross attention