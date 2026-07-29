# Explore: explore_1790
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05371.view.lkml"
include: "/views/domain_23/view_05373.view.lkml"
include: "/views/domain_24/view_05374.view.lkml"
include: "/views/domain_25/view_05375.view.lkml"

explore: explore_1790 {
  label: "Explore Explore 1790"
  description: "Comprehensive analytics explore joining base view_05371 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05371
  
  always_filter: {
    filters: [view_05371.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05371.created_at_date: "7 days"]
    unless: [view_05371.id, view_05371.status]
  }

  join: view_05373 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05371.user_id} = ${view_05373.id} ;;
    required_joins: []
  }

  join: view_05374 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05371.account_id} = ${view_05374.account_id} ;;
    required_joins: [view_05373]
  }

  join: view_05375 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05371.category} = ${view_05375.category} ;;
  }

  access_filter: {
    field: view_05371.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05371.is_deleted} = false ;;
}
