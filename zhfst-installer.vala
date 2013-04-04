/**
 * A small GUI app to install and view installed linguistic automata 
 * collections. 
 */

using Xml;
using Archive;
using Gtk;

public class ZHfstLoaderDialog: Gtk.Window 
  {
    public ZHfstLoaderDialog()
      {
        this.title = "ZHfst Loader";
        this.border_width = 10;
        this.window_position = WindowPosition.CENTER;
        this.set_default_size(350, 70);
        this.destroy.connect(Gtk.main_quit);
        var toolbar = new Toolbar();
        toolbar.get_style_context().add_class (STYLE_CLASS_PRIMARY_TOOLBAR);
        var open_button = new ToolButton.from_stock(Stock.OPEN);
        open_button.is_important = true;
        toolbar.add(open_button);
        open_button.clicked.connect(on_open_clicked);
        var path_label = new Label("Path: ")
        var size_label = new Label("Size: ")
        add(path_label);
        add(size_label);
      }

    private void on_open_clicked () 
      {
        var file_chooser = new FileChooserDialog("Open File", this,
                                      FileChooserAction.OPEN,
                                      Stock.CANCEL, ResponseType.CANCEL,
                                      Stock.OPEN, ResponseType.ACCEPT);
        if (file_chooser.run() == ResponseType.ACCEPT) {
            open_zhfst(file_chooser.get_filename());
        }
        file_chooser.destroy();
      }

    private void open_file(string filename) 
      {
        try 
          {
            // unzip and parse
            var f = File.new_for_path(filename);
            if (!f.query_exists())
              {
                stderr.printf("Could not find %s", f.get_path());
              }
            else
              {
                self.title = "ZHfstInstaller " + f.get_path();
              }
             // Determine the size of file as well as other attributes
            var file_info = file.query_info ("*", FileQueryInfoFlags.NONE);
            path_label.text = "File size: " + file_info.get_size() + " bytes\n";
          }
        catch (Error e) 
          {
            stderr.printf("Error: %s\n", e.message);
          }
      }
  }

int
main(string[] args)
  {
    Gtk.init(ref args);
    for (arg in args)
      {
        zhfst_file_names += arg;
      }
    var window = new ZHfstLoaderDialog;
  }
