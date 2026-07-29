# Explore: explore_0376
# Auto-generated LookML Explore File

include: "/views/domain_29/view_01129.view.lkml"
include: "/views/domain_31/view_01131.view.lkml"
include: "/views/domain_32/view_01132.view.lkml"
include: "/views/domain_33/view_01133.view.lkml"

explore: explore_0376 {
  label: "Explore Explore 0376"
  description: "Comprehensive analytics explore joining base view_01129 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01129
  
  always_filter: {
    filters: [view_01129.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01129.created_at_date: "7 days"]
    unless: [view_01129.id, view_01129.status]
  }

  join: view_01131 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01129.user_id} = ${view_01131.id} ;;
    required_joins: []
  }

  join: view_01132 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01129.account_id} = ${view_01132.account_id} ;;
    required_joins: [view_01131]
  }

  join: view_01133 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01129.category} = ${view_01133.category} ;;
  }

  access_filter: {
    field: view_01129.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01129.is_deleted} = false ;;
}
