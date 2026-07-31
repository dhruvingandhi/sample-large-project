# Update for 2000 file diff target
# Explore: explore_1030
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03091.view.lkml"
include: "/views/domain_43/view_03093.view.lkml"
include: "/views/domain_44/view_03094.view.lkml"
include: "/views/domain_45/view_03095.view.lkml"

explore: explore_1030 {
  label: "Explore Explore 1030"
  description: "Comprehensive analytics explore joining base view_03091 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03091
  
  always_filter: {
    filters: [view_03091.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03091.created_at_date: "7 days"]
    unless: [view_03091.id, view_03091.status]
  }

  join: view_03093 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03091.user_id} = ${view_03093.id} ;;
    required_joins: []
  }

  join: view_03094 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03091.account_id} = ${view_03094.account_id} ;;
    required_joins: [view_03093]
  }

  join: view_03095 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03091.category} = ${view_03095.category} ;;
  }

  access_filter: {
    field: view_03091.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03091.is_deleted} = false ;;
}
