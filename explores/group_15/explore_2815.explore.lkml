# Explore: explore_2815
# Auto-generated LookML Explore File

include: "/views/domain_46/view_08446.view.lkml"
include: "/views/domain_48/view_08448.view.lkml"
include: "/views/domain_49/view_08449.view.lkml"
include: "/views/domain_50/view_08450.view.lkml"

explore: explore_2815 {
  label: "Explore Explore 2815"
  description: "Comprehensive analytics explore joining base view_08446 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08446
  
  always_filter: {
    filters: [view_08446.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08446.created_at_date: "7 days"]
    unless: [view_08446.id, view_08446.status]
  }

  join: view_08448 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08446.user_id} = ${view_08448.id} ;;
    required_joins: []
  }

  join: view_08449 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08446.account_id} = ${view_08449.account_id} ;;
    required_joins: [view_08448]
  }

  join: view_08450 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08446.category} = ${view_08450.category} ;;
  }

  access_filter: {
    field: view_08446.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08446.is_deleted} = false ;;
}
