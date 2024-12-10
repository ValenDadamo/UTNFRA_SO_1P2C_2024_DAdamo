# 1. paquete

sudo mkdir -p /ruta/a/paquete/{carta/{emisor,receptor},cheque/{emisor,monto,receptor}}

'''
paquete/
├── carta/
│   ├── emisor/
│   └── receptor/
└── cheque/
    ├── emisor/
    ├── monto/
    └── receptor/
'''


# 2. epoca

sudo mkdir -p /ruta/a/epoca/{antigua/{eventos,personas},moderna/{eventos,personas,tecnologia}}

'''
epoca/
├── antigua/
│   ├── eventos/
│   └── personas/
└── moderna/
    ├── eventos/
    ├── personas/
    └── tecnologia/
'''


# 3. materias

sudo mkdir -p /ruta/a/Materias/{alumnos/{notas,Parciales_{1..3}},profesores/{Parciales_{1..3}}}

'''
Materias/
├── alumnos/
│   ├── notas/
│   ├── Parciales_1/
│   ├── Parciales_2/
│   └── Parciales_3/
└── profesores/
    ├── Parciales_1/
    ├── Parciales_2/
    └── Parciales_3/
'''


# 4. matematicos

sudo mkdir -p /ruta/a/matematica/{conjeturas/{incognitas,matematicos},teoremas/{matematicos,soluciones}}

'''
matematica/
├── conjeturas/
│   ├── incognitas/
│   └── matematicos/
└── teoremas/
    ├── matematicos/
    └── soluciones/
'''