# Explore: explore_1208
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03625.view.lkml"
include: "/views/domain_27/view_03627.view.lkml"
include: "/views/domain_28/view_03628.view.lkml"
include: "/views/domain_29/view_03629.view.lkml"

explore: explore_1208 {
  label: "Explore Explore 1208"
  description: "Comprehensive analytics explore joining base view_03625 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03625
  
  always_filter: {
    filters: [view_03625.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03625.created_at_date: "7 days"]
    unless: [view_03625.id, view_03625.status]
  }

  join: view_03627 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03625.user_id} = ${view_03627.id} ;;
    required_joins: []
  }

  join: view_03628 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03625.account_id} = ${view_03628.account_id} ;;
    required_joins: [view_03627]
  }

  join: view_03629 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03625.category} = ${view_03629.category} ;;
  }

  access_filter: {
    field: view_03625.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03625.is_deleted} = false ;;
}
