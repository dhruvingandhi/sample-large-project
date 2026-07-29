# Explore: explore_0026
# Auto-generated LookML Explore File

include: "/views/domain_29/view_00079.view.lkml"
include: "/views/domain_31/view_00081.view.lkml"
include: "/views/domain_32/view_00082.view.lkml"
include: "/views/domain_33/view_00083.view.lkml"

explore: explore_0026 {
  label: "Explore Explore 0026"
  description: "Comprehensive analytics explore joining base view_00079 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00079
  
  always_filter: {
    filters: [view_00079.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00079.created_at_date: "7 days"]
    unless: [view_00079.id, view_00079.status]
  }

  join: view_00081 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00079.user_id} = ${view_00081.id} ;;
    required_joins: []
  }

  join: view_00082 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00079.account_id} = ${view_00082.account_id} ;;
    required_joins: [view_00081]
  }

  join: view_00083 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00079.category} = ${view_00083.category} ;;
  }

  access_filter: {
    field: view_00079.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00079.is_deleted} = false ;;
}
