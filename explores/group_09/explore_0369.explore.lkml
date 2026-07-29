# Explore: explore_0369
# Auto-generated LookML Explore File

include: "/views/domain_08/view_01108.view.lkml"
include: "/views/domain_10/view_01110.view.lkml"
include: "/views/domain_11/view_01111.view.lkml"
include: "/views/domain_12/view_01112.view.lkml"

explore: explore_0369 {
  label: "Explore Explore 0369"
  description: "Comprehensive analytics explore joining base view_01108 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01108
  
  always_filter: {
    filters: [view_01108.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01108.created_at_date: "7 days"]
    unless: [view_01108.id, view_01108.status]
  }

  join: view_01110 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01108.user_id} = ${view_01110.id} ;;
    required_joins: []
  }

  join: view_01111 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01108.account_id} = ${view_01111.account_id} ;;
    required_joins: [view_01110]
  }

  join: view_01112 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01108.category} = ${view_01112.category} ;;
  }

  access_filter: {
    field: view_01108.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01108.is_deleted} = false ;;
}
