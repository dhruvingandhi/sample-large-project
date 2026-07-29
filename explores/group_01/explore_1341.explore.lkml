# Explore: explore_1341
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04024.view.lkml"
include: "/views/domain_26/view_04026.view.lkml"
include: "/views/domain_27/view_04027.view.lkml"
include: "/views/domain_28/view_04028.view.lkml"

explore: explore_1341 {
  label: "Explore Explore 1341"
  description: "Comprehensive analytics explore joining base view_04024 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04024
  
  always_filter: {
    filters: [view_04024.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04024.created_at_date: "7 days"]
    unless: [view_04024.id, view_04024.status]
  }

  join: view_04026 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04024.user_id} = ${view_04026.id} ;;
    required_joins: []
  }

  join: view_04027 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04024.account_id} = ${view_04027.account_id} ;;
    required_joins: [view_04026]
  }

  join: view_04028 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04024.category} = ${view_04028.category} ;;
  }

  access_filter: {
    field: view_04024.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04024.is_deleted} = false ;;
}
