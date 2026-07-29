# Explore: explore_2254
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06763.view.lkml"
include: "/views/domain_15/view_06765.view.lkml"
include: "/views/domain_16/view_06766.view.lkml"
include: "/views/domain_17/view_06767.view.lkml"

explore: explore_2254 {
  label: "Explore Explore 2254"
  description: "Comprehensive analytics explore joining base view_06763 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06763
  
  always_filter: {
    filters: [view_06763.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06763.created_at_date: "7 days"]
    unless: [view_06763.id, view_06763.status]
  }

  join: view_06765 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06763.user_id} = ${view_06765.id} ;;
    required_joins: []
  }

  join: view_06766 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06763.account_id} = ${view_06766.account_id} ;;
    required_joins: [view_06765]
  }

  join: view_06767 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06763.category} = ${view_06767.category} ;;
  }

  access_filter: {
    field: view_06763.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06763.is_deleted} = false ;;
}
