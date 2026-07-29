# Explore: explore_3306
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09919.view.lkml"
include: "/views/domain_21/view_09921.view.lkml"
include: "/views/domain_22/view_09922.view.lkml"
include: "/views/domain_23/view_09923.view.lkml"

explore: explore_3306 {
  label: "Explore Explore 3306"
  description: "Comprehensive analytics explore joining base view_09919 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09919
  
  always_filter: {
    filters: [view_09919.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09919.created_at_date: "7 days"]
    unless: [view_09919.id, view_09919.status]
  }

  join: view_09921 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09919.user_id} = ${view_09921.id} ;;
    required_joins: []
  }

  join: view_09922 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09919.account_id} = ${view_09922.account_id} ;;
    required_joins: [view_09921]
  }

  join: view_09923 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09919.category} = ${view_09923.category} ;;
  }

  access_filter: {
    field: view_09919.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09919.is_deleted} = false ;;
}
