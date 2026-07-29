# Explore: explore_1914
# Auto-generated LookML Explore File

include: "/views/domain_43/view_05743.view.lkml"
include: "/views/domain_45/view_05745.view.lkml"
include: "/views/domain_46/view_05746.view.lkml"
include: "/views/domain_47/view_05747.view.lkml"

explore: explore_1914 {
  label: "Explore Explore 1914"
  description: "Comprehensive analytics explore joining base view_05743 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05743
  
  always_filter: {
    filters: [view_05743.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05743.created_at_date: "7 days"]
    unless: [view_05743.id, view_05743.status]
  }

  join: view_05745 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05743.user_id} = ${view_05745.id} ;;
    required_joins: []
  }

  join: view_05746 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05743.account_id} = ${view_05746.account_id} ;;
    required_joins: [view_05745]
  }

  join: view_05747 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05743.category} = ${view_05747.category} ;;
  }

  access_filter: {
    field: view_05743.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05743.is_deleted} = false ;;
}
