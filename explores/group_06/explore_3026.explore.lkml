# Explore: explore_3026
# Auto-generated LookML Explore File

include: "/views/domain_29/view_09079.view.lkml"
include: "/views/domain_31/view_09081.view.lkml"
include: "/views/domain_32/view_09082.view.lkml"
include: "/views/domain_33/view_09083.view.lkml"

explore: explore_3026 {
  label: "Explore Explore 3026"
  description: "Comprehensive analytics explore joining base view_09079 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09079
  
  always_filter: {
    filters: [view_09079.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09079.created_at_date: "7 days"]
    unless: [view_09079.id, view_09079.status]
  }

  join: view_09081 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09079.user_id} = ${view_09081.id} ;;
    required_joins: []
  }

  join: view_09082 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09079.account_id} = ${view_09082.account_id} ;;
    required_joins: [view_09081]
  }

  join: view_09083 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09079.category} = ${view_09083.category} ;;
  }

  access_filter: {
    field: view_09079.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09079.is_deleted} = false ;;
}
