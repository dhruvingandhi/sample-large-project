# Explore: explore_2704
# Auto-generated LookML Explore File

include: "/views/domain_13/view_08113.view.lkml"
include: "/views/domain_15/view_08115.view.lkml"
include: "/views/domain_16/view_08116.view.lkml"
include: "/views/domain_17/view_08117.view.lkml"

explore: explore_2704 {
  label: "Explore Explore 2704"
  description: "Comprehensive analytics explore joining base view_08113 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08113
  
  always_filter: {
    filters: [view_08113.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08113.created_at_date: "7 days"]
    unless: [view_08113.id, view_08113.status]
  }

  join: view_08115 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08113.user_id} = ${view_08115.id} ;;
    required_joins: []
  }

  join: view_08116 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08113.account_id} = ${view_08116.account_id} ;;
    required_joins: [view_08115]
  }

  join: view_08117 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08113.category} = ${view_08117.category} ;;
  }

  access_filter: {
    field: view_08113.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08113.is_deleted} = false ;;
}
