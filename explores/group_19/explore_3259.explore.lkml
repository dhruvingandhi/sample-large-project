# Explore: explore_3259
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09778.view.lkml"
include: "/views/domain_30/view_09780.view.lkml"
include: "/views/domain_31/view_09781.view.lkml"
include: "/views/domain_32/view_09782.view.lkml"

explore: explore_3259 {
  label: "Explore Explore 3259"
  description: "Comprehensive analytics explore joining base view_09778 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09778
  
  always_filter: {
    filters: [view_09778.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09778.created_at_date: "7 days"]
    unless: [view_09778.id, view_09778.status]
  }

  join: view_09780 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09778.user_id} = ${view_09780.id} ;;
    required_joins: []
  }

  join: view_09781 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09778.account_id} = ${view_09781.account_id} ;;
    required_joins: [view_09780]
  }

  join: view_09782 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09778.category} = ${view_09782.category} ;;
  }

  access_filter: {
    field: view_09778.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09778.is_deleted} = false ;;
}
