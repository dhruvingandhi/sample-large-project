# Explore: explore_2341
# Auto-generated LookML Explore File

include: "/views/domain_24/view_07024.view.lkml"
include: "/views/domain_26/view_07026.view.lkml"
include: "/views/domain_27/view_07027.view.lkml"
include: "/views/domain_28/view_07028.view.lkml"

explore: explore_2341 {
  label: "Explore Explore 2341"
  description: "Comprehensive analytics explore joining base view_07024 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07024
  
  always_filter: {
    filters: [view_07024.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07024.created_at_date: "7 days"]
    unless: [view_07024.id, view_07024.status]
  }

  join: view_07026 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07024.user_id} = ${view_07026.id} ;;
    required_joins: []
  }

  join: view_07027 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07024.account_id} = ${view_07027.account_id} ;;
    required_joins: [view_07026]
  }

  join: view_07028 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07024.category} = ${view_07028.category} ;;
  }

  access_filter: {
    field: view_07024.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07024.is_deleted} = false ;;
}
