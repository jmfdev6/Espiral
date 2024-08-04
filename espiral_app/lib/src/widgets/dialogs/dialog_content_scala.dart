import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:espiral_app/src/controllers/calendar_controller.dart';
import '../../models/user_model.dart';
import '../inputs/custom_textfield.dart';

class DialogContentScala extends StatefulWidget {
  DialogContentScala({super.key});

  @override
  State<DialogContentScala> createState() => _DialogContentScalaState();
}

class _DialogContentScalaState extends State<DialogContentScala> {
  final _tituloControllers = TextEditingController();
  final _descricaoControllers = TextEditingController();
  final _inicioControllers = TextEditingController();
  final _finalControllers = TextEditingController();
  final _andressController = TextEditingController();
  
  List<User> _users = [
    User(id: 1, name: " Priscila",cargo:'Nutricionista', image: '', valorHora: '65'),
    User(id: 2, name: "Shody", image: '', cargo: 'Medico familiar', valorHora: '150'),
    User(id: 3, name: "Carol", image: '', cargo: 'Enfermeira', valorHora: '130'),
    User(id: 4, name: "Gabriel", image: '', cargo: 'Socorrista', valorHora: '100'),
  ];

  List<User> _selectedUsers = [];
  
  @override
  void dispose() {
    _tituloControllers.dispose();
    _descricaoControllers.dispose();
    _inicioControllers.dispose();
    _finalControllers.dispose();
    super.dispose();
  }

  void saveData() {
    final Map<String, dynamic> data = {
      'titulo': _tituloControllers.text,
      'descricao': _descricaoControllers.text,
      'inicio': _inicioControllers.text,
      'final': _finalControllers.text,
      'adress' : _andressController.text,
      'profissionais': _selectedUsers,
    };
 


    // Adiciona o evento à data selecionada
    CalendarController.addEvent(CalendarController.selectedDay.value, data);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Titulo',
              inputType: TextInputType.name,
              controller: _tituloControllers,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _descricaoControllers,
              label: 'Descrição',
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
             Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectTime(context, _inicioControllers),
                    child: AbsorbPointer(
                      child: CustomTextField(
                        controller: _inicioControllers,
                        label: 'Inicio',
                        inputType: TextInputType.datetime,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 11),
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectTime(context, _finalControllers),
                    child: AbsorbPointer(
                      child: CustomTextField(
                        controller: _finalControllers,
                        label: 'Final',
                        inputType: TextInputType.datetime,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            CustomTextField(
              label: 'endereço', 
              inputType: TextInputType.streetAddress, 
              controller: _andressController
            ),
            SizedBox(height: 12),
            Column(
              
              children: [
                MultiSelectDialogField(
                  itemsTextStyle: TextStyle(
                    color: Colors.grey
                  ),
                  searchable: true,
                  items: _users.map((user) => MultiSelectItem<User>(user, user.name)).toList(),
                  title: Text("Profissionais"),
                  selectedColor: Colors.purple,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  buttonIcon: Icon(Icons.person),
                  buttonText: Text("Selecione os profissionais"),
                  onConfirm: (results) {
                    setState(() {
                      _selectedUsers = results.cast<User>();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Salvar"),
                onPressed: saveData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 Future<void> selectTime(BuildContext context, TextEditingController controller) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    DateTime.now();
    final formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(picked);
    controller.text = formattedTime;
  }
}