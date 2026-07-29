# Explore: explore_1114
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03343.view.lkml"
include: "/views/domain_45/view_03345.view.lkml"
include: "/views/domain_46/view_03346.view.lkml"
include: "/views/domain_47/view_03347.view.lkml"

explore: explore_1114 {
  label: "Explore Explore 1114"
  description: "Comprehensive analytics explore joining base view_03343 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03343
  
  always_filter: {
    filters: [view_03343.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03343.created_at_date: "7 days"]
    unless: [view_03343.id, view_03343.status]
  }

  join: view_03345 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03343.user_id} = ${view_03345.id} ;;
    required_joins: []
  }

  join: view_03346 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03343.account_id} = ${view_03346.account_id} ;;
    required_joins: [view_03345]
  }

  join: view_03347 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03343.category} = ${view_03347.category} ;;
  }

  access_filter: {
    field: view_03343.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03343.is_deleted} = false ;;
}
