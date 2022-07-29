//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GitHub App 🐙"
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchList(username: "lysonjeada") { result in
            
            do {
                let repositories = try result.get()
                print(repositories)
                DispatchQueue.main.async {
                    self.listView.updateView(with: repositories)
                }
            }
            catch {
                
            }
        }
    }

    override func loadView() {
        self.view = listView
    }
}
