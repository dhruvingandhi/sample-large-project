# Explore: explore_3404
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10213.view.lkml"
include: "/views/domain_15/view_10215.view.lkml"
include: "/views/domain_16/view_10216.view.lkml"
include: "/views/domain_17/view_10217.view.lkml"

explore: explore_3404 {
  label: "Explore Explore 3404"
  description: "Comprehensive analytics explore joining base view_10213 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10213
  
  always_filter: {
    filters: [view_10213.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10213.created_at_date: "7 days"]
    unless: [view_10213.id, view_10213.status]
  }

  join: view_10215 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10213.user_id} = ${view_10215.id} ;;
    required_joins: []
  }

  join: view_10216 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10213.account_id} = ${view_10216.account_id} ;;
    required_joins: [view_10215]
  }

  join: view_10217 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10213.category} = ${view_10217.category} ;;
  }

  access_filter: {
    field: view_10213.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10213.is_deleted} = false ;;
}
