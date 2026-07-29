# Explore: explore_3851
# Auto-generated LookML Explore File

include: "/views/domain_04/view_11554.view.lkml"
include: "/views/domain_06/view_11556.view.lkml"
include: "/views/domain_07/view_11557.view.lkml"
include: "/views/domain_08/view_11558.view.lkml"

explore: explore_3851 {
  label: "Explore Explore 3851"
  description: "Comprehensive analytics explore joining base view_11554 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11554
  
  always_filter: {
    filters: [view_11554.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11554.created_at_date: "7 days"]
    unless: [view_11554.id, view_11554.status]
  }

  join: view_11556 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11554.user_id} = ${view_11556.id} ;;
    required_joins: []
  }

  join: view_11557 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11554.account_id} = ${view_11557.account_id} ;;
    required_joins: [view_11556]
  }

  join: view_11558 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11554.category} = ${view_11558.category} ;;
  }

  access_filter: {
    field: view_11554.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11554.is_deleted} = false ;;
}
