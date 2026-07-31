# Update for 2000 file diff target
# Explore: explore_1838
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05515.view.lkml"
include: "/views/domain_17/view_05517.view.lkml"
include: "/views/domain_18/view_05518.view.lkml"
include: "/views/domain_19/view_05519.view.lkml"

explore: explore_1838 {
  label: "Explore Explore 1838"
  description: "Comprehensive analytics explore joining base view_05515 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05515
  
  always_filter: {
    filters: [view_05515.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05515.created_at_date: "7 days"]
    unless: [view_05515.id, view_05515.status]
  }

  join: view_05517 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05515.user_id} = ${view_05517.id} ;;
    required_joins: []
  }

  join: view_05518 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05515.account_id} = ${view_05518.account_id} ;;
    required_joins: [view_05517]
  }

  join: view_05519 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05515.category} = ${view_05519.category} ;;
  }

  access_filter: {
    field: view_05515.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05515.is_deleted} = false ;;
}
