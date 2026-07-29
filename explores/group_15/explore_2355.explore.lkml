# Explore: explore_2355
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07066.view.lkml"
include: "/views/domain_18/view_07068.view.lkml"
include: "/views/domain_19/view_07069.view.lkml"
include: "/views/domain_20/view_07070.view.lkml"

explore: explore_2355 {
  label: "Explore Explore 2355"
  description: "Comprehensive analytics explore joining base view_07066 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07066
  
  always_filter: {
    filters: [view_07066.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07066.created_at_date: "7 days"]
    unless: [view_07066.id, view_07066.status]
  }

  join: view_07068 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07066.user_id} = ${view_07068.id} ;;
    required_joins: []
  }

  join: view_07069 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07066.account_id} = ${view_07069.account_id} ;;
    required_joins: [view_07068]
  }

  join: view_07070 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07066.category} = ${view_07070.category} ;;
  }

  access_filter: {
    field: view_07066.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07066.is_deleted} = false ;;
}
