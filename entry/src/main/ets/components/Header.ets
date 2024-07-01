import router from '@ohos.router'
@Component
 export  struct  Header{
  private  title:ResourceStr
  @State params: any = router.getParams()
  build(){
    Row(){
      Image($r('app.media.icon'))
        .width(30)
        .onClick(()=>{
          router.showAlertBeforeBackPage({
            message:'支付还没有完成'
          })
          router.back()
         // let params: any = router.getParams()
         //  params.id
        })
      if(this.params && this.title){
        Text(this.params.id +'-'+this.title)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      Blank()
      Image($r('app.media.icon'))
        .width(30)
    }
    .width('100%')
    .height(30)
    // .margin({bottom:20})
  }
}
