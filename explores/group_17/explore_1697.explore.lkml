# Explore: explore_1697
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05092.view.lkml"
include: "/views/domain_44/view_05094.view.lkml"
include: "/views/domain_45/view_05095.view.lkml"
include: "/views/domain_46/view_05096.view.lkml"

explore: explore_1697 {
  label: "Explore Explore 1697"
  description: "Comprehensive analytics explore joining base view_05092 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05092
  
  always_filter: {
    filters: [view_05092.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05092.created_at_date: "7 days"]
    unless: [view_05092.id, view_05092.status]
  }

  join: view_05094 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05092.user_id} = ${view_05094.id} ;;
    required_joins: []
  }

  join: view_05095 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05092.account_id} = ${view_05095.account_id} ;;
    required_joins: [view_05094]
  }

  join: view_05096 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05092.category} = ${view_05096.category} ;;
  }

  access_filter: {
    field: view_05092.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05092.is_deleted} = false ;;
}
