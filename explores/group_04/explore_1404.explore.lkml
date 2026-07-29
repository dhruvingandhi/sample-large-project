# Explore: explore_1404
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04213.view.lkml"
include: "/views/domain_15/view_04215.view.lkml"
include: "/views/domain_16/view_04216.view.lkml"
include: "/views/domain_17/view_04217.view.lkml"

explore: explore_1404 {
  label: "Explore Explore 1404"
  description: "Comprehensive analytics explore joining base view_04213 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04213
  
  always_filter: {
    filters: [view_04213.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04213.created_at_date: "7 days"]
    unless: [view_04213.id, view_04213.status]
  }

  join: view_04215 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04213.user_id} = ${view_04215.id} ;;
    required_joins: []
  }

  join: view_04216 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04213.account_id} = ${view_04216.account_id} ;;
    required_joins: [view_04215]
  }

  join: view_04217 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04213.category} = ${view_04217.category} ;;
  }

  access_filter: {
    field: view_04213.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04213.is_deleted} = false ;;
}
