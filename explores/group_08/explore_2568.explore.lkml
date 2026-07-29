# Explore: explore_2568
# Auto-generated LookML Explore File

include: "/views/domain_05/view_07705.view.lkml"
include: "/views/domain_07/view_07707.view.lkml"
include: "/views/domain_08/view_07708.view.lkml"
include: "/views/domain_09/view_07709.view.lkml"

explore: explore_2568 {
  label: "Explore Explore 2568"
  description: "Comprehensive analytics explore joining base view_07705 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07705
  
  always_filter: {
    filters: [view_07705.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07705.created_at_date: "7 days"]
    unless: [view_07705.id, view_07705.status]
  }

  join: view_07707 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07705.user_id} = ${view_07707.id} ;;
    required_joins: []
  }

  join: view_07708 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07705.account_id} = ${view_07708.account_id} ;;
    required_joins: [view_07707]
  }

  join: view_07709 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07705.category} = ${view_07709.category} ;;
  }

  access_filter: {
    field: view_07705.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07705.is_deleted} = false ;;
}
