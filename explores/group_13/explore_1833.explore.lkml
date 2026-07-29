# Explore: explore_1833
# Auto-generated LookML Explore File

include: "/views/domain_50/view_05500.view.lkml"
include: "/views/domain_02/view_05502.view.lkml"
include: "/views/domain_03/view_05503.view.lkml"
include: "/views/domain_04/view_05504.view.lkml"

explore: explore_1833 {
  label: "Explore Explore 1833"
  description: "Comprehensive analytics explore joining base view_05500 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05500
  
  always_filter: {
    filters: [view_05500.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05500.created_at_date: "7 days"]
    unless: [view_05500.id, view_05500.status]
  }

  join: view_05502 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05500.user_id} = ${view_05502.id} ;;
    required_joins: []
  }

  join: view_05503 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05500.account_id} = ${view_05503.account_id} ;;
    required_joins: [view_05502]
  }

  join: view_05504 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05500.category} = ${view_05504.category} ;;
  }

  access_filter: {
    field: view_05500.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05500.is_deleted} = false ;;
}
