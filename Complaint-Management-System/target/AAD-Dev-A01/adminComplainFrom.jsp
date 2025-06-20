<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="lk.ijse.CMS.model.Complaint" %>

<%
    Complaint comp = (Complaint) request.getAttribute("complaint");
    boolean isEditMode = (comp != null);
    String pageTitle = isEditMode ? "Edit Complaint" : "Add Complaint";
    String heading = isEditMode ? "Edit Complaint #" + comp.getId() : "Submit New Complaint";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= pageTitle %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #0c0101;
        }

        .card {
            border: none;
            border-radius: 12px;
        }

        .disabled-input {
            background-color: #8eb7df;
            border-radius: 6px;
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: #495057;
            display: flex;
            align-items: center;
        }

        .section-title i {
            margin-right: 8px;
            color: #0d6efd;
        }

        .admin-section {
            background-color: #eef1f5;
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
        }

        .form-label i {
            margin-right: 6px;
            color: #198754;
        }

        .btn-success {
            background-color: #198754;
            border: none;
        }

        .btn-success:hover {
            background-color: #157347;
        }

        .btn-outline-secondary:hover {
            background-color: #dee2e6;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card shadow mx-auto" style="max-width: 750px;">
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">
                <i class="bi bi-pencil-square me-2"></i>
                <%= heading %>
            </h4>
        </div>
        <div class="card-body">
            <form action="complaints" method="post">
                <!-- Hidden Fields for Action -->
                <input type="hidden" name="action" value="<%= isEditMode ? "update" : "create" %>">
                <% if (isEditMode) { %>
                <input type="hidden" name="id" value="<%= comp.getId() %>">
                <% } %>

                <!-- Title -->
                <div class="mb-3">
                    <label for="title" class="form-label"><i class="bi bi-tag"></i> Title</label>
                    <input type="text" class="form-control disabled-input" id="title" name="title"
                           value="<%= isEditMode ? comp.getTitle() : "" %>" disabled>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label for="description" class="form-label"><i class="bi bi-file-text"></i> Description</label>
                    <textarea class="form-control disabled-input" id="description" name="description" rows="4" disabled><%= isEditMode ? comp.getDescription() : "" %></textarea>
                </div>

                <!-- Admin Section -->
                <div class="admin-section">
                    <div class="section-title"><i class="bi bi-gear-fill"></i> Admin Section</div>

                    <!-- Status -->
                    <div class="mb-3">
                        <label for="status" class="form-label"><i class="bi bi-check-circle"></i> Status</label>
                        <select class="form-select" id="status" name="status">
                            <option value="Submitted" <%= isEditMode && "Submitted".equals(comp.getStatus()) ? "selected" : "" %>>Submitted</option>
                            <option value="In Progress" <%= isEditMode && "In Progress".equals(comp.getStatus()) ? "selected" : "" %>>In Progress</option>
                            <option value="Resolved" <%= isEditMode && "Resolved".equals(comp.getStatus()) ? "selected" : "" %>>Resolved</option>
                        </select>
                    </div>

                    <!-- Remarks -->
                    <div class="mb-3">
                        <label for="remarks" class="form-label"><i class="bi bi-chat-dots"></i> Remarks</label>
                        <textarea class="form-control" id="remarks" name="remarks" rows="3"><%= isEditMode ? comp.getRemarks() : "" %></textarea>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-end mt-4">
                    <a href="dashboard" class="btn btn-outline-secondary me-2">
                        <i class="bi bi-x-circle"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-success">
                        <i class="bi bi-save2"></i> Save Complaint
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
