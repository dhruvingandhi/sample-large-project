# Explore: explore_2537
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07612.view.lkml"
include: "/views/domain_14/view_07614.view.lkml"
include: "/views/domain_15/view_07615.view.lkml"
include: "/views/domain_16/view_07616.view.lkml"

explore: explore_2537 {
  label: "Explore Explore 2537"
  description: "Comprehensive analytics explore joining base view_07612 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07612
  
  always_filter: {
    filters: [view_07612.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07612.created_at_date: "7 days"]
    unless: [view_07612.id, view_07612.status]
  }

  join: view_07614 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07612.user_id} = ${view_07614.id} ;;
    required_joins: []
  }

  join: view_07615 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07612.account_id} = ${view_07615.account_id} ;;
    required_joins: [view_07614]
  }

  join: view_07616 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07612.category} = ${view_07616.category} ;;
  }

  access_filter: {
    field: view_07612.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07612.is_deleted} = false ;;
}
