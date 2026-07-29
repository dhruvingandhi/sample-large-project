# Explore: explore_2553
# Auto-generated LookML Explore File

include: "/views/domain_10/view_07660.view.lkml"
include: "/views/domain_12/view_07662.view.lkml"
include: "/views/domain_13/view_07663.view.lkml"
include: "/views/domain_14/view_07664.view.lkml"

explore: explore_2553 {
  label: "Explore Explore 2553"
  description: "Comprehensive analytics explore joining base view_07660 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07660
  
  always_filter: {
    filters: [view_07660.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07660.created_at_date: "7 days"]
    unless: [view_07660.id, view_07660.status]
  }

  join: view_07662 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07660.user_id} = ${view_07662.id} ;;
    required_joins: []
  }

  join: view_07663 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07660.account_id} = ${view_07663.account_id} ;;
    required_joins: [view_07662]
  }

  join: view_07664 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07660.category} = ${view_07664.category} ;;
  }

  access_filter: {
    field: view_07660.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07660.is_deleted} = false ;;
}
