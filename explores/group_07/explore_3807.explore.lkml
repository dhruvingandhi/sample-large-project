# Explore: explore_3807
# Auto-generated LookML Explore File

include: "/views/domain_22/view_11422.view.lkml"
include: "/views/domain_24/view_11424.view.lkml"
include: "/views/domain_25/view_11425.view.lkml"
include: "/views/domain_26/view_11426.view.lkml"

explore: explore_3807 {
  label: "Explore Explore 3807"
  description: "Comprehensive analytics explore joining base view_11422 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11422
  
  always_filter: {
    filters: [view_11422.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11422.created_at_date: "7 days"]
    unless: [view_11422.id, view_11422.status]
  }

  join: view_11424 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11422.user_id} = ${view_11424.id} ;;
    required_joins: []
  }

  join: view_11425 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11422.account_id} = ${view_11425.account_id} ;;
    required_joins: [view_11424]
  }

  join: view_11426 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11422.category} = ${view_11426.category} ;;
  }

  access_filter: {
    field: view_11422.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11422.is_deleted} = false ;;
}
