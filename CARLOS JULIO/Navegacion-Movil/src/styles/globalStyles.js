import { StyleSheet } from 'react-native';

// Estos estilos se usan en varias pantallas para que el diseno se mantenga igual.
const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f4f6f5',
  },
  container: {
    flexGrow: 1,
    padding: 18,
    gap: 14,
  },
  keyboardContainer: {
    flex: 1,
  },
  listScreen: {
    flex: 1,
    padding: 18,
    gap: 14,
  },
  title: {
    color: '#17332b',
    fontSize: 26,
    fontWeight: '700',
  },
  subtitle: {
    color: '#17332b',
    fontSize: 18,
    fontWeight: '700',
  },
  text: {
    color: '#3d4f4a',
    fontSize: 15,
    lineHeight: 22,
  },
  result: {
    color: '#17332b',
    fontSize: 16,
    fontWeight: '600',
    marginTop: 4,
  },
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 8,
    padding: 14,
    gap: 12,
    borderWidth: 1,
    borderColor: '#d9e4df',
  },
  buttonGroup: {
    gap: 10,
  },
  primaryButton: {
    backgroundColor: '#2f7d63',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  secondaryButton: {
    backgroundColor: '#4f6fb5',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  darkButton: {
    backgroundColor: '#30363d',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  detailButton: {
    backgroundColor: '#805f2e',
    borderRadius: 8,
    padding: 13,
    alignItems: 'center',
  },
  buttonText: {
    color: '#ffffff',
    fontSize: 15,
    fontWeight: '700',
  },
  modalBackground: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.45)',
    justifyContent: 'center',
    padding: 20,
  },
  modalBox: {
    backgroundColor: '#ffffff',
    borderRadius: 8,
    padding: 18,
    gap: 14,
  },
  pickerBox: {
    borderWidth: 1,
    borderColor: '#c8d6d0',
    borderRadius: 8,
    overflow: 'hidden',
    backgroundColor: '#ffffff',
  },
  selectButton: {
    backgroundColor: '#ffffff',
    borderWidth: 1,
    borderColor: '#c8d6d0',
    borderRadius: 8,
    padding: 14,
  },
  selectButtonText: {
    color: '#17332b',
    fontSize: 16,
    fontWeight: '600',
  },
  optionButton: {
    backgroundColor: '#f4f6f5',
    borderRadius: 8,
    padding: 13,
  },
  optionText: {
    color: '#17332b',
    fontSize: 16,
    fontWeight: '600',
  },
  input: {
    backgroundColor: '#ffffff',
    borderWidth: 1,
    borderColor: '#c8d6d0',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
  },
  grid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
  },
  calcButton: {
    width: '48%',
    minHeight: 48,
    backgroundColor: '#4f6fb5',
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
  },
  listContent: {
    gap: 10,
    paddingBottom: 24,
  },
  list: {
    flex: 1,
  },
  loadingBox: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 12,
  },
  listItem: {
    backgroundColor: '#ffffff',
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#d9e4df',
    padding: 14,
  },
  listText: {
    color: '#17332b',
    fontSize: 16,
  },
});

export default styles;