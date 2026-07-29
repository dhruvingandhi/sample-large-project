# Explore: explore_2255
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06766.view.lkml"
include: "/views/domain_18/view_06768.view.lkml"
include: "/views/domain_19/view_06769.view.lkml"
include: "/views/domain_20/view_06770.view.lkml"

explore: explore_2255 {
  label: "Explore Explore 2255"
  description: "Comprehensive analytics explore joining base view_06766 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06766
  
  always_filter: {
    filters: [view_06766.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06766.created_at_date: "7 days"]
    unless: [view_06766.id, view_06766.status]
  }

  join: view_06768 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06766.user_id} = ${view_06768.id} ;;
    required_joins: []
  }

  join: view_06769 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06766.account_id} = ${view_06769.account_id} ;;
    required_joins: [view_06768]
  }

  join: view_06770 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06766.category} = ${view_06770.category} ;;
  }

  access_filter: {
    field: view_06766.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06766.is_deleted} = false ;;
}
