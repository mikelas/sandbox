//
//  Shader.fsh
//  sandbox
//
//  Created by mikelas on 11/09/04.
//  Copyright GTE 2011. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
