import React, {useState} from "react";
import {Helmet} from "react-helmet";
import {useNavigate} from "react-router-dom";
import styles from "./NewProject.module.css";

function NewProject() {
  const [projectTitle, setProjectTitle] = useState("");
  const [collaborator, setCollaborator] = useState([]);
  const [projectDescription, setProjectDescription] = useState("");
  const [selectedFile, setSelectedFile] = useState([]);
  const [selectedFileURL, setSelectedFileURL] = useState([]);
  const [primaryTag, setPrimaryTag] = useState("");

  let navigate = useNavigate();

  function handleFileChange(e) {
    setSelectedFile([]);
    setSelectedFileURL([]);
    Array.from(e.target.files).forEach((file) => {
      setSelectedFile((files) => [...files, file]);
      if (file) {
        setSelectedFileURL((urls) => [...urls, URL.createObjectURL(file)]);
      }
    });
  }

  function removePreview(e) {
    selectedFileURL.splice(selectedFileURL.indexOf(e.target.src), 1);
    selectedFile.splice(selectedFileURL.indexOf(e.target.src), 1);
    e.target.remove();
  }

  let handleSubmit = async (e) => {
    e.preventDefault();

    const data = new FormData();
    selectedFile.forEach((file) => {
      data.append("file[]", file);
    });
    data.append("primaryTag", primaryTag);
    data.append("projectTitle", projectTitle);
    data.append("projectDescription", projectDescription);
    data.append("collaborator", collaborator);
    data.append("loggedId", localStorage.getItem("loggedId"));

    let res = await fetch(`${process.env.REACT_APP_URL}/uploadFile.php`, {
      method: "POST",
      body: data,
    });

    let resJson = await res.json();

    if (resJson.res) {
      alert("Votre projet a été ajouté avec succès");
      navigate("/", {replace: true});
    } else {
      alert("Une erreur est survenue");
    }
  };

  return (
    <>
      <Helmet>
        <title>Coordinate | Nouveau projet</title>
      </Helmet>
      <section className={styles.newProject}>
        <form onSubmit={handleSubmit} className={styles.form}>
          <div className={styles.fileInput}>
            <div className={styles.fileText}>
              <label className={styles.required}>
                Importer les images du projet
              </label>
              <p>Drag and drop</p>
            </div>
            <input
              type="file"
              multiple
              onChange={(e) => handleFileChange(e)}
              accept="image/*"
              required
            />
          </div>
          <div className={styles.info}>
            <div className={styles.input}>
              <label className={styles.required}>Titre du projet</label>
              <input
                type="text"
                onChange={(e) => setProjectTitle(e.target.value)}
                required
              />
            </div>
            <div className={styles.input}>
              <label className={styles.required}>Tag primaire</label>
              <div
                className={styles.primaryTag}
                onChange={(e) => setPrimaryTag(e.target.value)}
              >
                <div className={styles.primaryTagButton}>
                  <input
                    type="radio"
                    id="design"
                    value="design"
                    name="tag"
                    required
                  />
                  <label for="design">design</label>
                </div>
                <div className={styles.primaryTagButton}>
                  <input
                    type="radio"
                    id="development"
                    value="development"
                    name="tag"
                    required
                  />
                  <label for="development">development</label>
                </div>
                <div className={styles.primaryTagButton}>
                  <input
                    type="radio"
                    id="management"
                    value="management"
                    name="tag"
                    required
                  />
                  <label for="management">chef de projet</label>
                </div>
              </div>
            </div>
            <div className={styles.input}>
              <label>Collaborateur</label>
              <input
                type="text"
                onChange={(e) => setCollaborator(e.target.value)}
              />
            </div>
            <div className={styles.input}>
              <label className={styles.required}>Description</label>
              <textarea
                onChange={(e) => setProjectDescription(e.target.value)}
                required
              />
            </div>
            <input type="submit" />
          </div>
        </form>

        <div className={styles.imagePreview}>
          {selectedFileURL.map((url, index) => (
            <img
              src={url}
              key={index}
              alt="Preview"
              onClick={(e) => removePreview(e)}
            />
          ))}
        </div>
      </section>
    </>
  );
}

export default NewProject;
