# Explore: explore_0456
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01369.view.lkml"
include: "/views/domain_21/view_01371.view.lkml"
include: "/views/domain_22/view_01372.view.lkml"
include: "/views/domain_23/view_01373.view.lkml"

explore: explore_0456 {
  label: "Explore Explore 0456"
  description: "Comprehensive analytics explore joining base view_01369 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01369
  
  always_filter: {
    filters: [view_01369.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01369.created_at_date: "7 days"]
    unless: [view_01369.id, view_01369.status]
  }

  join: view_01371 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01369.user_id} = ${view_01371.id} ;;
    required_joins: []
  }

  join: view_01372 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01369.account_id} = ${view_01372.account_id} ;;
    required_joins: [view_01371]
  }

  join: view_01373 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01369.category} = ${view_01373.category} ;;
  }

  access_filter: {
    field: view_01369.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01369.is_deleted} = false ;;
}
