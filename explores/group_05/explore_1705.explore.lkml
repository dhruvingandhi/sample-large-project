# Explore: explore_1705
# Auto-generated LookML Explore File

include: "/views/domain_16/view_05116.view.lkml"
include: "/views/domain_18/view_05118.view.lkml"
include: "/views/domain_19/view_05119.view.lkml"
include: "/views/domain_20/view_05120.view.lkml"

explore: explore_1705 {
  label: "Explore Explore 1705"
  description: "Comprehensive analytics explore joining base view_05116 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05116
  
  always_filter: {
    filters: [view_05116.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05116.created_at_date: "7 days"]
    unless: [view_05116.id, view_05116.status]
  }

  join: view_05118 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05116.user_id} = ${view_05118.id} ;;
    required_joins: []
  }

  join: view_05119 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05116.account_id} = ${view_05119.account_id} ;;
    required_joins: [view_05118]
  }

  join: view_05120 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05116.category} = ${view_05120.category} ;;
  }

  access_filter: {
    field: view_05116.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05116.is_deleted} = false ;;
}
