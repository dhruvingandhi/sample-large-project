# Explore: explore_3213
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09640.view.lkml"
include: "/views/domain_42/view_09642.view.lkml"
include: "/views/domain_43/view_09643.view.lkml"
include: "/views/domain_44/view_09644.view.lkml"

explore: explore_3213 {
  label: "Explore Explore 3213"
  description: "Comprehensive analytics explore joining base view_09640 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09640
  
  always_filter: {
    filters: [view_09640.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09640.created_at_date: "7 days"]
    unless: [view_09640.id, view_09640.status]
  }

  join: view_09642 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09640.user_id} = ${view_09642.id} ;;
    required_joins: []
  }

  join: view_09643 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09640.account_id} = ${view_09643.account_id} ;;
    required_joins: [view_09642]
  }

  join: view_09644 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09640.category} = ${view_09644.category} ;;
  }

  access_filter: {
    field: view_09640.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09640.is_deleted} = false ;;
}
