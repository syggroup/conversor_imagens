/*
 *   $Id: import_img.prg 2147 2012-04-07 02:15:31Z leonardo $
 */

#include "common.ch"

#pragma /w2
#pragma /es2

#define FIF_BMP      0
#define FIF_ICO      1
#define FIF_JPEG     2
#define FIF_PNG     13
#define FIF_TIFF    18
#define FIF_GIF     25
#define FIF_PSD     20

#define BMP_DEFAULT         0
#define ICO_DEFAULT         0
#define JPEG_DEFAULT        0
#define PNG_DEFAULT        0
#define TIFF_DEFAULT        0
#define GIF_DEFAULT         0
#define PSD_DEFAULT         0

#define PS_SOLID 0
#define RGB( nR,nG,nB ) ( nR + ( nG * 256 ) + ( nB * 256 * 256 ) )
#define BLACK RGB( 0x0 ,0x0 ,0x0 )
#define BLUE RGB( 0x0 ,0x0 ,0x85 )
#define GREEN RGB( 0x0 ,0x85,0x0 )
#define CYAN RGB( 0x0 ,0x85,0x85 )
#define RED RGB( 0x85,0x0 ,0x0 )
#define MAGENTA RGB( 0x85,0x0 ,0x85 )
#define BROWN RGB( 0x85,0x85,0x0 )
#define WHITE RGB( 0xC6,0xC6,0xC6 )

Function main(cARQ,cSALVA,cTIPO)
LOCAL clone, im, cEXT_ARQ:=''
DEFAULT cSALVA TO "temp.bmp"
DEFAULT cTIPO TO "bmp"

IF cARQ=nIL
   Return Nil
else
   IF !file(cARQ)
      Return Nil
   endif
ENDIF
cEXT_ARQ:= Subs(cARQ,RAT(".",cARQ)+1)
IF LOWER(cEXT_ARQ) = "bmp"
   im := fi_Load( FIF_BMP, cARQ, BMP_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "ico"
   im := fi_Load( FIF_ICO, cARQ, ICO_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "jpg"
   im := fi_Load( FIF_JPEG, cARQ, JPEG_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "png"
   im := fi_Load( FIF_PNG, cARQ , PNG_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "tiff"
   im := fi_Load( FIF_TIFF, cARQ , TIFF_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "tif"
   im := fi_Load( FIF_TIFF, cARQ , TIFF_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "gif"
   im := fi_Load( FIF_GIF, cARQ , GIF_DEFAULT )
ELSEIF LOWER(cEXT_ARQ) = "psd"
   im := fi_Load( FIF_PSD, cARQ , PSD_DEFAULT )
ENDIF
IF LOWER(cTIPO)="bmp"
   fi_Save( FIF_BMP, im, cSALVA ,  BMP_DEFAULT  )
else
   fi_Save( FIF_JPEG, im, cSALVA ,  JPEG_DEFAULT  )
endif
clone := fi_Clone( im )
fi_unload(im)
QUIT
RETURN NIL
